import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> signUp(String email, String password, dynamic supabase) async {
  try {
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
    );
    // You can access the user session after sign up, if email verification is disabled
    final Session? session = res.session;
    final User? user = res.user;

    // Show a success message (e.g., SnackBar)
    // Note: User may need to confirm their email before signing in.
  } on AuthException catch (e) {
    // Handle specific Supabase Auth errors
    print(e.message);
    rethrow;
    // Show an error message (e.g., SnackBar)
  } catch (e) {
    // Handle other errors
    print('An unexpected error occurred: $e');
    rethrow;
  }
}

Future<void> signIn(String email, String password, dynamic supabase) async {
  try {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final User? user = res.user;
    if (user != null && user.emailConfirmedAt == null) {
      await supabase.auth.signOut();
      throw const AuthException('Please confirm your email before logging in.');
    }
    // You can access the user session after sign in
    final Session? session = res.session;

    // Show a success message or navigate to the home screen
  } on AuthException catch (e) {
    // Handle specific Supabase Auth errors
    print(e.message);
    rethrow;
    // Show an error message (e.g., SnackBar)
  } catch (e) {
    // Handle other errors
    print('An unexpected error occurred: $e');
    rethrow;
  }
}
