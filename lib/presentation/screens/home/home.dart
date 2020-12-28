import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recognition_of_activities/services/activities_recognization.dart';

///
///Add these permission in your AndroidManifest.xml file
///
/// <uses-permission android:name="android.permission.ACTIVITY_RECOGNITION" />
///
///

class HomeDemoScreen extends StatefulWidget {
  //Get instance of the ActivitiesRecognization class
  @override
  _HomeDemoScreenState createState() => _HomeDemoScreenState();
}

class _HomeDemoScreenState extends State<HomeDemoScreen> {
  final ActivitiesRecognization _activitiesRecognization =
      ActivitiesRecognization.activitiesRecognizationInstance;
  Stream<ActivityEvent> _activityEventStream;

  @override
  void initState() {
    super.initState();
    _getPermissionAndInit();
  }

  //Get permission and iniiialisation
  void _getPermissionAndInit() async {
    if ((await Permission.activityRecognition.request()).isGranted) {
      _activityEventStream = _activitiesRecognization.activities;
    }
    throw Exception('Could not get permisson');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Flutter Recognization demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your current activities',
            ),
            StreamBuilder<ActivityEvent>(
              stream: _activityEventStream,
              builder: (context, snapShot) => Text(
                '${snapShot.data.type.toString()}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
