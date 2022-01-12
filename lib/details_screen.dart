import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key,
    this.title = '',
    this.country = '',
    this.price = 0,
  }) : super(key: key);

  final String title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: country,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "\$$price",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.blueAccent),
          )
        ],
      ),
    );
  }
}

class RatingView extends StatefulWidget {
  const RatingView({key}) : super(key: key);
  @override
  State createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  var _ratingPageController = PageController();
  var _starPosition = 200.0;
  var _rating = 0;
  var _selectedchipindex = -1;
  var _isMoreDetailActive = false;
  var _moredetailfocusnode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                  topRight: Radius.circular(63),
                  bottomRight: Radius.circular(63),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              height: max(300, MediaQuery.of(context).size.height * 0.3),
              child: PageView(
                controller: _ratingPageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildThanksNote(),
                  _causeOfRating(),
                ],
              )),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent[100],
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                child: Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                onPressed: _hideDialog,
              ),
            ),
          ),
          SizedBox(height: 16),
          AnimatedPositioned(
              top: _starPosition,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => IconButton(
                          icon: index < _rating
                              ? Icon(Icons.star, size: 32)
                              : Icon(Icons.star_border, size: 32),
                          color: Colors.blueAccent[100],
                          onPressed: () {
                            _ratingPageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                            setState(() {
                              _starPosition = 20.0;
                              _rating = index + 1;
                            });
                          },
                        )),
              ),
              duration: Duration(milliseconds: 300)),
          if (_isMoreDetailActive)
            Positioned(
              left: 0,
              top: 0,
              child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 5),
                onPressed: () {
                  setState(() {
                    _isMoreDetailActive = false;
                  });
                },
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
        ],
      ),
    );
  }

  _hideDialog() {
    if (Navigator.canPop(context)) (Navigator.pop(context));
  }

  _buildThanksNote() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 15),
        Text(
          'Thanks for choosing our company',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2,
              color: Colors.blueAccent),
        ),
        SizedBox(height: 10),
        Text(
          'We\'d love to get your feedback',
          style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
              color: Colors.black),
        ),
      ],
    );
  }

  _causeOfRating() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: !_isMoreDetailActive,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("what could be better"),
              Wrap(
                spacing: 8.0,
                alignment: WrapAlignment.center,
                children: List.generate(
                    6,
                    (index) => InkWell(
                        onTap: () {
                          setState(() {
                            _selectedchipindex = index;
                          });
                        },
                        child: Chip(
                          backgroundColor: _selectedchipindex == index
                              ? Colors.blueAccent
                              : Colors.grey[300],
                          label: Text('text ${index + 1}'),
                        ))),
              ),
              SizedBox(height: 16),
              InkWell(
                  onTap: () {
                    _moredetailfocusnode.requestFocus();
                    setState(() {
                      _isMoreDetailActive = true;
                    });
                  },
                  child: Text(
                    "Want to tell us more?",
                    style: TextStyle(decoration: TextDecoration.underline),
                  )),
            ],
          ),
          replacement: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("tell us more"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  focusNode: _moredetailfocusnode,
                  decoration: InputDecoration(
                    hintText: 'write you review here...',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    this.icon = '',
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(kDefaultPadding / 2),
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 22,
            color: Colors.blueAccent.withOpacity(0.22),
          ),
          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Colors.white,
          ),
        ],
      ),
      child: SvgPicture.asset(icon),
    );
  }
}

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        icon: SvgPicture.asset(""),
                        onPressed: () {},
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 60,
                    color: Colors.blueAccent.withOpacity(0.29),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/img.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(
            size: size / 1.25,
            key: null,
          ),
          TitleAndPrice(
            title: "Cleaning Services",
            key: null,
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 84,
                // ignore: deprecated_member_use
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {},
                  child: Text(
                    "Reserve",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              Expanded(
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    OpenRatingDialog(context);
                  },
                  child: Text(
                    "Rate Now!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

OpenRatingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: RatingView(),
        );
      });
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: const BackButton(
        color: Colors.white,
      ),
      title: const Text(' '),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
      backgroundColor: Colors.blueAccent,
      elevation: 0.0,
    );
  }
}
