import 'package:flutter/material.dart';

import 'course.dart';
import 'courses.dart';

class Cart extends ChangeNotifier {
  List<Course> userCart = [];
    List<Course> getCourseList() {
    return courseShop;
  }


  List<Course> getUserCart() {
    return userCart;
  }

  void addItemToCart(Course course) {
    userCart.add(course);
    notifyListeners();
  }

  void removeItemFromCart(Course course) {
    userCart.remove(course);
    notifyListeners();
  }
}
