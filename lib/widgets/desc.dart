import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              child: Text(
                ' ⭐ Average Rating-$vote',
                style: GoogleFonts.breeSerif(fontSize: 25),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              name != null ? name : 'Not Loaded',
              style: GoogleFonts.breeSerif(fontSize: 24),
            )),
        Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Releasing On-' + launch_on,
              style: GoogleFonts.breeSerif(fontSize: 14),
            )),
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
                  child: Text(
                    description,
                    style:const TextStyle(fontSize: 15),
                  )),
            )
          ],
        )
      ]),
    );
  }
}
