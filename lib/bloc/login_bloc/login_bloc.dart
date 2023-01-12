import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/core/check_internet.dart';
import 'package:test_app/models/login_model.dart';
import 'package:test_app/repo/login_repo.dart';
import 'package:dio/dio.dart' as dio;
import '../../DI/d_injection.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo = DependencyInjection.getIt<LoginRepo>();
  dio.FormData formData = dio.FormData.fromMap({
    "ProvidorMobile": "+201013713862",
    "ProvidorPassword": "12345678",
    "FirebaseToken": "",
  });
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (await InternetConnection.isConnected()) {
        if (event is LoginUserEvent) {
          emit(LoadingLoginState());
          var data = await loginRepo.login(formData);
          data.fold((l) {
            emit(ErrorLoginState(l));
          }, (r) {
            emit(SuccessLoginState(r));
          });
        }
      }
    });
  }
}
