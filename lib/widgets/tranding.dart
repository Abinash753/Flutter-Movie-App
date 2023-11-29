import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "Trending Movies", color: Colors.red, size: 20),
          const SizedBox(
            height: 11,
          ),
          Container(
            height: 275,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        //passing data to the description page to show the information  whenever user click the movie banner
                        return Description(
                            name: trending[index]["title"] ?? "N/A",
                            bannerUrl: "http://image.tmdb.org/t/p/w500" +
                                trending[index]["backdrop_path"],
                            posterUrl: "http://image.tmdb.org/t/p/w500" +
                                trending[index]["poster_path"],
                            description: trending[index]["overview"] ??
                                " No Description aviable",
                            vote: trending[index]["vote_average"].toString() ??
                                "00",
                            launchOn: trending[index]["release_date"] ??
                                " Unknown date");
                      }));
                    },
                    child: trending[index]["title"] != null
                        ? Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 205,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "http://image.tmdb.org/t/p/w500" +
                                              trending[index]["poster_path"]),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: ModifiedText(
                                      text: trending[index]["original_title"] !=
                                              null
                                          ? trending[index]["original_title"]
                                          : "Loading",
                                      size: 15,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
