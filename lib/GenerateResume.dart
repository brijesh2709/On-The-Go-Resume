import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:on_the_go_resume_app/pdf_preview_screen.dart';
import 'package:on_the_go_resume_app/PersonalForm.dart';

class GenerateResume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatelessWidget {
  final pdf = pw.Document();
  String personalString(){
    String personalRet = '';
    personalRet += pdfDict['User Details'].name;
    personalRet += '\n';
    personalRet += pdfDict['User Details'].address;
    personalRet += '\n';
    personalRet += pdfDict['User Details'].email;
    personalRet += '|';
    personalRet += pdfDict['User Details'].phoneNumber;
    personalRet += '\n';
    personalRet += pdfDict['User Details'].linkedIn;
    personalRet += '|';
    personalRet += pdfDict['User Details'].gitHub;
    return personalRet;
  }

  String experienceString(){
    String experienceRet = '';
    for (var i in pdfDict['Experience Info']){
      experienceRet += i.experienceInfo.jobTitle;
      experienceRet += '\n';
      experienceRet += i.experienceInfo.company;
      experienceRet += '\n';
      experienceRet += i.experienceInfo.startDate;
      experienceRet += '-';
      experienceRet += i.experienceInfo.endDate;
      experienceRet += '\n';
      experienceRet += i.experienceInfo.location;
      experienceRet += '\n';
      experienceRet += i.experienceInfo.description;
      experienceRet += '\n';
      experienceRet += '\n';
    }
    print(experienceRet);
    return experienceRet;
  }

  String educationString(){
    String educationRet = '';
    for (var i in pdfDict['Education Info']){
      educationRet += i.educationInfo.uniName;
      educationRet += '\n';
      educationRet += i.educationInfo.year;
      educationRet += '\n';
      educationRet += i.educationInfo.major;
      educationRet += '\n';
      educationRet += i.educationInfo.startDate;
      educationRet += '-';
      educationRet += i.educationInfo.endDate;
      educationRet += '\n';
      educationRet += i.educationInfo.gpa;
      educationRet += '\n';
      educationRet += i.educationInfo.courseWork;
      educationRet += '\n';
      educationRet += '\n';
    }
    print(educationRet);
    return educationRet;
  }

  String projectString(){
    String projectRet = '';
    for (var i in pdfDict['Project Info']){
      projectRet += i.projectInfo.projName;
      projectRet += '\n';
      projectRet += i.projectInfo.techStack;
      projectRet += '\n';
      projectRet += i.projectInfo.startDate;
      projectRet += '-';
      projectRet += i.projectInfo.endDate;
      projectRet += '\n';
      projectRet += i.projectInfo.description;
      projectRet += '\n';
      projectRet += '\n';
    }
    print(projectRet);
    return projectRet;
  }

  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(
              level: 0,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: <pw.Widget>[
                    pw.Text(personalString(), textScaleFactor: 2),
                  ])),
          pw.Header(level: 1, text: 'Experience'),

          pw.Paragraph(
              text: experienceString()
          ),
          pw.Header(level: 1, text: 'Education'),
          pw.Paragraph(
              text: educationString()
          ),
          pw.Header(level: 1, text: 'Academic Project'),
          pw.Paragraph(
              text: projectString()
          ),
        ];
      },
    ));
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/resume.pdf");
    file.writeAsBytesSync(pdf.save());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate Resume"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.deepOrange,
                child: Text(
                  'Preview Resume',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () async {
                  writeOnPdf();
                  await savePdf();

                  Directory documentDirectory =
                  await getApplicationDocumentsDirectory();

                  String documentPath = documentDirectory.path;

                  String fullPath = "$documentPath/resume.pdf";
                  print(fullPath);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PdfPreviewScreen(
                            path: fullPath,
                          )));
                },
              ),
            ),
          ],
        ),
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

    );
  }
}