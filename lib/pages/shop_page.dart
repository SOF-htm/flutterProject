import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_exo1/models/fav.dart';
import 'package:flutter_exo1/pages/see_all_page.dart';
import 'package:provider/provider.dart';

import '../components/course_tile.dart';
import '../models/cart.dart';
import '../models/course.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  final TextEditingController _searchController = TextEditingController();

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
          iconTheme: null,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.all(12),
              //   margin: const EdgeInsets.symmetric(horizontal: 25),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[200],
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [

              //       const Icon(
              //         Icons.search,
              //         color: Colors.grey,
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      width: 150,
                      height: 150,
                      child: PageView(
                        onPageChanged: _onPageChanged,
                        children: [
                          _sliderContainer(path: "assets/logo.png"),
                          _sliderContainer(path: "assets/logo.png"),
                          _sliderContainer(path: "assets/logo.png"),
                          _sliderContainer(path: "assets/logo.png"),
                        ],
                      ),
                    ),
                    Container(
                      child: DotsIndicator(
                        dotsCount: 4,
                        position: _currentPage,
                        decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.red,
                          size: const Size.square(5.0),
                          activeSize: const Size(20, 5),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Courses',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SeeAllPage(),
                        ),
                      ),
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 260,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
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
              const Padding(
                padding: EdgeInsets.only(
                  top: 25,
                  left: 25,
                  right: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _sliderContainer({String path = "assets/logo.png"}) {
  return Container(
    width: 325,
    height: 160,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}
