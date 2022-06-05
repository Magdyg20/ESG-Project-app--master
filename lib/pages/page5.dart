import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data2.json');

    final data = await json.decode(response);
    setState(() {
      _items = data["cases"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            SafeArea(
                child: Image.asset('assets/m.jpeg')),
            const SizedBox(height: 30,),
            ElevatedButton(
              child: const Text('Result Data',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              onPressed: readJson,
            ),

            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(

              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white
                    ,

                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title:Container(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(radius: 20,
                            child: Text(_items[index]["number"].toString(),style:  TextStyle(fontSize: 20,),textAlign: TextAlign.start,)),
                      ),
                      subtitle: Text(_items[index]["result"]),
                    ),
                  );
                },
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }
}