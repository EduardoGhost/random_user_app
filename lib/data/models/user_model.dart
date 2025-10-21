import '../../domain/entity/user.dart';

class UserModel extends User {
  UserModel({
    required String uuid,
    required String gender,
    required String title,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String cell,
    required String country,
    required String state,
    required String city,
    required String streetName,
    required int streetNumber,
    required String postcode,
    required String pictureLarge,
    required String pictureMedium,
    required String pictureThumbnail,
    required DateTime dateOfBirth,
    required int age,
  }) : super(
    uuid: uuid,
    gender: gender,
    title: title,
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
    cell: cell,
    country: country,
    state: state,
    city: city,
    streetName: streetName,
    streetNumber: streetNumber,
    postcode: postcode,
    pictureLarge: pictureLarge,
    pictureMedium: pictureMedium,
    pictureThumbnail: pictureThumbnail,
    dateOfBirth: dateOfBirth,
    age: age,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final location = json['location'];
    final street = location['street'];
    final picture = json['picture'];
    final dob = json['dob'];

    return UserModel(
      uuid: json['login']['uuid'],
      gender: json['gender'],
      title: name['title'],
      firstName: name['first'],
      lastName: name['last'],
      email: json['email'],
      phone: json['phone'],
      cell: json['cell'],
      country: location['country'],
      state: location['state'],
      city: location['city'],
      streetName: street['name'],
      streetNumber: street['number'],
      postcode: location['postcode'].toString(),
      pictureLarge: picture['large'],
      pictureMedium: picture['medium'],
      pictureThumbnail: picture['thumbnail'],
      dateOfBirth: DateTime.parse(dob['date']),
      age: dob['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': {'uuid': uuid},
      'gender': gender,
      'name': {'title': title, 'first': firstName, 'last': lastName},
      'email': email,
      'phone': phone,
      'cell': cell,
      'location': {
        'country': country,
        'state': state,
        'city': city,
        'street': {'name': streetName, 'number': streetNumber},
        'postcode': postcode,
      },
      'picture': {
        'large': pictureLarge,
        'medium': pictureMedium,
        'thumbnail': pictureThumbnail,
      },
      'dob': {
        'date': dateOfBirth.toIso8601String(),
        'age': age,
      },
    };
  }
}
