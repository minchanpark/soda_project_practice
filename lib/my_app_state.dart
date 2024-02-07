import 'package:flutter/material.dart';

import 'trip.dart';

class MyAppState extends ChangeNotifier {
  List<Trip> trips = []; // 여러 개의 여행 코스를 저장할 리스트

  // 새로운 여행 코스 추가
  void addTrip(String tripName) {
    Trip newTrip = Trip(tripName);
    trips.add(newTrip);
    notifyListeners();
  }
}