import 'package:flutter/material.dart';
import 'package:movie_app/utils/stext.dart';
import 'package:movie_app/widgets/desc.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Stext(
            text: 'Trending Movies',
            size: 25,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Description(
                                name: trending[index]['title'],
                                description: trending[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                                vote:
                                    trending[index]['vote_average'].toString(),
                                launch_on: trending[index]['release_date']),
                          ),
                        );
                      },
                      child: trending[index]['title'] != null
                          ? SizedBox(
                              width: 140,
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Stext(
                                    text: trending[index]['title'] != null
                                        ? trending[index]['title']
                                        : 'Loading',
                                    size: 15,
                                  ),
                                ]),
                              ),
                            )
                          : Container(),
                    );
                  })),
        ],
      ),
    );
  }
}
