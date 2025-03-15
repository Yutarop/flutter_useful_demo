import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final String data = 'Top Secret Data';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: MyText(),),
          ),
          body: Container(
            child: Level1(),
          ),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}


class Level1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Level3(),
        MyTextField(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context, listen: false ).data);
  }
}

class MyTextField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        onChanged: (newText){
          Provider.of<Data>(context, listen: false).changeString(newText);
        },
      ),
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString){
    data = newString;
    notifyListeners();
  }
}



