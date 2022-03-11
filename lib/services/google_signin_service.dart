

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninService {

  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      final googleKey = await account?.authentication;

      print(account);
      print(googleKey?.idToken);


      // llamar un servicio REST a nuestro backend




      return account;
    } catch (e) {
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }

}