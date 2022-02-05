import 'package:filmler_gridview/DetaySayfa.dart';
import 'package:filmler_gridview/Filmler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Filmler Uygulaması'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Filmler>> filmleriGoster() async {

    var filmlerListesi = <Filmler>[];
    var f1 = Filmler(1, "Anadoluda", "anadoluda.png", 9.99);
    var f2 = Filmler(2, "Django", "django.png", 9.99);
    var f3 = Filmler(3, "Inception", "inception.png", 9.99);
    var f4 = Filmler(4, "The Pianist", "thepianist.png", 9.99);
    var f5 = Filmler(5, "Interstellar", "interstellar.png", 9.99);
    var f6 = Filmler(6, "The hateful 7", "anadoluda.png", 9.99);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);

    return filmlerListesi;


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Filmler>>(
          future: filmleriGoster(),
          builder: (context,snapshot){
            if (snapshot.hasData) {

              var filmlerListesi = snapshot.data;

              return GridView.builder(
                  itemCount: filmlerListesi!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2/3.5,
                  ),
                  itemBuilder: (context,index){
                    var film = filmlerListesi[index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film)));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("images/${film.film_resim}"),
                            ),
                            Text("${film.film_ad}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            Text("${film.film_fiyat} \u{20ba}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                          ],

                        ),
                      ),
                    );

                 },

              );
              
            } else {
              return const Center();
            }
          }
      )


    );
  }
}
