import 'package:bullet/HOme.dart';
import 'package:bullet/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'page5.dart';

class HDForm extends StatefulWidget {

  @override
  _HDFormState createState() => _HDFormState();
}

class _HDFormState extends State<HDForm> {

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(future: _initializeFirebase(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return DForm();
        }
        return const Center(child: CircularProgressIndicator(),);
      }
      ),

    );
  }
}

class DForm extends StatefulWidget {

  @override
  State<DForm> createState() => _DFormState();
}

class _DFormState extends State<DForm> {

// login function
// ignore: non_constant_identifier_names
  static Future<User?> loginUsingEmailPassword(
      {required String email, required String password, required BuildContext context }) async
  {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("the email is not correct");
      }
    }

    return user;
  }

final formkey=GlobalKey<FormState>();
void meg() {
  if (formkey.currentState!.validate()) {
    print("gggg");
  } else {
    print("magdy");
  }
}
  @override
  Widget build(BuildContext context) {



  TextEditingController emcontrol = TextEditingController();
  TextEditingController passcontrol = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
    body: Padding(
      padding:  EdgeInsets.all(16.0),
      child:SingleChildScrollView(
        child:Form(
          key: formkey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.start,
            children:[

          SafeArea(
          child: Image.asset('assets/hh.webp')),
    const Text("Welcome Doctor",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "Pacifico"),),

    const SizedBox(height: 30,),
    Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
    const Text("Email",style: TextStyle(fontSize: 15,color: Colors.grey,),),
    //SizedBox(height: 2,),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    child: Container(

    alignment: Alignment.center,
    decoration: const BoxDecoration(
    color: Colors.lightBlueAccent,
    borderRadius: BorderRadius.all(Radius.circular(20)),

    boxShadow: [
    BoxShadow(
    color: Colors.black12,
    blurRadius: 8,
    offset: Offset(0, 3),

    )
    ]
    ),
    //height: 70,
    child:  Container(
      padding: EdgeInsetsDirectional.only(start: 10),
      width: 600,
      height: 80,
      child: TextFormField(
        controller: emcontrol,
      decoration:const  InputDecoration(

      border: InputBorder.none,
      prefixIcon: Icon(Icons.email,size:25,color:Colors.blueAccent ,),
      hintText: "Enter your Email",
      helperStyle: TextStyle(color: Colors.black12),
      ),

      validator: (value){
            if(value!.isEmpty){return   "email is Required";}else{return null;}
      },

      keyboardType:TextInputType.emailAddress,
      ),
    ),

    ),
    ),
    SizedBox(height: 10,),
    Text("Password",style: TextStyle(color: Colors.grey,fontSize: 15),),
    //SizedBox(height: 5,),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    child: Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
    color: Colors.lightBlueAccent,
    borderRadius: BorderRadius.all(Radius.circular(20)),
    boxShadow: [
    BoxShadow(
    color: Colors.black12,
    blurRadius: 8,
    offset: Offset(0, 3),

    )
    ]
    ),
    //height: 70,

    child:   Container(
      padding: const EdgeInsetsDirectional.only(start: 10),
      width: 600,
      height: 80,
      child: TextFormField(
        controller: passcontrol,
      obscureText: true,
      decoration: InputDecoration(

      border: InputBorder.none,
      prefixIcon: Icon(Icons.lock,size:25,color:Colors.blueAccent ,),
      hintText: "Enter your Password",
      helperStyle: TextStyle(color: Colors.black12)

      ),
      validator: (value){if(value!.isEmpty){return "password is Required";}else{return null;}},
      keyboardType: TextInputType.visiblePassword,
      ),
    ),

    ),
    ),
    SizedBox(height: 20,),

    Padding(
    padding: const EdgeInsets.only(left: 60,right: 60),
    child: Container(
    width:double.infinity,
    height: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(70),
    color: Colors.black
    ),
    child: MaterialButton(onPressed:()async {meg();
    User? user = await loginUsingEmailPassword(email: emcontrol.text, password: passcontrol.text, context: context);
    print(user);
    if (user != null) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),));
    }
    },child: Text("Login",style: TextStyle(fontSize: 30,
    color: Colors.white),),),
    ),
    ),



    ],
    ),
    ),

    ],
    ),
        ),
      ),
    ),


    );
  }
}









