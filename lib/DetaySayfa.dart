import 'package:filmler_gridview/Filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {


  @override
  _DetaySayfaState createState() => _DetaySayfaState();

  late Filmler film;

  DetaySayfa({required this.film});

}

class _DetaySayfaState extends State<DetaySayfa> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_ad),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/${widget.film.film_resim}"),
            Text("${widget.film.film_ad}" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            Text("${widget.film.film_fiyat} \u{20ba}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ElevatedButton(onPressed: (){

              print("${widget.film.film_ad} kiralandı");

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${widget.film.film_ad} filmini kiraladınız"),
                backgroundColor: Colors.greenAccent,
                action: SnackBarAction(label: "Tamam",
                    textColor: Colors.black54,
                    onPressed:(){

                }),)

              );

            },
                child: Text("Kirala"),

            )


          ],

        ),
      ),
    );
  }
}
