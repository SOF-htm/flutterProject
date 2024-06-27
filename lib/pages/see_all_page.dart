import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_exo1/components/course_tile.dart';
import 'package:flutter_exo1/models/courses.dart';
import 'package:flutter_exo1/models/fav.dart';
import 'package:flutter_exo1/pages/home_page.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/course.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({super.key});

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  int course = courseShop.length;

  void addCourseToCart(Course course) {
    Provider.of<Cart>(context, listen: false).addItemToCart(course);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Successflully Added To Cart!',
          ),
        ),
      ),
    );
  }

  void addCourseToFav(Course course) {
    Provider.of<Fav>(context, listen: false).addItemToFav(course);
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Successflully Added To Your Favorites!',
          ),
        ),
      ),
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "All",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 10,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        Course course = value.getCourseList()[index];
                        return CourseTile(
                          course: course,
                          addToCartTap: () => addCourseToCart(course),
                          addToFavTap: () => addCourseToFav(course),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
