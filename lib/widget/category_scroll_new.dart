import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomenewsCategory extends StatelessWidget {
  const HomenewsCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        //color: Colors.amber,
        child: ListView.builder(
          itemCount: 8,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "News",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Color(0xffBEBEBE),
                      letterSpacing: .5,
                      fontSize: 20),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
