import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todolist/pages/home.dart';
import 'package:todolist/pages/login.dart';
import 'package:todolist/providers/onboarding_view_model.dart';

import '../utils/util.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key key}) : super(key: key);

  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingViewModel>.reactive(
      viewModelBuilder: () => OnBoardingViewModel(),
      onModelReady: (model) => model.isSigned,
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Hero(
                    tag: 'Clipboard',
                    child: Image.asset('assets/images/Clipboard.png'),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Reminders made simple',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.TextHeader),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque erat in blandit luctus.',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.TextBody,
                            fontFamily: 'opensans'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    onPressed: () {
                      model.checkUser();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => model.isSigned == true
                                ? Home(displayName: model.getUser)
                                : Login()),
                      );
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: 60,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            CustomColors.GreenLight,
                            CustomColors.GreenDark,
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.GreenShadow,
                            blurRadius: 15.0,
                            spreadRadius: 7.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Center(
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
