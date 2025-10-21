class User {
  final String uuid;
  final String gender;
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String cell;
  final String country;
  final String state;
  final String city;
  final String streetName;
  final int streetNumber;
  final String postcode;
  final String pictureLarge;
  final String pictureMedium;
  final String pictureThumbnail;
  final DateTime dateOfBirth;
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