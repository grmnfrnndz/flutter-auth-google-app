import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;





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
      final signWithGoogleEndPoint = Uri(
        scheme: 'https',
        host: 'apple-google-sign-in-gerdevops.herokuapp.com',
        path: 'auth/google/'
      );

      final session = await http.post(signWithGoogleEndPoint, 
      body: { 
        'token': googleKey?.idToken
        });

      print('=====backend=====');
      print(session.body);

      return account;
    } catch (e) {
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }

}