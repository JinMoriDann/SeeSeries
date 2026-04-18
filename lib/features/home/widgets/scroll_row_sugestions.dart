import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:seemovies/features/about_serie/pages/about_serie_page.dart';
import 'package:seemovies/features/home/models/movie_model.dart';

class ScrollRowSugestions extends StatefulWidget {
  final List<SerieModel> listofmovies;
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
        final serie = widget.listofmovies[index];
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AboutSeriePage(serieSelected: serie),
                    ),
                  );
                },
                child: Container(
                  height: 140,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors().white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        serie.urlImageMedium,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 100,
                child: Text(
                  serie.name,
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
