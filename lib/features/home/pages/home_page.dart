import 'dart:math';
import 'package:flutter/material.dart';
import 'package:seemovies/features/app_shell/app_shell.dart';
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
  SerieModel? recomedation;
  List<SerieModel> listofmovies = [];

  @override
  void initState() {
    super.initState();
    _loadmovies();
  }


  Future _loadmovies() async {
    List<SerieModel> _listOfMovies = await SeriesFetchService().fecthSeries();

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
    return AppShel(
      title: 'Home',
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
