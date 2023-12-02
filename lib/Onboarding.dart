import 'package:ambi/LoinPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'contentmodel.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  int currentIndex = 0;
  PageController? _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image(
                            image: AssetImage(contents[i].image),
                            height: 300,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        RichText(
                          text: TextSpan(
                              text: contents[i].title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26),
                              children: [
                                TextSpan(
                                    text: contents[i].subtitle,
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30))
                              ]),
                        ),
                        Text(
                          contents[i].discription,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  contents.length, (index) => builddot(index, context)),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(40),
            height: 55,
            child: ElevatedButton(
              child: Text(
                currentIndex == contents.length - 1 ? "Continue" : "Next",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginPage(),
                    ),
                  );
                }
                _controller!.nextPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.bounceIn);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container builddot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.orangeAccent),
    );
  }
}
