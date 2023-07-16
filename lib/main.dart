import 'package:berk_hesapmakinesi/widgets/buttontasarimi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BerkHesapMakinesi());

}

class BerkHesapMakinesi extends StatefulWidget {
  const BerkHesapMakinesi({Key? key}) : super(key: key);

  @override
  State<BerkHesapMakinesi> createState() => _BerkHesapMakinesiState();
}

class _BerkHesapMakinesiState extends State<BerkHesapMakinesi> {

  //Tutucular
  late int sayi1;
  late int sayi2;
  String gosterilecekSayi = "";
  String islemGecmisi = "";
  late String sonuc;
  late String islemTutucu;



  //Button tiklama
  void btnTiklama (String buttonDegeriTutucu)
  {


    if (buttonDegeriTutucu == "AC")
      {
        //Hepsini temizle
        gosterilecekSayi = "";
        sonuc = "";
        sayi1 = 0;
        sayi2 = 0;
        islemGecmisi = "";
        islemTutucu = "";
      }
    else if (buttonDegeriTutucu == "C")
      {
        //Yazılan değeri temizle (İşlem geçmişi hariç)
        gosterilecekSayi = "";
        sonuc = "";
        sayi1 = 0;
        sayi2 = 0;
      }
    else if (buttonDegeriTutucu == "BACK")
    {
      //Yazılan değeri temizle
      sonuc = gosterilecekSayi.substring(0,gosterilecekSayi.length-1);
    }
    else if (buttonDegeriTutucu == "/")
    {
      //Gösterilen sayıyı sayı 1 e aktar, sonucu temizle, bölme işlemini yap
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    }
    else if (buttonDegeriTutucu == "X")
    {
      //Gösterilen sayıyı sayı 1 e aktar, sonucu temizle, çarpma işlemini yap
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    }
    else if (buttonDegeriTutucu == "-")
    {
      //Gösterilen sayıyı sayı 1 e aktar, sonucu temizle, çıkarma işlemini yap
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    }
    else if (buttonDegeriTutucu == "+")
    {
      //Gösterilen sayıyı sayı 1 e aktar, sonucu temizle, toplama işlemini yap
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    }
    else if (buttonDegeriTutucu == "=")
    {
      //Sayı 2 yi ata, hangi işlemse yaptır
      sayi2 = int.parse(gosterilecekSayi);

      if(islemTutucu == "+")
        {
          //Toplama yaptır
          sonuc = (sayi1 + sayi2).toString();
          islemGecmisi = sayi1.toString()+islemTutucu.toString()+sayi2.toString();
        }
      else if(islemTutucu == "-")
      {
        //Çıkarma yaptır
        sonuc = (sayi1 - sayi2).toString();
        islemGecmisi = sayi1.toString()+islemTutucu.toString()+sayi2.toString();
      }
      else if(islemTutucu == "X")
      {
        //Çarpma yaptır
        sonuc = (sayi1 * sayi2).toString();
        islemGecmisi = sayi1.toString()+islemTutucu.toString()+sayi2.toString();
      }
      else if(islemTutucu == "/")
      {
        //Bölme yaptır
        sonuc = (sayi1 / sayi2).toString();
        islemGecmisi = sayi1.toString()+islemTutucu.toString()+sayi2.toString();
      }
    }
    else if (buttonDegeriTutucu == "-/+")
    {
      //Sayının durumuna göre pozitifse negatif, negatifse pozitif yapsın
      if(gosterilecekSayi[0] != "-")
        {
          //Pozitifse negatif yap
          sonuc = "-$gosterilecekSayi";
        }
      else{
        sonuc = gosterilecekSayi.substring(1);
      }
    }
    //Rakamlara tıklandığında
    else
      {
        sonuc = int.parse(gosterilecekSayi + buttonDegeriTutucu).toString();
      }

    //Yenileme durum yenileme
    setState(() {
      gosterilecekSayi=sonuc;
    });



  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Hesap Makinesi",
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                alignment: const Alignment(1.0,1.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,12,8),
                  child: Text(
                    islemGecmisi,
                  style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.black54,
                    ),
                  ),
                ),
              )
            ),
            Container(
              alignment: const Alignment(1.0,1.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,0,12,8),
                child: Text(
                  gosterilecekSayi,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HesapMakinesiButonu(metin: "AC", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "C", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "BACK", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 20.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "/", dolguRengi: 0x4CAF50FF, metinRengi: 0x4CAF50FF, metinBotuyu: 30.0, tiklama: btnTiklama),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HesapMakinesiButonu(metin: "7", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "8", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "9", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "X", dolguRengi: 0x4CAF50FF, metinRengi: 0x4CAF50FF, metinBotuyu: 30.0, tiklama: btnTiklama),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HesapMakinesiButonu(metin: "4", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "5", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "6", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "-", dolguRengi: 0x4CAF50FF, metinRengi: 0x4CAF50FF, metinBotuyu: 30.0, tiklama: btnTiklama),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HesapMakinesiButonu(metin: "1", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "2", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "3", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "+", dolguRengi: 0x4CAF50FF, metinRengi: 0x4CAF50FF, metinBotuyu: 30.0, tiklama: btnTiklama),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HesapMakinesiButonu(metin: "-/+", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "0", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "00", dolguRengi: 0xFF5722FF, metinRengi: 0x000000FF, metinBotuyu: 30.0, tiklama: btnTiklama),
                HesapMakinesiButonu(metin: "=", dolguRengi: 0x4CAF50FF, metinRengi: 0x4CAF50FF, metinBotuyu: 30.0, tiklama: btnTiklama),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





