
  import 'package:flutter/material.dart';

import 'course.dart';
import 'courses.dart';

class Fav extends ChangeNotifier{
  List<Course> userFav = [];
  List<Course> getUserFav() {
    return userFav;
  }
  List<Course> getCourseList() {
    return courseShop;
  }
  void addItemToFav(Course course) {
    userFav.add(course);
    notifyListeners();
  }
  void removeItemFromFav(Course course) {
    userFav.remove(course);
    notifyListeners();
  }

  
}