import 'package:bloc/bloc.dart';
import 'package:first_firebase/features/signup/auth_signup.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthSignUpService _authService = AuthSignUpService(); 

  SignUpBloc({required AuthSignUpService authService})
    : super(SignUpInitial()) {
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
    on<SignUpReset>(_onSignUpReset);
    on<InitSignUpScreenEvent>(_onSignUpInit);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmittedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());

    try {
      final user = await _authService.signUpWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(SignUpSuccess(user!.email!));
    } catch (e) {
      emit(SignUpFailure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  void _onSignUpReset(SignUpReset event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }

  void _onSignUpInit(InitSignUpScreenEvent event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }
}
