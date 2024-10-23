
import 'package:get_it/get_it.dart';

import 'data/datasource/{{feature_name.snakeCase()}}_local_datasource.dart';
import 'data/datasource/{{feature_name.snakeCase()}}_local_datasource_impl.dart';

import 'data/datasource/{{feature_name.snakeCase()}}_remote_datasource.dart';
import 'data/datasource/{{feature_name.snakeCase()}}_remote_datasource_impl.dart';

import 'data/repositories/{{feature_name.snakeCase()}}_repository_impl.dart';
import 'domain/repositories/{{feature_name.snakeCase()}}_repository.dart';

import 'domain/use_cases/fetch_{{feature_name.snakeCase()}}_use_case.dart';

{{#is_global}}

import '../../network/dio_network_service.dart';
import '../../network/network_service.dart';


import '../../local/secure_storage/secure_storage.dart';
import '../../local/secure_storage/secure_storage_impl.dart';

{{/is_global}}


{{^is_global}}

import '../../shared/network/dio_network_service.dart';
import '../../shared/network/network_service.dart';

import '../../shared/local/secure_storage/secure_storage.dart';
import '../../shared/local/secure_storage/secure_storage_impl.dart';

{{/is_global}}



void setup{{feature_name.pascalCase()}}Injector(GetIt getIt) {


  // Data Sources
  getIt.registerFactory<{{feature_name.pascalCase()}}LocalDataSource>(
      () => {{feature_name.pascalCase()}}LocalDataSourceImpl(secureStorage: getIt.get<SecureStorage>()));
  getIt.registerFactory<{{feature_name.pascalCase()}}RemoteDataSource>(
      () => {{feature_name.pascalCase()}}RemoteDataSourceImpl(networkService: getIt.get<NetworkService>()));

  // Repositories
  getIt.registerFactory<{{feature_name.pascalCase()}}Repository>(
    () => {{feature_name.pascalCase()}}RepositoryImpl(
      localDataSource: getIt.get<{{feature_name.pascalCase()}}LocalDataSource>(),
      remoteDataSource: getIt.get<{{feature_name.pascalCase()}}RemoteDataSource>(),
    ));

  // Example of how to register a use case
  // getIt.registerFactory<Fetch{{feature_name.pascalCase()}}UseCase>(
  //   () => Fetch{{feature_name.pascalCase()}}UseCase(
  //     repository: injector.get<{{feature_name.pascalCase()}}Repository>(),
  //   ),
  // );
}
