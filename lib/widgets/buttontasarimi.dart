import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HesapMakinesiButonu extends StatelessWidget {
  const HesapMakinesiButonu({Key? key, required this.metin, required this.dolguRengi, required this.metinRengi, required this.metinBotuyu, required this.tiklama}) : super(key: key);

  //Button tasarım parametreleri
  final String metin;
  final int dolguRengi;
  final int metinRengi;
  final double metinBotuyu;
  final Function tiklama;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: SizedBox(
        width: 90,
        height: 90,
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
          ),
          onPressed: () {
            tiklama(metin);
          },
          child: Text(
              metin,
              style : GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: metinBotuyu,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
