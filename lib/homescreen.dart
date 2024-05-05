import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int resendTime = 10;
  late Timer countdownTimer;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
      }
    });
  }
  stopTimer(){
    if(countdownTimer.isActive){
      countdownTimer.cancel();
    }
  }
// String strFormatting (n)=>n.toString().padLeft(2,'0');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              resendTime ==0 ? InkWell(
                onTap: (){
                  resendTime=10;
                  startTimer();
                },child: Text('Resend'),
              ):SizedBox(),
              resendTime != 0 ? Text('You can resend $resendTime') : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

}
