import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:seemovies/features/home/models/movie_model.dart';

class BannerSectionn extends StatefulWidget {
  final SerieModel recomedation;
  const BannerSectionn({super.key, required this.recomedation});

  @override
  State<BannerSectionn> createState() => _BannerSectionnState();
}

class _BannerSectionnState extends State<BannerSectionn> {
  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              '${widget.recomedation.urlImageMedium}',
              width: windowWidth,
              height: 400,
              fit: BoxFit.cover,
            ),
            Container(
              height: 400,
              width: windowWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, ?AppColors().primary],
                  stops: [0.7, 1.0],
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          width: windowWidth,
          decoration: BoxDecoration(color: AppColors().primary),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Recomedation",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: windowWidth,
          decoration: BoxDecoration(color: AppColors().primary),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Summary: ${widget.recomedation.summary}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w100,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
