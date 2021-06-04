
import 'package:flutter/material.dart';
import 'package:on_the_go_resume_app/ProjectForm.dart';
import 'package:on_the_go_resume_app/PersonalForm.dart';

class EducationDetails{
  String uniName, year, major, startDate, endDate, gpa, courseWork;
  EducationDetails({
    this.uniName = '',
    this.year = '',
    this.major = '',
    this.startDate = '',
    this.endDate = '',
    this.gpa = '',
    this.courseWork = ''
  });
}

class EducationForm extends StatefulWidget {
  @override
  _EducationFormState createState() => _EducationFormState();
}

class _EducationFormState extends State<EducationForm> {

  List<EducationDynamicWidget> educationDynamic = [];
  List<String> educationData = [];

  addEducationDynamic(){
    setState(() {});
    var eduInfo = new EducationDetails();
    educationDynamic.add(new EducationDynamicWidget(educationInfo: eduInfo));
  }

  @override
  Widget build(BuildContext context) {
    Widget result = new Flexible(
        flex: 1,
        child: new Card(
          child: ListView.builder(
            itemCount: educationData.length,
            itemBuilder: (_, index) {
              return new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(left: 10.0),
                      child: new Text("${index + 1} : ${educationData[index]}"),
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
        itemCount: educationDynamic.length,
        itemBuilder: (_, index) => educationDynamic[index],
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text('Education Form'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  pdfDict['Education Info'] = educationDynamic;
                  print(pdfDict);
                },
                child: Text("Save",
                  style: TextStyle(color: Colors.white),),
              ),
              TextButton(
                  onPressed: addEducationDynamic,
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
              educationData.length == 0 ? dynamicTextField : result
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.deepOrange,
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>ProjectForm())
              );
            },
            label: Text('Next: Project Form'),
            icon: Icon(Icons.architecture_rounded)
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

class EducationDynamicWidget extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  EducationDetails educationInfo;
  EducationDynamicWidget({required this.educationInfo});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: Form(
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                hintText: 'University Name',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {educationInfo.uniName = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Year(Ex: Junior)',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {educationInfo.year = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Major',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {educationInfo.major = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Start Date(MM/DD/YYY)',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {educationInfo.startDate = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'End Date(MM/DD/YYY)',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {educationInfo.endDate = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'GPA',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {educationInfo.gpa = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Courses',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {educationInfo.courseWork = value},
          ),
        ],
        ),
      ),
    );
  }
}