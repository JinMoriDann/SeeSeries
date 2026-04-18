import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:seemovies/features/home/models/movie_model.dart';

class ScrollRowSugestions extends StatefulWidget {
  final List<MovieModel> listofmovies;
  const ScrollRowSugestions({super.key, required this.listofmovies});

  @override
  State<ScrollRowSugestions> createState() => _ScrollRowSugestionsState();
}

class _ScrollRowSugestionsState extends State<ScrollRowSugestions> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listofmovies.length,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 140,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors().white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.listofmovies[index].urlImageMedium,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 100,
                child: Text(
                  '${widget.listofmovies[index].name}',
                  style: TextStyle(color: AppColors().white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
