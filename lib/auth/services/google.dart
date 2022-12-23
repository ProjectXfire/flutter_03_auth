import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;

class GoogleSingInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) return null;
      final googleKey = await account.authentication;
      final urlGoogleApi = Uri(
          scheme: "https",
          host: "flutter03authbe-production.up.railway.app",
          path: "/auth/google");
      final session =
          await http.post(urlGoogleApi, body: {"token": googleKey.idToken});
      return account;
    } catch (e) {
      return null;
    }
  }

  static Future<GoogleSignInAccount?> signOut() async {
    try {
      final account = await _googleSignIn.signOut();
      return account;
    } catch (e) {
      return null;
    }
  }
}
