import 'dart:async';

import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';

class ActivitiesRecognization {
  // Actitivites stream controller
  Stream<ActivityEvent> _activitiesController =
      ActivityRecognition.activityStream(runForegroundService: true);

  static final ActivitiesRecognization _activitiesRecognization =
      ActivitiesRecognization._();

  // get instance of the ActivitiesRecognization class
  static get activitiesRecognizationInstance => _activitiesRecognization;

  //Internal constructor
  ActivitiesRecognization._();
  //Stream activities
  Stream get activities => this._activitiesController;
}
