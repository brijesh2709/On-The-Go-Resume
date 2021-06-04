import 'package:flutter/material.dart';
import 'package:on_the_go_resume_app/PersonalForm.dart';

import 'GenerateResume.dart';

class ProjectDetails{
  String projName, techStack, startDate, endDate, description;
  ProjectDetails({
    this.projName = '',
    this.techStack = '',
    this.startDate = '',
    this.endDate = '',
    this.description = ''
  });
}

class ProjectForm extends StatefulWidget {
  @override
  _ProjectFormState createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {

  List<ProjectDynamicWidget> projectDynamic = [];
  List<String> projectData = [];

  addProjectDynamic(){
    setState(() {});
    var projInfo = new ProjectDetails();
    projectDynamic.add(new ProjectDynamicWidget(projectInfo: projInfo));
  }

  @override
  Widget build(BuildContext context) {
    Widget result = new Flexible(
        flex: 1,
        child: new Card(
          child: ListView.builder(
            itemCount: projectData.length,
            itemBuilder: (_, index) {
              return new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(left: 10.0),
                      child: new Text("${index + 1} : ${projectData[index]}"),
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
        itemCount: projectDynamic.length,
        itemBuilder: (_, index) => projectDynamic[index],
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text('Project Form'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  pdfDict['Project Info'] = projectDynamic;
                  print(pdfDict);
                },
                child: Text("Save",
                  style: TextStyle(color: Colors.white),),
              ),
              TextButton(
                  onPressed: addProjectDynamic,
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
              projectData.length == 0 ? dynamicTextField : result
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.deepOrange,
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>GenerateResume())
              );
            },
            label: Text('Generate Resume'),
            icon: Icon(Icons.cloud_download_sharp)
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


class ProjectDynamicWidget extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  ProjectDetails projectInfo;
  ProjectDynamicWidget({required this.projectInfo});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: Form(
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Project Name',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {projectInfo.projName = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Technical Stack',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {projectInfo.techStack = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Start Date(MM/DD/YYY)',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {projectInfo.startDate = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'End Date(MM/DD/YYY)',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {projectInfo.endDate = value},
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Project Description',
                border: OutlineInputBorder()
            ),
            onChanged: (value) => {projectInfo.description = value},
          ),
        ],
        ),
      ),
    );
  }
}