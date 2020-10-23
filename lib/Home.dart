import 'package:flutter/material.dart';
import './ContentPage.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() =>
      HomeState(); // ambil kelas homestate untuk  grid view
}

class HomeState extends State<Home> {
  List<String> names = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Banget'),
          titleSpacing: 100.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('login'),
              leading: IconButton(
                icon:Icon(Icons.input),
              ),
            ),
            ListTile(
              title: Text('Singup'),
              leading: IconButton(
                icon:Icon(Icons.supervised_user_circle)
              ),
            ),
            ListTile(
              title: Text('Pengaturan'),
              leading: IconButton(
                icon:Icon(Icons.settings)
              ),
            ),
          ]
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(names.length, (index) {
          return GridTile(
            child: GestureDetector(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/' + names[index] + '.jpg'),
                )),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ContentPage(value: names[index]); // kirim data
                }));
              },
            ),
          );
        }),
      ),
    );
  }
}
