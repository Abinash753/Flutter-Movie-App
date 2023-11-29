import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRated;

  const TopRatedMovies({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: "Top Rated Movies", color: Colors.red, size: 20),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 260,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          //ibanner of the movies
                          Container(
                            height: 205,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "http://image.tmdb.org/t/p/w500" +
                                        topRated[index]["poster_path"]),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          //title of the top rated movies
                          Container(
                            child: ModifiedText(
                              text: topRated[index]["title"] != null
                                  ? topRated[index]["title"]
                                  : "Loading",
                              size: 15,
                              color: const Color.fromARGB(255, 250, 246, 246),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
