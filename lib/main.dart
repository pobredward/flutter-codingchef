import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var titleList = ['Dentist', 'Pharmacist', 'IT manager', 'product manager'];

  var imageList = [
    'image/1.jpg',
    'image/2.jpg',
    'image/3.jpg',
    'image/4.png',
  ];

  var description = [
    '1. hello, this isfdfkf dslfm dslfmlddsf dslfm dsf dslfm dslfmldf dslfm dslfmldlfmld f',
    '2. hello, this isfdfkdf dslfm dslfmldsf dslfm dslff dslfm dslfmldf dslfm dslfmldf dslfm dslfmldmld f',
    '3. hello, this isfdfkf dslfm dslfmlddf dslfm dslfmldf dslfm dslfmldsf dslfm dslfmld f',
    '4. hello, this isfdfkf dslfm dslfmldf dslfm dslfmldf dslfm dslfmlddsf dslfm dslfmld f',
  ];

  void showPopup(context, title, image, description) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      image,
                      width: 200,
                      height: 200
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      description,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[500],
                      )
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                      label: const Text('Close'))
                ],
              )
            )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20.0,
            )),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showPopup(context, titleList[index], imageList[index], description[index]);
              },
              child: Card(
                  child: Row(
                    children: [
                      SizedBox(width: 100, height: 100, child: Image.asset(imageList[index])),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                titleList[index],
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: width,
                                child: Text(
                                  description[index],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              )
                            ],
                          ))
                ],
              )),
            );
        }));
  }
}
