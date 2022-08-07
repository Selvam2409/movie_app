import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List trendingMovies = [];
  List toprated = [];
  List tv = [];
  final String apikey = 'a062210c4d386d539b577b4b355367f4';
  final accesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDYyMjEwYzRkMzg2ZDUzOWI1NzdiNGIzNTUzNjdmNCIsInN1YiI6IjYyMjJkZDY5YTEyODU2MDA2ZTU1NGE4ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WYVfS4z1LYHUzpKfNMUB0WdPt585ZxDKoO_7IlJmZv0';

  loadingmovie() async {
    TMDB tmdb = TMDB(ApiKeys(apikey, accesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresult = await tmdb.v3.trending.getTrending();
    Map topratedresult = await tmdb.v3.movies.getTopRated();
    Map tvresult = await tmdb.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingresult['results'];
      toprated = topratedresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  void initState() {
    loadingmovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text('Movie App', style: GoogleFonts.breeSerif(fontSize: 25))),
      body: ListView(
        children: [
          TV(tv: tv),
          Toprated(toprated: toprated),
          TrendingMovies(trending: trendingMovies)
        ],
      ),
    );
  }
}
