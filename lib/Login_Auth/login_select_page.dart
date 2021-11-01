import 'package:carousel_slider/carousel_slider.dart';
import 'package:esportzzz/Login_Auth/emailloginpage.dart';
import 'package:esportzzz/Login_Auth/emailsignuppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Login_Select extends StatefulWidget {
  const Login_Select({Key? key}) : super(key: key);

  @override
  _Login_SelectState createState() => _Login_SelectState();
}

class _Login_SelectState extends State<Login_Select> {
  int activeIndex = 0;
  var urlLinks = [
    "https://firebasestorage.googleapis.com/v0/b/esportzzz-8640a.appspot.com/o/SelectPage%20Images%2FScreenshot_1635687140.png?alt=media&token=dc32af61-3b7f-4e6c-aabc-11e42cee6156",
    "https://firebasestorage.googleapis.com/v0/b/esportzzz-8640a.appspot.com/o/SelectPage%20Images%2FScreenshot_1635687158.png?alt=media&token=571138f4-6062-47fa-875e-ebba1080e2b6",
    "https://firebasestorage.googleapis.com/v0/b/esportzzz-8640a.appspot.com/o/SelectPage%20Images%2FScreenshot_1635687187.png?alt=media&token=e5732c6c-5928-47b5-8081-d711a5543dc0",
    "https://firebasestorage.googleapis.com/v0/b/esportzzz-8640a.appspot.com/o/SelectPage%20Images%2FScreenshot_1635687171.png?alt=media&token=fbf9f86a-5ab1-48bc-8050-61275b3176d1"
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1f1a30),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Column(
              children: [
                // Container(
                //   alignment: Alignment.center,
                //   height: size.height * 0.2,
                //   width: size.width * 0.2,
                //   child: Image(
                //     image: AssetImage("lib/assets/img/editedlogo.png"),
                //   ),
                // ),
                Container(
                  child: CarouselSlider.builder(
                      itemCount: urlLinks.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = urlLinks[index];
                        return buildImage(urlImage, index);
                      },
                      options: CarouselOptions(
                          height: 400,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          }
                          //enableInfiniteScroll: false,
                          )),
                ),
                SizedBox(
                  height: 15,
                ),
                buildIndicator(),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: size.width * 0.6, height: size.height * 0.06),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => emaillogin()));
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        color: Colors.black, fontSize: size.width * 0.04),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff0ef5e3),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.circular(size.width * 0.5)))),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: size.width * 0.6, height: size.height * 0.06),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => emailsignuppage()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white, fontSize: size.width * 0.04),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff1f1a30),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.circular(size.width * 0.5)),
                      side: BorderSide(
                        width: size.width * 0.004,
                        color: Colors.tealAccent,
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String loc, int index) => Container(
        child: Image.network(
          loc,
          fit: BoxFit.cover,
        ),
        color: Colors.black,
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlLinks.length,
        effect: JumpingDotEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: Colors.tealAccent,
          dotColor: Colors.grey,
        ),
      );
}
