import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:random_user_app/utils/date_formater.dart';
import '../../../domain/entity/user.dart';
import '../user_viewmodel.dart';

class DetailsPage extends StatelessWidget {
  final User user;
  final UserViewModel viewModel;

  const DetailsPage({super.key, required this.user, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) {
            final isPersisted = viewModel.persistedUsers.any((u) => u.uuid == user.uuid);

            return ListView(
              children: [
                Image.network(
                  user.pictureLarge,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                )
                ,
                const SizedBox(height: 16),
                Text('Name: ${user.title} ${user.firstName} ${user.lastName}'),
                Text('Email: ${user.email}'),
                Text('Phone: ${user.phone}'),
                Text('Cell: ${user.cell}'),
                Text('Country: ${user.country}'),
                Text('State: ${user.state}'),
                Text('City: ${user.city}'),
                Text('Street: ${user.streetName}, ${user.streetNumber}'),
                Text('Postcode: ${user.postcode}'),
                Text('Data de nascimento: ${DateFormater.formatDate(user.dateOfBirth)}'),
               // Text('Date of Birth: ${user.dateOfBirth.toLocal()}'),
                Text('Age: ${user.age}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (isPersisted) {
                      await viewModel.removeUser(user);
                    } else {
                      await viewModel.saveUser(user);
                    }
                  },
                  child: Text(isPersisted ? 'Remover Usuário persistido' : 'Salvar Usuário localmente'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
