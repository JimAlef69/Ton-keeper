import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ton_keeper/features/wallet/data/data_source/remote/api_provider.dart';
import 'package:ton_keeper/features/wallet/data/repository/wallet_repository_impl.dart';
import 'package:ton_keeper/features/wallet/domain/repository/wallet_repository.dart';
import 'package:ton_keeper/features/wallet/domain/use_case/get_wallet_data_use_case.dart';
import 'package:ton_keeper/features/wallet/presentation/bloc/wallet_bloc.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  //components
  locator.registerSingleton<Dio>(Dio(),);

  //utils
  // locator.registerSingleton<SharedPreferences>(
  //     await SharedPreferences.getInstance());
  // locator.registerSingleton<SharedPrefOperator>(SharedPrefOperator());

  //datasource
  locator.registerSingleton<ApiProvider>(ApiProvider());

  //repository
  locator.registerSingleton<WalletRepository>(WalletRepositoryImpl(locator()));

  //use - case
  locator.registerSingleton<GetWalletDataUseCase>(GetWalletDataUseCase(locator()));

  //bloc
  locator.registerSingleton<WalletBloc>(WalletBloc(locator()));

}
