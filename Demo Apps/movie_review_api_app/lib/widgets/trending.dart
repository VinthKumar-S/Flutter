import 'package:flutter/material.dart';
import 'package:movie_review_api_app/utils/text.dart';

class TRendingMovies extends StatelessWidget
{
  final List trending;

  const TRendingMovies({Key? key,required this.trending}):super(key: key);
  
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         modified_text(text:"Trending Movies"),
         Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder:(context,index){
              return InkWell(
                onTap: (){

                },
                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                     /* Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:NetworkImage('https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'])
                          )
                        ),
                      ),*/
                      Container(
                        child: modified_text(text: trending[index]['title']!=null?
                        trending[index]['title']:"Loading"),
                      )
                    ],
                  )
                ),
              );
            }),
         )
        ],
      ),
    );
  }
}