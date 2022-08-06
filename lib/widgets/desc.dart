import 'package:flutter/material.dart';
import 'package:movie_app/utils/stext.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;
  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        SizedBox(
          height: 250,
          child: Stack(children: [
            Positioned(
                child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                bannerurl,
                fit: BoxFit.cover,
              ),
            )),
            Positioned(
              bottom: 10,
              child: Stext(
                text: '  ⭐ Average Rating-$vote',
                size: 18,
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Stext(
            text: name != null ? name : 'Not Loaded',
            size: 24,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Stext(
            text: 'Releasing On-' + launch_on,
            size: 14,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              height: 200,
              width: 100,
              child: Image.network(posterurl),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: Stext(
                  text: description,
                  size: 15,
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
