import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/bloc/login_bloc/login_bloc.dart';
import 'package:test_app/core/check_internet.dart';
import 'package:test_app/models/register_model.dart';
import 'package:test_app/repo/register_repo.dart';

import '../../core/DI/d_injection.dart';
import 'package:dio/dio.dart' as dio;
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepo registerRepo = DependencyInjection.getIt<RegisterRepo>();
  dio.FormData formData = dio.FormData.fromMap({
    "ProvidorName": "Ahmed",
    "ProvidorMobile": "+201013713862",
    "ProvidorCompanyName": "Ok",
    "ProvidorPassword": "12345678",
    "FirebaseToken": "",
  });
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (await InternetConnection.isConnected()) {
        if (event is RegisterUserEvent) {
          emit(LoadingRegisterState());
          var data = await registerRepo.register(formData);
          data.fold((l) {
            emit(ErrorRegisterState(l));
          }, (r) {
            emit(SuccessRegisterState(r));
          });
        }
      }
    });
  }
}
