import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  //
  final String name, description, bannerUrl, posterUrl, vote, launchOn;
  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.vote,
      required this.launchOn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          child: ListView(
            children: [
              Container(
                height: 250,
                child: Stack(
                  children: [
                    //banner of the
                    Positioned(
                        child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerUrl,
                        fit: BoxFit.cover,
                      ),
                    )),
                    //disply the average rate of the movie
                    Positioned(
                        bottom: 10,
                        child: ModifiedText(
                          text: " ⭐ Average Rating-" + vote,
                          size: 17,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              //displaying the title of the movie
              Container(
                padding: const EdgeInsets.all(10),
                child: ModifiedText(
                    text: name != null ? name : "Not Loaded",
                    color: Colors.white,
                    size: 17),
              ),
              const SizedBox(
                height: 5,
              ),
              // displaying the release date
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: ModifiedText(
                    text: "Releasing on: " + launchOn,
                    color: Colors.white,
                    size: 16),
              ),
              const SizedBox(
                height: 7,
              ),

              Row(
                children: [
                  //displaying poster of the movie
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 200,
                    width: 100,
                    child: Image.network(posterUrl),
                  ),

                  //displaying the description
                  Flexible(
                    child: Container(
                      child: ModifiedText(
                          text: description, color: Colors.white, size: 17),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
