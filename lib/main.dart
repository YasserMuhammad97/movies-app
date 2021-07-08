import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import 'package:movies_app/widgets/toprated.dart';
import 'package:movies_app/widgets/trending.dart';
import 'package:movies_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List popularTvShows = [];
  final String apiKey = 'fad40758622ddbe3872919da74076121';
  final String readAcessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYWQ0MDc1ODYyMmRkYmUzODcyOTE5ZGE3NDA3NjEyMSIsInN1YiI6IjYwY2I4MWYyYzM5MGM1MDA0MTM3MDQwMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5MV00sYAhO53BCfxT964056wfPFB4nPx6W6jZEuo3FU';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAcessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResults = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      trendingMovies = trendingResults['results'];
      topRatedMovies = topRatedResults['results'];
      popularTvShows = tvResults['results'];
    });
    print(popularTvShows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ModifiedText(
          text: 'FLutter Movie App',
        ),
      ),
      body: ListView(
        children: [
          TopRated(topRated: topRatedMovies,)
          ,
          TvShows(popTvShows: popularTvShows,),
          TrendingMovies(
            trending: trendingMovies,
          ),

        ],
      ),
    );
  }
}
