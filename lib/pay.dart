import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

String backendUrl = '{YOUR_BACKEND_URL}';
// Set this to a public key that matches the secret key you supplied while creating the heroku instance
String paystackPublicKey = '{YOUR_PAYSTACK_PUBLIC_KEY}';

class Pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'payment',
      home: Scaffold(
        bottomNavigationBar: Bottombar(),
        body: HomePage(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 15, blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.blueAccent,
            currentIndex: this.selectedIndex,
            selectedIconTheme: IconThemeData(
              color: Colors.blue[900],
              size: 40,
            ),
            unselectedIconTheme:
                const IconThemeData(color: Colors.white, size: 35),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                title: Text(" History"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Emails"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
              )
            ],
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = true;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.red,
              backgroundImage: useBackgroundImage ? 'assets/card_bg.png' : null,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.asset(
                    'assets/mastercard.png',
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.blue,
                      textColor: Colors.white,
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.grey),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Holder',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Card Image',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: useBackgroundImage,
                          inactiveTrackColor: Colors.grey,
                          activeColor: Colors.black,
                          activeTrackColor: Colors.green,
                          onChanged: (bool value) => setState(() {
                            useBackgroundImage = value;
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: const Color(0xff1b447b),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        child: const Text(
                          'Validate',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('valid!');
                        } else {
                          print('invalid!');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
