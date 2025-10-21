// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserViewModel on _UserViewModelBase, Store {
  late final _$usersAtom =
      Atom(name: '_UserViewModelBase.users', context: context);

  @override
  ObservableList<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$persistedUsersAtom =
      Atom(name: '_UserViewModelBase.persistedUsers', context: context);

  @override
  ObservableList<User> get persistedUsers {
    _$persistedUsersAtom.reportRead();
    return super.persistedUsers;
  }

  @override
  set persistedUsers(ObservableList<User> value) {
    _$persistedUsersAtom.reportWrite(value, super.persistedUsers, () {
      super.persistedUsers = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_UserViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_UserViewModelBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchUsersAsyncAction =
      AsyncAction('_UserViewModelBase.fetchUsers', context: context);

  @override
  Future<void> fetchUsers() {
    return _$fetchUsersAsyncAction.run(() => super.fetchUsers());
  }

  late final _$saveUserAsyncAction =
      AsyncAction('_UserViewModelBase.saveUser', context: context);

  @override
  Future<void> saveUser(User user) {
    return _$saveUserAsyncAction.run(() => super.saveUser(user));
  }

  late final _$removeUserAsyncAction =
      AsyncAction('_UserViewModelBase.removeUser', context: context);

  @override
  Future<void> removeUser(User user) {
    return _$removeUserAsyncAction.run(() => super.removeUser(user));
  }

  late final _$loadPersistedUsersAsyncAction =
      AsyncAction('_UserViewModelBase.loadPersistedUsers', context: context);

  @override
  Future<void> loadPersistedUsers() {
    return _$loadPersistedUsersAsyncAction
        .run(() => super.loadPersistedUsers());
  }

  @override
  String toString() {
    return '''
users: ${users},
persistedUsers: ${persistedUsers},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
