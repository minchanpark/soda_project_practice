import 'package:flutter/material.dart';

import 'trip.dart';

class MyAppState extends ChangeNotifier {
  List<Trip> trips = []; // 여러 개의 여행 코스를 저장할 리스트

  late Trip trip;

  void deleteTrip(String tripName){           //여행 코스를 삭제
    for (int i = 0; i < trips.length; i++) {
    if (trips[i].name == tripName) {
      trips.removeAt(i);
      break;
    }
  }
    notifyListeners();
  }

  // 새로운 여행 코스 추가
  void addTrip(String tripName) {
    trip = Trip(tripName); //tripName을 가진 instance를 생성
    trips.add(trip);
    notifyListeners();
  }

  // 코스에 식당 추가
  void addRestaurant(String restaurantName) {
    trip.selectedRestaurants.add(restaurantName);
  }

  // 코스에 카페 추가
  void addCafe(String cafeName) {
    trip.selectedCafes.add(cafeName);
  }

  // 코스에 놀거리 추가
  void addEntertainment(String entertainmentName) {
    trip.selectedEntertainment.add(entertainmentName);
  }
}
