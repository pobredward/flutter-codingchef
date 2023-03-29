import 'package:button/animal_page.dart';
import 'package:button/model.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  static List<String> animalName = [
    'Bear',
    'Camel',
    'Deer',
    'Fox'
  ];
  static List<String> animalImgPath = [
    'image/1.jpg',
    'image/2.jpg',
    'image/3.jpg',
    'image/4.png',
  ];
  static List<String> animalLocation = [
    'forest',
    'dessert',
    'snow mountain',
    'Australia'
  ];

  final List<Animal> animalData = List.generate(animalName.length, (index) =>
      Animal(animalName[index], animalImgPath[index], animalLocation[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.builder(
        itemCount: animalData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                animalData[index].name
              ),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(animalData[index].imgPath),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimalPage(animal: animalData[index])));
              },
            )
          );
        },
      )
    );
  }
}

