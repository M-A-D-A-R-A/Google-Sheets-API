import 'dart:math';

class UserFeilds {
  static final String id = 'id';
  static final String name = 'name';
  static final String email = 'email';
  static final String isBeginner = 'isBeginner';

  static List<String> getFeilds() => [id, name, email, isBeginner];
}

class User {
  final int? id;
  final String name;
  final String email;
  final bool isBeginner;

  const User(
      {this.id,
      required this.name,
      required this.email,
      required this.isBeginner});

  User copy({int? id, String? name, String? email, bool? isBeginner}) => User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isBeginner: isBeginner ?? this.isBeginner);

  Map<String, dynamic> toJson() => {
        UserFeilds.id: id,
        UserFeilds.name: name,
        UserFeilds.email: email,
        UserFeilds.isBeginner: isBeginner,
      };
}
