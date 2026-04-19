import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seemovies/core/services/firestore_service.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:seemovies/features/reviews/models/review_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateReview extends StatefulWidget {
  final int serieId;
  const CreateReview({super.key, required this.serieId});

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  final TextEditingController reviewController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  Future<void> _sendReview(review, note, serieId) async {
    final prefs = await SharedPreferences.getInstance();

    int _note = int.parse(note);

    if (_note  > 10) {
      _note  = 10;
    }

    ReviewModel _review = ReviewModel(
      uid: prefs.getString('userUid')!,
      serieId: serieId,
      review: review,
      note: _note,
    );

    try {
      await FirestoreService.createReview(_review);
    } catch (e) {
      print('Error: $e');
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: AppColors().white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Make your review about this serie!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors().primary,
                ),
              ),
              SizedBox(height: 25),
              TextField(
                controller: reviewController,
                decoration: InputDecoration(
                  label: Text('Your review here!'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: noteController,
                      decoration: InputDecoration(
                        label: Text('Whats your note? 0 - 10'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors().primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.send, color: AppColors().white),
                            SizedBox(width: 5),
                            Text(
                              'Send my review',
                              style: TextStyle(color: AppColors().white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      _sendReview(
                        reviewController.text,
                        noteController.text,
                        widget.serieId,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
