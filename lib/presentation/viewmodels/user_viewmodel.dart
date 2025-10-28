import 'package:mobx/mobx.dart';
import '../../domain/entity/user.dart';
import '../../domain/repositories/user_repository_interface.dart';
import 'package:flutter/scheduler.dart';

part 'user_viewmodel.g.dart';

class UserViewModel = _UserViewModelBase with _$UserViewModel;

abstract class _UserViewModelBase with Store {
  final UserRepositoryInterface repository;
  Ticker? _ticker;
  Duration _elapsed = Duration.zero;

  _UserViewModelBase(this.repository);

  @observable
  ObservableList<User> users = ObservableList<User>();

  @observable
  ObservableList<User> persistedUsers = ObservableList<User>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchUsers() async {
    try {
      isLoading = true;
      final fetchedUsers = await repository.fetchUsers();
      users.addAll(fetchedUsers);
      isLoading = false;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
    }
  }

  @action
  Future<void> saveUser(User user) async {
    await repository.saveUser(user);
    persistedUsers.add(user);
  }

  @action
  Future<void> removeUser(User user) async {
    await repository.removeUser(user.uuid);
    persistedUsers.removeWhere((u) => u.uuid == user.uuid);
  }

  @action
  Future<void> loadPersistedUsers() async {
    final list = await repository.getPersistedUsers();
    persistedUsers = ObservableList<User>.of(list);
  }

  void startAutoFetch() {
    _ticker = Ticker((elapsed) async {
      final diff = elapsed - _elapsed;
      if (diff.inSeconds >= 5) {
        _elapsed = elapsed;
        await _fetchAndPersistOneUser();
      }
    });
    _ticker!.start();
  }

  void stopAutoFetch() {
    _ticker?.stop();
    _ticker?.dispose();
  }

  Future<void> _fetchAndPersistOneUser() async {
    try {
      final fetched = await repository.fetchUsers();
      if (fetched.isNotEmpty) {
        final user = fetched.first;
        await saveUser(user);
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }
}
