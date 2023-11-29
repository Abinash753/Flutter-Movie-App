import "package:flutter/material.dart";
import "package:movie_app/utils/text.dart";
import "package:movie_app/widgets/tranding.dart";
import "package:movie_app/widgets/tv.dart";
import "package:tmdb_api/tmdb_api.dart";

import "widgets/topRated.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMovies = [];
  List topratedMovies = [];
  List tv = [];
  //copied both from  TMDB
  final String apiKey = "834f96d70f2d32daaaed1a1edd996e15";
  final readaccesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MzRmOTZkNzBmMmQzMmRhYWFlZDFhMWVkZDk5NmUxNSIsInN1YiI6IjY1NjViNGNhZDk1NDIwMDBlMTg5YTdkOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-Q1Fgajj-vdAsC8zPIQGaLYRMPpr5d01q9a88jp-kgM";

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

//function to tetch movie from api
  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readaccesstoken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    //first map for getting tredning movies
    Map trendingResult = await tmdbWithCustomLogs.v3.trending
        .getTrending(mediaType: MediaType.all);
    //second map for getting popular movies
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    //third map for getting tv shows
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult["results"] ?? "";
      topratedMovies = topRatedResult['results'] ?? "";
      tv = tvResult["results"];
    });
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 35, 197),
        title: const ModifiedText(
          text: "Flutter Movie App ❤️‍🩹",
          color: Colors.orange,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TV(tvShows: tv),
          TopRatedMovies(topRated: topratedMovies),
          TrendingMovies(trending: trendingMovies),
        ],
      ),
    );
  }
}
