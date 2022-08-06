import 'package:flutter/material.dart';
import 'package:movie_app/utils/stext.dart';
import 'package:movie_app/widgets/desc.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Stext(
            text: 'Popular TV Shows',
            size: 25,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () { Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Description(
                                name: tv[index]['original_name'],
                                description: tv[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['poster_path'],
                                vote:
                                    tv[index]['vote_average'].toString(),
                                launch_on: tv[index]['first_air_date']),
                          ),
                        );
                        },
                      child:tv[index]['backdrop_path']!= null? SizedBox(
                        width: 140,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        tv[index]['poster_path'],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Stext(
                              text: tv[index]['original_name'] != null
                                  ? tv[index]['original_name']
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
