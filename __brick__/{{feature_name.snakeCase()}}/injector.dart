
import 'package:get_it/get_it.dart';

import 'data/datasource/{{feature_name.snakeCase()}}_local_data_source.dart';
import 'data/datasource/{{feature_name.snakeCase()}}_local_data_source_impl.dart';

import 'data/datasource/{{feature_name.snakeCase()}}_remote_data_source.dart';
import 'data/datasource/{{feature_name.snakeCase()}}_remote_data_source_impl.dart';

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

  getIt.registerFactory<${pascalCaseFeature}LocalDataSource>(
      () => ${pascalCaseFeature}LocalDataSourceImpl(secureStorage: injector.get<SecureStorage>()));
  getIt.registerFactory<${pascalCaseFeature}RemoteDataSource>(
      () => ${pascalCaseFeature}RemoteDataSourceImpl(networkService: injector.get<NetworkService>()));

  getIt.registerFactory<${pascalCaseFeature}Repository>(
    () => ${pascalCaseFeature}RepositoryImpl(
      localDataSource: injector.get<${pascalCaseFeature}LocalDataSource>(),
      remoteDataSource: injector.get<${pascalCaseFeature}RemoteDataSource>(),
    ));

  // Example of how to register a use case
  // getIt.registerFactory<Fetch${pascalCaseFeature}UseCase>(
  //   () => Fetch${pascalCaseFeature}UseCase(
  //     repository: injector.get<${pascalCaseFeature}Repository>(),
  //   ),
  // );
}
