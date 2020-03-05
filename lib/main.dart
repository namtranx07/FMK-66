import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttersignup/signup_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final _bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: Stack(alignment: Alignment.center, children: [
            Image.asset(
              'images/signup_first_bg.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 160,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(children: <Widget>[
                    SvgPicture.asset(
                      'images/nomura_digital_img.svg',
                    ),
                    Text(
                      '証券のニュースタンダードで、未来をつくる。',
                      style: TextStyle(
                          fontFamily: 'SF-Pro-Text',
                          fontSize: 12,
                          color: Colors.white,
                        fontWeight: FontWeight.w500,),
                    ),
                  ])
                ],
              ),
            ),
            Positioned(
              height: 144,
              bottom: 0,
              child: Column(
                children: <Widget>[
                  SvgPicture.asset('images/nomura_img.svg'),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'すでにアカウントをお持ちの方はこちら',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromRGBO(191, 166, 108, 1),
                          fontFamily: 'SF-Pro-Text',
                          fontSize: 12,
                        fontWeight: FontWeight.w500,),
                    ),
                  ),
                  Text(
                    'アカウントを作成せずに使用する',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(191, 166, 108, 1),
                        fontFamily: 'SF-Pro-Text',
                        fontSize: 12,
                      fontWeight: FontWeight.w500,),
                  )
                ],
              ),
            ),
          ]),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: _bottomPadding,top: 16),
          width: double.infinity,
          height: 96,
          decoration: BoxDecoration(
            color: Color(0xFFBFA66C),
          ),
          child: GestureDetector(
            child: Text(
              '新規アカウント開設',
              style: TextStyle(
                fontFamily: 'SF-Pro-Text',
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpInput()));
            },
          ),
        )
      ],
    ));
  }
}
