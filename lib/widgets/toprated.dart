import 'package:flutter/material.dart';
import 'package:movie_app/utils/stext.dart';
import 'package:movie_app/widgets/desc.dart';

class Toprated extends StatelessWidget {
  final List toprated;
  const Toprated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Stext(
            text: 'Top Rated Movies',
            size: 25,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height:270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                         Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Description(
                                name: toprated[index]['title'],
                                description: toprated[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path'],
                                vote:
                                    toprated[index]['vote_average'].toString(),
                                launch_on: toprated[index]['release_date']),
                          ),
                        );
                      },
                      child:toprated[index]['title'] != null?SizedBox(
                        width: 140,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        toprated[index]['poster_path'],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Stext(
                              text: toprated[index]['title'] != null
                                  ? toprated[index]['title']
                                  : 'Loading',
                              size: 15,
                            )
                          ]),
                        ),
                      ):Container(),
                    );
                  })),
        ],
      ),
    );
  }
}
