import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:seemovies/features/reviews/models/review_model.dart';

class Reviews extends StatefulWidget {
  final List<ReviewModel?> reviews;
  const Reviews({super.key, required this.reviews});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    if (widget.reviews.isEmpty) {
      return Text('Zero reviews');
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.reviews.length,
      itemBuilder: (context, index) {
        final currentReview = widget.reviews[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors().white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Expanded(child: Text(currentReview!.review))],
              ),
            ],
          ),
        );
      },
    );
  }
}
