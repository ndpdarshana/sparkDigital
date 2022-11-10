import 'package:equatable/equatable.dart';

enum Gender { male, female }

class AppUser extends Equatable {
  final String? id;
  final String name;
  final int birthYear;
  final Gender gender;
  final String email;

  const AppUser({
    this.id,
    required this.name,
    required this.birthYear,
    required this.gender,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, birthYear, gender, email];

  factory AppUser.fromMap(Map<String, dynamic> data) {
    Gender gender = Gender.male;
    if (data['gender'] == 'female') {
      gender = Gender.female;
    }

    return AppUser(
      id: data['uid'],
      name: data['name'],
      birthYear: data['birthYear'],
      gender: gender,
      email: data['email'],
    );
  }

  Map<String, dynamic> toMap() {
    String genderStr = 'male';
    if (gender == Gender.female) {
      genderStr = 'female';
    }

    return {
      'name': name,
      'email': email,
      'birthYear': birthYear,
      'gender': genderStr,
    };
  }

  AppUser copyWith({String? id}) => AppUser(
        id: id ?? id,
        name: name,
        birthYear: birthYear,
        gender: gender,
        email: email,
      );
}
