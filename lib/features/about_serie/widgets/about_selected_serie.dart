import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:seemovies/features/home/models/movie_model.dart';

class AboutSelectedSerie extends StatefulWidget {
  final SerieModel serieSelected;
  const AboutSelectedSerie({super.key, required this.serieSelected});

  @override
  State<AboutSelectedSerie> createState() => _AboutSelectedSerieState();
}

class _AboutSelectedSerieState extends State<AboutSelectedSerie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.serieSelected.name,
          style: TextStyle(
            color: AppColors().white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white60),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.serieSelected.urlImageOriginal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Avaliation: ${widget.serieSelected.rating}',
                      style: TextStyle(color: AppColors().white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 25),
              Container(
                height: 280,
                width: 250,
                decoration: BoxDecoration(
                  color: AppColors().white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Genres',
                        style: TextStyle(
                          color: AppColors().primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: widget.serieSelected.genres.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Text(widget.serieSelected.genres[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        Text(
          'Summary',
          style: TextStyle(
            color: AppColors().white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            widget.serieSelected.summary,
            style: TextStyle(color: AppColors().white),
          ),
        ),
      ],
    );
  }
}
