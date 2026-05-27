import '../../domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({
    required String id,
    required String name,
  }) : super(id: id, name: name);

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
