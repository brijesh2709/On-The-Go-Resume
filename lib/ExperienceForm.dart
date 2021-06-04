
import 'package:flutter/material.dart';
import 'package:on_the_go_resume_app/EducationForm.dart';
import 'package:on_the_go_resume_app/PersonalForm.dart';

class ExperienceDetails{
  String company, jobTitle, startDate, endDate, location, description;
  ExperienceDetails({
    this.company = '',
    this.jobTitle = '',
    this.startDate = '',
    this.endDate = '',
    this.location = '',
    this.description = ''
});
}

class ExperienceForm extends StatefulWidget {
  @override
  _ExperienceFormState createState() => _ExperienceFormState();
}

class _ExperienceFormState extends State<ExperienceForm> {
  List<ExperienceDynamicWidget> experienceDynamic = [];
  List<String> experienceData = [];

  addExperienceDynamic() {
    setState(() {});
    var expInfo = new ExperienceDetails();
    experienceDynamic.add(new ExperienceDynamicWidget(experienceInfo: expInfo));
  }

  @override
  Widget build(BuildContext context) {
    Widget result = new Flexible(
        flex: 1,
        child: new Card(
          child: ListView.builder(
            itemCount: experienceData.length,
            itemBuilder: (_, index) {
              return new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(left: 10.0),
                      child: new Text("${index + 1} : ${experienceData[index]}"),
                    ),
                    new Divider()
                  ],
                ),
              );
            },
          ),
        ));

    Widget dynamicTextField = new Flexible(
      flex: 2,
      child: new ListView.builder(
        itemCount: experienceDynamic.length,
        itemBuilder: (_, index) => experienceDynamic[index],
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text('Experience Form'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  pdfDict['Experience Info'] = experienceDynamic;
                  print(pdfDict);
                },
                child: Text("Save",
                  style: TextStyle(color: Colors.white),),
              ),
              TextButton(
                  onPressed: addExperienceDynamic,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,)
              ),
            ],
            backgroundColor: Colors.deepOrange,
        ),
        body: new Container(
          margin: new EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              experienceData.length == 0 ? dynamicTextField : result
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.deepOrange,
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>EducationForm())
              );
            },
            label: Text('Next: Education Form'),
            icon: Icon(Icons.apartment_rounded)
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


class ExperienceDynamicWidget extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  ExperienceDetails experienceInfo;
  ExperienceDynamicWidget({required this.experienceInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: Form(
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Job Title',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {experienceInfo.jobTitle = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Company Name',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {experienceInfo.company = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Start Date(MM/DD/YYY)',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {experienceInfo.startDate = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'End Date(MM/DD/YYY)',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {experienceInfo.endDate = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Location(Ex: Irvine, CA)',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {experienceInfo.location = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Experience Description',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {experienceInfo.description = value},
          ),
        ],
        ),
      ),
    );
  }
}