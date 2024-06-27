import 'package:flutter/material.dart';
import 'package:flutter_exo1/components/favorite_item.dart';
import 'package:flutter_exo1/models/course.dart';
import 'package:flutter_exo1/models/fav.dart';
import 'package:provider/provider.dart';


class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Fav>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: null,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Favorite",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.favorite,color: Colors.white,),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.getUserFav().length,
                  itemBuilder: (context, index) {
                    Course individualCourse = value.getUserFav()[index];
                    return FavoriteItem(course: individualCourse);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
