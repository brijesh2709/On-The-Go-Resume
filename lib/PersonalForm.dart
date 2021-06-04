import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_the_go_resume_app/ExperienceForm.dart';

var pdfDict = new Map();

class Details{
  String name = '';
  String phoneNumber = '';
  String email = '';
  String linkedIn = '';
  String gitHub = '';
  String address = '';
}

class PersonalForms extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var userDetails = new Details();
    String nameUpd = '';
    String phoneNumberUpd = '';
    String emailUpd = '';
    String linkedInUpd = '';
    String gitHubUpd = '';
    String addressUpd = '';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Information'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                userDetails.name = nameUpd;
                userDetails.phoneNumber = phoneNumberUpd;
                userDetails.email = emailUpd;
                userDetails.linkedIn = linkedInUpd;
                userDetails.gitHub = gitHubUpd;
                userDetails.address = addressUpd;
                pdfDict['User Details'] = userDetails;
              },
              child: Text("Save",
              style: TextStyle(color: Colors.white),),
            ),
          ],
          backgroundColor: Colors.deepOrange,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              child: Column(children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder()
                    ),
                    onChanged: (value) => {nameUpd = value},
                  ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder()
                  ),
                  onChanged: (value) => {phoneNumberUpd = value},
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Email ID',
                      border: OutlineInputBorder()
                  ),
                  onChanged: (value) => {emailUpd = value},
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'LinkedIn',
                      border: OutlineInputBorder()
                  ),
                  onChanged: (value) => {linkedInUpd = value},
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'GitHub',
                      border: OutlineInputBorder()
                  ),
                  onChanged: (value) => {gitHubUpd = value},
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Address',
                      border: OutlineInputBorder()
                  ),
                  onChanged: (value) => {addressUpd = value},
                ),
                ],
              ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.deepOrange,
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>ExperienceForm())
            );
          },
            label: Text('Next: Experience Form'),
          icon: Icon(Icons.badge)
        ),
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