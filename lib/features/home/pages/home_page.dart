import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:seemovies/features/home/models/movie_model.dart';
import 'package:seemovies/features/home/services/movies_fetch_service.dart';
import 'package:seemovies/features/home/widgets/banner_section.dart';
import 'package:seemovies/features/home/widgets/scroll_row_sugestions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieModel? recomedation;
  List<MovieModel> listofmovies = [];

  @override
  void initState() {
    super.initState();
    _loadmovies();
  }

  Future _loadmovies() async {
    List<MovieModel> _listOfMovies = await MoviesFetchService().fecthMovies();

    final randomIndex = Random().nextInt(_listOfMovies.length);

    setState(() {
      recomedation = _listOfMovies[randomIndex];
      listofmovies = _listOfMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (recomedation == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      backgroundColor: AppColors().primary,
      appBar: AppBar(
        backgroundColor: AppColors().primary,
        leading: Icon(Icons.menu, color: AppColors().white),
        title: Text("Home", style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerSectionn(recomedation: recomedation!),
            Text("Sugestões"),
            SizedBox(
              height: 200,
              child: ScrollRowSugestions(listofmovies: listofmovies),
            ),
          ],
        ),
      ),
    );
  }
}
