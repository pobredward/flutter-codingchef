import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold Messanger"),
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Like a new snack bar!'),
                duration: Duration(seconds: 5),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdPage())
                    );
                  },
                )
            ),
          );
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          child: const Text("Go to the second page"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        )
    );
  }
}


class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Second Page')
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('좋아요가 추가되었습니다',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.redAccent
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print('Short Click');
                  },
                  onLongPress: () {
                    print('Long Click');
                  },
                  child: Text(
                      'Text Button',
                      style: TextStyle(
                        fontSize: 30.0,
                      )
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      print('Elevated button');
                    },
                    child: Text('Elevated Button'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    )
                ),
                OutlinedButton(
                    onPressed: () {
                      print('Outlined Button');
                    },
                    child: Text('Outlined Button'),
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green,
                        side: BorderSide(
                          color: Colors.red,
                          width: 3,
                        )
                    )
                ),
                TextButton.icon(
                    onPressed: null,
                    icon: Icon(
                      Icons.home,
                      size: 20.0,
                      color: Colors.green,
                    ),
                    label: Text('Go to Home'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.green,
                      minimumSize: Size(300, 300),
                      disabledBackgroundColor: Colors.amber,
                    )
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  buttonPadding: EdgeInsets.all(10),
                  children: [
                    TextButton(
                      onPressed: (){},
                      child: Text('enter'),
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: Text('exit'),
                    ),
                  ],
                )
              ],
            )
        )
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Third Page')
        ),
        body: Builder(
            builder: (context) {
              return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('좋아요를 취소하시겠습니까?',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.redAccent
                        ),
                      ),
                      ElevatedButton(onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('좋아요가 취소되었습니다'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }, child: Text('취소하기'))
                    ],
                  )
              );
            }
        ),
      ),
    );
  }
}