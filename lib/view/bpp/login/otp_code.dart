import 'dart:async';
import 'dart:convert';

import 'package:bpp_shop/view/bpp/address/Address%20.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/login/gmail_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
  'email',
]);

class Otp_screen extends StatefulWidget {
  Otp_screen({Key? key, required this.mobile, required this.token, this.from})
      : super(key: key);
  int start = 0;
  String mobile;
  String token;
  String? from;

  @override
  _Otp_screenState createState() => _Otp_screenState();
}

class _Otp_screenState extends State<Otp_screen> {
  final String postsUrl = "https://bppshops.com/api/loginWithOtp";
  TextEditingController numberController = TextEditingController();

  void saveOtpUserToken({String? token}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', token!);
    print(_prefs.getString("token").toString() + ">>>>>>>>>>saveed<<<<<<<<<<");
  }

  void savePhoneNumber({String? mobile}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('mobile', mobile!);
    print(_prefs.getString('mobile').toString() + ">>>>>>>>>>saveed<<<<<<<<<<");
  }

  // final SnackBar snackBar = SnackBar(content: Text("your snackbar message"));
  // snackbarKey.currentState?.showSnackBar(snackBar);

  Future<Response> getPost() async {
    print(widget.mobile.toString());
    print(numberController.text.toString());
    var res = await post(Uri.parse(postsUrl), body: {
      'mobile': widget.mobile.toString(),
      'otp': numberController.text.toString(),
    });
    //var response = await HttpHeaders.responseHeaders;

    if (res.statusCode == 201) {
      return res;
    } else {
      throw "Error :${res.statusCode}";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listOPT();
  }

  @override
  Widget build(BuildContext context) {
    //final profile = Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //
            //   },
            //   child: Text("Get Token"),
            // ),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.white,
                      elevation: 3,
                      minimumSize: Size(120, 40),
                    ),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                    },
                    icon: Icon(
                      FontAwesomeIcons.google,
                      size: 18, //Icon Size
                      color: Colors.black, //Color Of Icon
                    ),
                    label: Text(
                      'Login with Email',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )),
            SizedBox(
              width: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Divider(
                    indent: 20.0,
                    endIndent: 10.0,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "or",
                  style: TextStyle(color: Colors.grey),
                ),
                Expanded(
                  child: Divider(
                    indent: 10.0,
                    endIndent: 20.0,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "We've sent a 4-digit one time PIN in your phone",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${widget.mobile}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  SizedBox(
                      width: 300,
                      child: Column(
                        children: [
//                           Text("Enter Pin"),
//                           Container(
//                             child: PinFieldAutoFill(
//                                 decoration: UnderlineDecoration(
//                                     colorBuilder:
//                                         FixedColorBuilder(Colors.black)),
//                                         codeLength: 4,
//                                         onCodeSubmitted: (code){},
//                                         onCodeChanged: (code){
//                                           if(code?.length==6){
// //FocusScope.of(context.requestFocus(FocusNode()));
//                                           }
//                                         },
//                                         ),
//                           ),
                          TextFormField(
                            controller: numberController,
                            minLines: 1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Please enter 4-digit one time pin',
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffE37D4E),
                  onPrimary: Color(0xffE37D4E),
                  elevation: 3,
                  minimumSize: Size(100, 40),
                ),
                onPressed: () async {
                  Response response = await getPost();

                  if (response.statusCode == 201) {
                    final json = jsonDecode(response.body);
                    print(json["token"]);
                    saveOtpUserToken(
                      token: json["token"],
                    );
                    print(json["user"]["mobile"] +
                        ">>>>>>>>>>>>>>>######ok######<<<<<<<<<<<<");
                    savePhoneNumber(
                      mobile: json["user"]["mobile"],
                    );

                    print("Okey..........");
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => BottomNavBar(
                    //             currentTab: 0, currentScreen: HomeScreen(nameFromFacebook: widget.mobile,routeKey: 3,))),
                    //     (route) => false);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => widget.from == "cart"
                                ? Address()
                                : BottomNavBar(
                                    currentTab: 3,
                                    currentScreen: ProfileScreen(
                                      from: widget.from,
                                    ),
                                  )));
                    // profile.addItem(
                    //  widget.token,
                    //  widget.mobile
                    // );
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 120),
                  child: Row(
                    children: [
                      Text(
                        "Enter",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This site is protected by reCAPTCHA and the Google",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Privacy",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Policy",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "and",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Terms of Service",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "apply",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    var onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      setState(() => {});
      if (widget.start == 0) {
        setState(() {
          timer.cancel();
          // wait = false;
        });
      } else {
        setState(() {
          widget.start--;
        });
      }
    });
  }

  _listOPT() async {
    await SmsAutoFill().listenForCode;
  }
}
