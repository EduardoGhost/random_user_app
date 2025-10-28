import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final String gender;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String firstName;

  @HiveField(4)
  final String lastName;

  @HiveField(5)
  final String email;

  @HiveField(6)
  final String phone;

  @HiveField(7)
  final String cell;

  @HiveField(8)
  final String country;

  @HiveField(9)
  final String state;

  @HiveField(10)
  final String city;

  @HiveField(11)
  final String streetName;

  @HiveField(12)
  final int streetNumber;

  @HiveField(13)
  final String postcode;

  @HiveField(14)
  final String pictureLarge;

  @HiveField(15)
  final String pictureMedium;

  @HiveField(16)
  final String pictureThumbnail;

  @HiveField(17)
  final DateTime dateOfBirth;

  @HiveField(18)
  final int age;

  User({
    required this.uuid,
    required this.gender,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.cell,
    required this.country,
    required this.state,
    required this.city,
    required this.streetName,
    required this.streetNumber,
    required this.postcode,
    required this.pictureLarge,
    required this.pictureMedium,
    required this.pictureThumbnail,
    required this.dateOfBirth,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final location = json['location'];
    final street = location['street'];
    final picture = json['picture'];
    final dob = json['dob'];

    return User(
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
