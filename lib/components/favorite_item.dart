import 'package:flutter/material.dart';
import 'package:flutter_exo1/models/fav.dart';
import 'package:provider/provider.dart';

import '../models/course.dart';

// ignore: must_be_immutable
class FavoriteItem extends StatefulWidget {
  Course course;
  FavoriteItem({super.key, required this.course});

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  void removeItemFromFav() {
    Provider.of<Fav>(context, listen: false).removeItemFromFav(widget.course);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        leading: Image.asset(widget.course.imagePath),
        title: Text(widget.course.name),
        subtitle: Text(widget.course.price),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: removeItemFromFav,
        ),
      ),
    );
  }
}
