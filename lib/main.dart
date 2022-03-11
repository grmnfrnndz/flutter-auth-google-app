import 'package:auth_app/services/google_signin_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Auth - Google - Apple'),
          actions: [
            IconButton(onPressed: () async {

              await GoogleSigninService.signOut();

            }, icon: Icon(FontAwesomeIcons.doorOpen))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                MaterialButton(
                  splashColor: Colors.transparent,
                  minWidth: double.infinity,
                  height: 40,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.google, color: Colors.white,),
                      Text('  Login With GOOGLE', style: TextStyle(color: Colors.white, fontSize: 17)),
                    ]
                  ),
                  onPressed: () async {

                    await GoogleSigninService.signInWithGoogle();

                  },
                  
                  )

              ],
            ),
          ),
        )
      ),
    );
  }
}