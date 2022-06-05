import 'package:bullet/pages/page2.dart';
import 'package:bullet/pages/page4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vector  extends StatefulWidget {

  @override
  State<Vector> createState() => _VectorState();
}

class _VectorState extends State<Vector> {
  var _ss;
  var a=0;

  Expanded button(){
    return Expanded(
      child: Container(
       // width: double.infinity,
       // height: 200,
        decoration:  const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft, end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.deepPurple,
              ],
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text("welcome!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Pacifico'),),
              const SizedBox(height: 15,),
              const Text("Your Health Is Our Priority",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
              const SizedBox(height: 50,),
              const Text("Choose",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold,),),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(

                  children:[
                    Radio(value:1, groupValue: _ss, onChanged:(var bb){
                      setState(() {
                        _ss=bb;
                        a=1;

                      });


                    }),
                    //SizedBox(width: 3,),
                    const Text("patient",style: TextStyle(fontSize: 20,color: Colors.black),),
                    const SizedBox(width: 50),
                    //  IconButton(onPressed:(){a=2;}, icon: Icon(Icons.arrow_forward,size: 20,)),

                    const SizedBox(width: 10,),
                    Radio(value:2, groupValue: _ss, onChanged:(vv){
                      setState(() {
                        a=2;
                        _ss=vv;

                      });
                    }),


                    const Text("Doctor",style: TextStyle(fontSize: 20,color: Colors.black),),
                  ],

                ),

              ),
              const SizedBox(height: 40,),
              Center(
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child:MaterialButton(
                      onPressed:(){
                        if(a==2){Navigator.push(context, MaterialPageRoute(builder: (context)=>HDForm()
                        ));}
                        else{Navigator.push(context, MaterialPageRoute(builder:(context)=>UserForm()));}
                      }, child:  const Text("Continue",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,
                  ),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Image.asset("assets/nag.png",),
        SizedBox(height: 100,),
        button(),
      ],),

    );

  }
}
