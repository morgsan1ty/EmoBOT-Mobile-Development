import 'package:emobot_mobile_v2/Screens/Accounts/components/background.dart';
import 'package:emobot_mobile_v2/Screens/Welcome/welcome_screen.dart';
import 'package:emobot_mobile_v2/components/account_option.dart';
import 'package:emobot_mobile_v2/components/rounded_button.dart';
import 'package:emobot_mobile_v2/components/theme_option.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  final List data;
  const Body({Key? key, required this.data}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  _BodyScreenState createState() => _BodyScreenState(data);
}

class _BodyScreenState extends State<Body> {
  List data;
  _BodyScreenState(this.data);
  bool valTheme = true;
  onChangeFunction(bool newValue) {
    setState(() {
      valTheme = newValue;
    });
  }

  //Accounts UI
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ListView(
        children: [
          const SizedBox(height: 40),
          Row(
            children: const [
              Icon(
                Icons.person,
                color: kPrimaryColor,
              ),
              SizedBox(width: 10),
              Text("Account",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
            ],
          ),
          const Divider(height: 20, thickness: 1),
          const SizedBox(height: 10),
          AccountOption(
            context: context,
            title: "Edit Profile",
            page: "Edit Profile",
            data: data,
          ),
          AccountOption(
            context: context,
            title: "Change Password",
            page: "Change Password",
            data: data,
          ),
          const SizedBox(height: 40),
          Row(
            children: const [
              Icon(Icons.bedtime_sharp, color: kPrimaryColor),
              SizedBox(width: 10),
              Text("Theme",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
            ],
          ),
          const Divider(height: 20, thickness: 1),
          const SizedBox(height: 10),
          ThemeOption(
              title: "Dark Mode",
              value: valTheme,
              onChangeMethod: onChangeFunction),
          const SizedBox(height: 50),
          Center(
            child: RoundedButton(
              text: "LOG OUT",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WelcomeScreen();
                }));
              },
              color: kPrimaryColor,
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
