import 'package:ai_personal_task_manager/model/auth_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isLoading;
  final String? errorMessage;
  final bool isLogin;
  final bool showResendButton;

  AuthState({
    this.isLoading = false,
    this.errorMessage,
    this.isLogin = true,
    this.showResendButton = false,
  });

  AuthState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isLogin,
    bool? showResendButton,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isLogin: isLogin ?? this.isLogin,
      showResendButton: showResendButton ?? this.showResendButton,
    );
  }
}

class AuthViewModel extends StateNotifier<AuthState> {
  final SupabaseClient _supabase = Supabase.instance.client;

  AuthViewModel() : super(AuthState());

  void toggleForm() {
    state = state.copyWith(isLogin: !state.isLogin, errorMessage: null, showResendButton: false);
  }

  Future<bool> auth(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null, showResendButton: false);
    try {
      if (state.isLogin) {
        await signIn(email, password, _supabase);
      } else {
        await signUp(email, password, _supabase);
        state = state.copyWith(isLoading: false, errorMessage: "Confirmation email sent. Please check your inbox.");
        return true;
      }
      state = state.copyWith(isLoading: false);
      return true;
    } on AuthException catch (e) {
      final showResend = e.message.contains('confirm your email');
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
        showResendButton: showResend,
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'An unexpected error occurred.',
        showResendButton: false,
      );
      return false;
    }
  }

  Future<void> resendConfirmation(String email) async {
    try {
      await _supabase.auth.resend(type: OtpType.signup, email: email);
      state = state.copyWith(errorMessage: 'Confirmation email resent. Please check your inbox.');
    } catch (e) {
      state = state.copyWith(errorMessage: 'Failed to resend confirmation email.');
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  User? get currentUser {
    return _supabase.auth.currentUser;
  }
}



