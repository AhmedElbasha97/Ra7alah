import 'package:flutter/material.dart';
import 'package:ra7alah/screens/intro/intro_screen.dart';
import 'package:ra7alah/utils/colors.dart';


class OfflinePage extends StatelessWidget {
  const OfflinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/404.png'),
            const Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                'No Internet Connection',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: kDarkPrimaryColor),
              ),
            ),
            Container(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: const Text(
                  'Refresh',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>  Intro()));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 3.0,
                  primary: kPrimaryColor,
                  onPrimary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}