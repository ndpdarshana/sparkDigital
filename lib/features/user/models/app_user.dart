import 'package:equatable/equatable.dart';

enum Gender { male, female }

class AppUser extends Equatable {
  final String id;
  final int birthYear;
  final Gender gender;
  final String email;

  const AppUser({
    required this.id,
    required this.birthYear,
    required this.gender,
    required this.email,
  });

  @override
  List<Object?> get props => [id, birthYear, gender, email];

  factory AppUser.fromMap(Map<String, dynamic> data) {
    Gender gender = Gender.male;
    if (data['gender'] == 'female') {
      gender = Gender.female;
    }

    return AppUser(
      id: data['uid'],
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
      'email': email,
      'birthYear': birthYear,
      'gender': genderStr,
    };
  }
}
