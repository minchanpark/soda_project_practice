import 'package:flutter/material.dart';

import 'trip.dart';

class MyAppState extends ChangeNotifier {
  List<Trip> trips = []; // 여러 개의 여행 코스를 저장할 리스트
  List<String> selectedRestaurants = [];
  List<String> selectedCafes = [];
  List<String> selectedEntertainment = [];

  // 새로운 여행 코스 추가
  void addTrip(String tripName) {
    Trip newTrip = Trip(tripName);    //tripName을 가진 instance를 생성
    trips.add(newTrip);
    notifyListeners();
  }

  
}