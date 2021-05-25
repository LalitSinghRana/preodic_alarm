import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOn = true;
  int alarmId = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Switch(
          value: isOn,
          onChanged: (value) {
            setState(() {
              isOn = value;
              // print('isOn is $isOn');
            });
            if (isOn == true) {
              AndroidAlarmManager.periodic(
                  Duration(seconds: 60), alarmId, fireAlarm);
            } else {
              AndroidAlarmManager.cancel(alarmId);
            }
          },
        ),
      ),
    );
  }
}

void fireAlarm() {
  print('Alarm Fired at ${DateTime.now()}');
}
