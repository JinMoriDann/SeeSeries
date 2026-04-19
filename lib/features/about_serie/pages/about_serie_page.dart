import 'package:flutter/material.dart';
import 'package:seemovies/core/services/firestore_service.dart';
import 'package:seemovies/features/about_serie/widgets/about_selected_serie.dart';
import 'package:seemovies/features/app_shell/app_shell.dart';
import 'package:seemovies/features/home/models/movie_model.dart';
import 'package:seemovies/features/reviews/models/review_model.dart';
import 'package:seemovies/features/reviews/pages/create_review.dart';
import 'package:seemovies/features/reviews/pages/reviews.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutSeriePage extends StatefulWidget {
  final SerieModel serieSelected;
  const AboutSeriePage({super.key, required this.serieSelected});

  @override
  State<AboutSeriePage> createState() => _AboutSeriePageState();
}

class _AboutSeriePageState extends State<AboutSeriePage> {
  List<ReviewModel> reviews = [];
  String userId = '';

  @override
  void initState() {
    super.initState();
    _loadReviews(widget.serieSelected.id);
    _loadUserData();
  }

  Future<void> _loadReviews(serieId) async {
    final _reviews = await FirestoreService.getReviews(serieId);
    setState(() {
      reviews = _reviews;
    });
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('userUid')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final alreadyReviewed = reviews.any((r) => r.uid == userId);
    return AppShel(
      title: 'About',
      body: SingleChildScrollView(
        child: Column(
          children: [
            AboutSelectedSerie(serieSelected: widget.serieSelected),
            Padding(padding: const EdgeInsets.all(16), child: Divider()),
            if (!alreadyReviewed) ...[
              CreateReview(serieId: widget.serieSelected.id),
              Padding(padding: const EdgeInsets.all(16), child: Divider()),
            ],
            Reviews(reviews: reviews),
          ],
        ),
      ),
    );
  }
}
