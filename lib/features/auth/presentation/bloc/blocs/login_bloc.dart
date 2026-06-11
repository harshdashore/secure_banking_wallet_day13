import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_banking_wallet_day13/features/auth/domain/usecases/login_usecase.dart';
import 'package:secure_banking_wallet_day13/features/auth/presentation/bloc/events/login_event.dart';
import 'package:secure_banking_wallet_day13/features/auth/presentation/bloc/states/login_state.dart';

class AuthBloc
    extends Bloc<AuthEvent, AuthState> {

  final LoginUseCase loginUseCase;

  AuthBloc(
      this.loginUseCase,
      ) : super(AuthInitial()) {

    on<LoginEvent>(_login);
  }

  Future<void> _login(
      LoginEvent event,
      Emitter<AuthState> emit,
      ) async {

    emit(AuthLoading());

    final result =
    await loginUseCase(
      event.email,
      event.password,
    );

    result.fold(
          (failure) {
        emit(AuthError(failure));
      },
          (success) {
        emit(AuthSuccess());
      },
    );
  }
}