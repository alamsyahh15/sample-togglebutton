import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageHome(),
    );
  }
}

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  var myListData = [
    {"name":"John", "check":[false, false, false]},
    {"name":"Laura", "check":[false, false, false]},
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Sample Apps"),
      ),

      body: ListView.builder(
        itemCount: myListData.length,
        itemBuilder: (BuildContext context, int index) {
          var data = myListData[index];
          return Container(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Text("${data["name"]}"),
                    Row(
                      children: <Widget>[
                        ToggleButtons(
                          children: <Widget>[
                            Text("Ijin"),
                            Text("Sakit"),
                            Text("Alpha"),
                          ],
                          isSelected: data["check"],
                          onPressed: (int index){
                            List dataCheck = data["check"];
                            setState(() {
                              for (int buttonIndex = 0; buttonIndex < dataCheck.length; buttonIndex++) {
                                if (buttonIndex == index) {
                                  dataCheck[buttonIndex] = true;
                                  print(index);
                                } else {
                                  dataCheck[buttonIndex] = false;
                                }
                              }
                            });
                          },

                        )
                      ],
                    )
                  ],
                ),

              ),
            ),
          );
        },
      ),

    );
  }
}

