import 'package:bullet/HOme.dart';

import 'page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  var case_name = TextEditingController();
  var case_number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        leading:IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Vector()));
        }, icon:Icon(Icons.arrow_back,size:39,color: Colors.black,))
      ),
      backgroundColor: Colors.white,
    body: Padding(
       padding: const EdgeInsets.all(20.0),
      child:SafeArea(
        child:SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/k.jpeg',),
              SizedBox(height: 36.06,),
              Container(
                padding: EdgeInsetsDirectional.all(10),
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.deepPurple,

                ),
                child: TextFormField(
                  controller: case_name,
                  keyboardType: TextInputType.name,
                  decoration:  InputDecoration(
                    hintText: 'First Name',

                    border: InputBorder.none
                  ),
                  onFieldSubmitted: (String _) {
                    print(_);
                  },
                ),
              ),
              SizedBox(height: 70),
              Container(
                width: double.infinity,
                height: 90,
                padding: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.deepPurple

                ),
                child: TextFormField(

                  controller: case_number,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(

                    hintText: 'Number Of Case',
                    border: InputBorder.none,

                  ),
                  onFieldSubmitted: (String _) {
                    print(_);
                  },
                ),
              ),
              SizedBox(height:70),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.redAccent[200],

                    borderRadius: BorderRadius.circular(100)
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Page3(value: case_number.text,)),
                    );
                  },
           // color: Colors.red,
            child:  Text('Submit', style: TextStyle(fontSize: 20,color: Colors.white,))
                ),
              )
            ],
          ),

        ),
        ),
      ),
    );
  }
}
class NextPage extends StatefulWidget {
   var value;
  NextPage({ Key ? key,  this.value}): super(key: key);
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Next'),),
    body: Text("case${widget.value}"),
    );
  }
}

