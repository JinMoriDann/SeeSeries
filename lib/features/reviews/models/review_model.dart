import 'dart:core';

class ReviewModel {
  final String uid;
  final int serieId;
  final String review;
  final int note;

  const ReviewModel({
    required this.uid,
    required this.serieId,
    required this.review,
    required this.note,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      uid: json['uid'] ?? 0,
      serieId: json['serieId'] ?? 0,
      review: json['review'] ?? '',
      note: json['note'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'serieId': serieId, 'review': review, 'note': note};
  }
}
