import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/constant.dart';
import 'package:myapp/page1.dart';
import 'package:myapp/page2.dart';
import 'package:myapp/services/user.dart';
import 'package:myapp/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _visible = true;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: blue,
          ),
          const TopSginup(),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.09,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: whiteshade,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09),
                      child: Image.asset("assets/h.jpg"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 1,
                      ),
                      child: Text(
                        'Username',
                        style: const TextStyle(
                            color: Colors.blueAccent,
                            letterSpacing: 0.7,
                            fontFamily: 'poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(45),
                        border:
                            Border.all(color: Colors.blueAccent, width: 1.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: TextField(
                          controller: _usernameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: "Type your username",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 1,
                      ),
                      child: Text(
                        'Email',
                        style: const TextStyle(
                            color: Colors.blueAccent,
                            letterSpacing: 0.7,
                            fontFamily: 'poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(45),
                        border:
                            Border.all(color: Colors.blueAccent, width: 1.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: TextField(
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "   yourname@gmail.com",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 5,
                      ),
                      child: Text(
                        'Password',
                        style: const TextStyle(
                            color: Colors.blueAccent,
                            letterSpacing: 0.7,
                            fontFamily: 'poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(45),
                        border:
                            Border.all(color: Colors.blueAccent, width: 1.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: TextField(
                          obscureText: _visible,
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_visible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _visible = !_visible;
                                  });
                                }),
                            hintText: "   minumum 8 characters",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 5,
                      ),
                      child: Text(
                        'Password',
                        style: const TextStyle(
                            color: Colors.blueAccent,
                            letterSpacing: 0.7,
                            fontFamily: 'poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(45),
                        border:
                            Border.all(color: Colors.blueAccent, width: 1.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: TextField(
                          obscureText: _visible,
                          controller: _repasswordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_visible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _visible = !_visible;
                                  });
                                }),
                            hintText: "   minumum 8 characters",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CheckerBox(),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        child: Center(
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: FlatButton(
                              child: const Text(
                                'Sign up ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              textColor: Colors.black,
                              height: 65.0,
                              onPressed: () {
                                AuthenticationHelper()
                                    .signUp(
                                        email: emailcontroller.text,
                                        password: passwordcontroller.text,
                                        username: _usernameController.text)
                                    .then((result) {
                                  if (result == null) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signin()));
                                  } else {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                        result,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ));
                                  }
                                  userSetup(_usernameController.text,
                                      emailcontroller.text);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.149,
                          top: MediaQuery.of(context).size.height * 0.07),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class CheckerBox extends StatefulWidget {
  const CheckerBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckerBox> createState() => _CheckerBoxState();
}

class _CheckerBoxState extends State<CheckerBox> {
  bool? isCheck;
  @override
  void initState() {
    // TODO: implement initState
    isCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: isCheck,
              checkColor: whiteshade, // color of tick Mark
              activeColor: blue,
              onChanged: (val) {
                setState(() {
                  isCheck = val!;
                  print(isCheck);
                });
              }),
          Text.rich(
            TextSpan(
                text: "I agree with ",
                style: TextStyle(
                    letterSpacing: 0.7,
                    fontFamily: 'poppins',
                    color: grayshade.withOpacity(0.8),
                    fontSize: 16),
                children: [
                  TextSpan(
                      text: "Terms ",
                      style: TextStyle(
                          letterSpacing: 0.7,
                          fontFamily: 'poppins',
                          color: blue,
                          fontSize: 14)),
                  const TextSpan(text: "and "),
                  TextSpan(
                      text: "Policy",
                      style: TextStyle(color: blue, fontSize: 14)),
                ]),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  InputField({Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 0,
          ),
          child: Text(
            headerText,
            style: const TextStyle(
                color: Colors.blueAccent,
                letterSpacing: 0.7,
                fontFamily: 'poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: grayshade.withOpacity(0.5),
              // border: Border.all(
              //   width: 1,
              // ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintTexti,
                  border: InputBorder.none,
                ),
              ),
            )
            //IntrinsicHeight

            ),
      ],
    );
  }
}

// ignore: must_be_immutable
class InputFieldPassword extends StatefulWidget {
  String headerText;
  String hintTexti;

  InputFieldPassword(
      {Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  State<InputFieldPassword> createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 0,
          ),
          child: Text(
            widget.headerText,
            style: const TextStyle(
                color: Colors.blueAccent,
                letterSpacing: 0.7,
                fontFamily: 'poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: grayshade.withOpacity(0.5),
            // border: Border.all(
            //   width: 1,
            // ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              obscureText: _visible,
              decoration: InputDecoration(
                  hintText: widget.hintTexti,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      icon: Icon(
                          _visible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _visible = !_visible;
                        });
                      })),
            ),
          ),
        ),
      ],
    );
  }
}

class TopSginup extends StatelessWidget {
  const TopSginup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 15, left: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialButton(
              minWidth: 0,
              height: 0,
              padding: EdgeInsets.zero,
              child: Icon(
                Icons.arrow_back_sharp,
                color: whiteshade,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              }),
          SizedBox(
            width: screenSize.width * 0.25,
          ),
          Text(
            "Sign up",
            style: TextStyle(
                color: whiteshade,
                fontSize: 20,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w600,
                letterSpacing: 1),
          )
        ],
      ),
    );
  }
}
