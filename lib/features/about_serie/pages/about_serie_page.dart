import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:seemovies/features/home/models/movie_model.dart';

class AboutSeriePage extends StatefulWidget {
  final SerieModel serieSelected;
  const AboutSeriePage({super.key, required this.serieSelected});

  @override
  State<AboutSeriePage> createState() => _AboutSeriePageState();
}

class _AboutSeriePageState extends State<AboutSeriePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            widget.serieSelected.name,
            style: TextStyle(
              color: AppColors().primary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.serieSelected.urlImageOriginal,
                        ),
                      ),
                    ),
                  ),
                  Text('Avaliation: ${widget.serieSelected.rating}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
