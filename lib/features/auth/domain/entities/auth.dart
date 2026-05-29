import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String id;
  final String name;

  const Auth({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
