import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ton_keeper/core/resources/data_state.dart';
import 'package:ton_keeper/features/wallet/domain/use_case/get_wallet_data_use_case.dart';
import 'package:ton_keeper/features/wallet/presentation/bloc/wallet_status.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final GetWalletDataUseCase getWalletDataUseCase;
  WalletBloc(this.getWalletDataUseCase) : super(WalletState(walletStatus: WalletInitial())) {

    //get wallet data
    on<FetchWalletData>(onFetchWalletData);
  }

 Future<void> onFetchWalletData(FetchWalletData event , Emitter<WalletState> emit) async{
    emit(state.copyWith(newWalletStatus: WalletLoading()));

    DataState dataState = await getWalletDataUseCase(null);

    //success state
    if(dataState is DataSuccess){
      emit(state.copyWith(newWalletStatus: WalletSuccess(dataState.data)));
    }

    //error state
   if(dataState is DataFailed){
     emit(state.copyWith(newWalletStatus: WalletError(dataState.error ?? "error")));
   }
 }
}
