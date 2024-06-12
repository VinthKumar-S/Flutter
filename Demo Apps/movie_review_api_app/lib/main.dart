import 'package:flutter/material.dart';
import 'package:movie_review_api_app/utils/text.dart';
import 'package:movie_review_api_app/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      //theme: ThemeData(primarySwatch: Colors.pink),
      home: Home(),
    );
  }
}

 class Home extends StatefulWidget {
  //const Home({super.key});

  State<Home> createState() => _HomeState();
}




class _HomeState extends State<Home> {

   List trendingmovies=[];

   List topratedmovies=[];

   List tv=[];

  
  final String apiKey ='9da22fc698f422cdab644b880e728f18';
  final String readaccesstokan='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZGEyMmZjNjk4ZjQyMmNkYWI2NDRiODgwZTcyOGYxOCIsInN1YiI6IjY1NWE5ZWEwZDRmZTA0MDEzOTg0MTA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.O5WJZ7ez2haHjSQvzwnkXq1IeqpUDBcxBY6U445SkLI';
 
  loadmovies()async{
    try{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey,readaccesstokan),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    )
    );
    Map trendingresult=await tmdbWithCustomLogs.v3.trending.getTrending();

    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState((){
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
    }
    catch(e){
      print(e);
    }
  }


  Widget build(BuildContext context) {
    loadmovies();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 154, 208, 194),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 149, 150),
        title: modified_text(text: "Flutter Movie App",),
        actions: [
          IconButton(onPressed: (){
            loadmovies();
          }, icon: Icon(Icons.star))
        ],
      ),
      body: ListView(
          children: [
            //TRendingMovies(trending: trendingmovies)
          ],
        ),
    );
  }
}