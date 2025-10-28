import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../domain/entity/user.dart';
import '../user_viewmodel.dart';
import 'details_page.dart';

class PersistedPage extends StatelessWidget {
  final UserViewModel viewModel;

  const PersistedPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários Persistidos'),
      ),
      body: Observer(
        builder: (_) {
          final users = viewModel.persistedUsers;

          if (users.isEmpty) {
            return const Center(child: Text('Nenhum usuário persistido.'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) {
              final User user = users[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.pictureThumbnail),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Remove user
                    viewModel.removeUser(user);
                  },
                ),
                onTap: () {
                  // vai para detalhes do usuário
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsPage(user: user, viewModel: viewModel),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
