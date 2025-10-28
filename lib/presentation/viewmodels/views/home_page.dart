import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:random_user_app/data/datasources/user_data_source.dart';

import '../../../data/repositories/user_repository_impl.dart';
import '../user_viewmodel.dart';
import 'details_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserViewModel viewModel;

  @override
  void initState() {
    super.initState();

    final repository = UserRepositoryImpl(UserDataSource());
    viewModel = UserViewModel(repository);

    viewModel.loadPersistedUsers();
    viewModel.startAutoFetch();
  }

  @override
  void dispose() {
    viewModel.stopAutoFetch();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Users'),
      ),
      body: Observer(
        builder: (_) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return Center(child: Text(viewModel.errorMessage!));
          }

          final users = viewModel.persistedUsers.isNotEmpty
              ? viewModel.persistedUsers
              : viewModel.users;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) {
              final user = users[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsPage(user: user, viewModel: viewModel),
                    ),
                  );
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.pictureThumbnail),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
              );

            },
          );

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final box = await Hive.openBox('users');
          await box.clear();
          viewModel.persistedUsers.clear();
          print('Banco limpo!');
        },
        child: const Icon(Icons.delete),
        tooltip: 'Limpar Hive',
      ),
    );
  }
}

