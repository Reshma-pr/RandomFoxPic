import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_fade/image_fade.dart';
import 'image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.replay),
            onPressed: () {
              setState(() {
                FoxImage();
              });
            }),
        appBar: AppBar(
          title: Text("Cute Fox"),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Center(
            child: Stack(
          children: [
            FoxImage(),
          ],
        )));
  }
}

class FoxImage extends StatelessWidget {
  const FoxImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getJson(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return Image.network(
                "${snapshot.data}",
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              );
            }
        }
      },
    );
  }
}
