import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';

import '../descriptionScreen.dart';

class TvShows extends StatelessWidget {
  final List popTvShows;

  const TvShows({Key key, this.popTvShows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModifiedText(
              text: 'Popular Tv Shows ',
              size: 26,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popTvShows.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      
                      Navigator.push(context,MaterialPageRoute(builder:(context)=> DescriptionScreen(
                        name: popTvShows[index]['original_name'],
                        bannerUrl: 'https://image.tmdb.org/t/p/w500'+popTvShows[index]['backdrop_path'],
                        posterUrl: 'https://image.tmdb.org/t/p/w500'+popTvShows[index]['poster_path'],
                        description: popTvShows[index]['overview'],
                        vote: popTvShows[index]['vote_average'].toString(),
                        launch_on: popTvShows[index]['first_air_date'],
                      ) ));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      popTvShows[index]['backdrop_path'],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: ModifiedText(
                                text: popTvShows[index]['original_name'] != null
                                    ? popTvShows[index]['original_name']
                                    : 'unknown'),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
