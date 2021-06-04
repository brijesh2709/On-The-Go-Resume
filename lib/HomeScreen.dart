
import 'package:flutter/material.dart';
import 'package:on_the_go_resume_app/PersonalForm.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Image.asset(('assets/OnTheGoResume.png'),
            fit: BoxFit.cover)
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>PersonalForms())
            );
          },
          label: Text('Get Started',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          icon: Icon(Icons.arrow_forward_sharp),
          backgroundColor: Colors.deepOrange,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home,
                color: Colors.white,
                size: 40.0,),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,
                color: Colors.white,
                size: 40.0),
                label: '',
              ),
            ],

        ),
      ),
    );
  }
}