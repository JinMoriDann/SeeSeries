import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seemovies/features/auth/models/user_model.dart';
import 'package:seemovies/features/reviews/models/review_model.dart';

class FirestoreService {
  static Future<void> createUser(UserModel user) async {
    try {
      final db = FirebaseFirestore.instance;

      final data = <String, dynamic>{"name": user.name};

      await db.collection("users").doc(user.uid).set(data);

      print('Usuário criado com sucesso: ${user.uid}');
    } on FirebaseException catch (e) {
      print('FirebaseException: ${e.code}');
      print('Message: ${e.message}');
    } catch (e) {
      print('Erro inesperado: $e');
    }
  }

  static Future<String> getUser(uid) async {
    final db = FirebaseFirestore.instance;
    final user = await db.collection('users').doc(uid).get();

    final data = user.data();

    return data?['name'];
  }

  static Future<void> createReview(ReviewModel review) async {
    final db = FirebaseFirestore.instance;
    final data = review.toJson();
    await db.collection('reviews').add(data);
  }

  static Future<List<ReviewModel>> getReviews(serieId) async {
    final db = FirebaseFirestore.instance;

    final reviews = await db
        .collection('reviews')
        .where('serieId', isEqualTo: serieId)
        .get();
    return reviews.docs.map((doc) => ReviewModel.fromJson(doc.data())).toList();
  }
}
