import "package:flutter/material.dart";
import "package:movie_app/utils/text.dart";

class TV extends StatelessWidget {
  final List tvShows;
  const TV({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: "Popular TV Shows", color: Colors.grey, size: 22),
          const SizedBox(
            height: 11,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvShows.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      width: 240,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "http://image.tmdb.org/t/p/w500" +
                                        tvShows[index]["backdrop_path"],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: ModifiedText(
                              text: tvShows[index]["original_name"] != null
                                  ? tvShows[index]["original_name"]
                                  : "Loading",
                              size: 15,
                              color: Color.fromARGB(255, 251, 251, 251),
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
