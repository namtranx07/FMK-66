//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpInputState();
}

class _SignUpInputState extends State<SignUpInput> {

  bool passwordInput = false;
  final double paddingTopForBottom = 12.0;

  _buildHeader(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/header_signup_bg.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 0, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: SvgPicture.asset('images/header-icons-light.svg'),
              ),
              Row(
                children: <Widget>[
                  Text(
                    passwordInput ? 'アカウントを保護するためのパスワードを設定しましょう': 'サービスを利用するアカウントを作成しましょう',
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'SF-Pro-Text',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Opacity(
                child: SizedBox(
                  height: 24,
                ),
                opacity: 0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    passwordInput ? 'パスワードを\n設定して下さい' : 'メールアドレスを\n入力してください',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'SF-Pro-Text',
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildContentInput() {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            passwordInput ? 'パスワード' : 'メールアドレス',
            style: TextStyle(
              fontFamily: 'SF-Pro-Text',
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Theme(
            data: theme.copyWith(primaryColor: Colors.white.withOpacity(0.4)),
            child: TextField(
              obscureText: passwordInput ? true : false,
              style: TextStyle(
                color: Colors.white.withOpacity(0.4)
              ),
              decoration: InputDecoration(
                hintText: passwordInput ? '********' : 'name@domain.com',
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontFamily: 'SF-Pro-Text',
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
              autofocus: true,
              onSubmitted: (newValue) {
                setState(() {

                });
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildHeader(context),
          Expanded(child: Container(
            color:  Color(0xFF062843),
              child: _buildContentInput())),
          Row(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 60,
                  height: 96,
                  color: Color(0xFFD1BD86),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start
              ,children: <Widget> [
                    Padding(
                      padding: EdgeInsets.only(top: paddingTopForBottom),
                      child: Image.asset('images/back_arrow.png'),
                    )
                  ]),
                ),
                onTap: () {
                  if (passwordInput == false) {
                    Navigator.pop(context);
                  }
                  setState(() {
                    passwordInput = false;
                  });
                },
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      passwordInput = true;
                    });
                  },
                  child: Container(
                    height: 96,
                    decoration: BoxDecoration(color: Color(0xFFBFA66C)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: paddingTopForBottom*2),
                            child: Text(
                              '次へ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SF-Pro-Text',
                                  fontSize: 16.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: paddingTopForBottom),
                          child: Image.asset('images/next_arrow.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
