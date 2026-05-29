import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> getAuth();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<AuthModel> getAuth() async {
    // TODO: Implement API call
    throw UnimplementedError();
  }
}
