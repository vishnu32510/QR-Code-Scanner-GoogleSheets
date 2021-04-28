import 'package:flutter/cupertino.dart'; //icon ios
import 'package:flutter/material.dart'; //material design
import 'package:flutter/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;   //scanner
import 'about.dart';
// import 'noti.dart'; //for about dart file
import 'package:intl/intl.dart';
/////////////////////////////////
import 'controller/form_controller.dart';
import 'model/form.dart';
/////////////
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


/////////////////
void main() {runApp(MaterialApp(
  home: MyApp(),
  debugShowCheckedModeBanner: false,
),);
}

String result = "";
var arr;
String nam="";
String num="";
String ad="";
String cus="";
String tim='';
String dat='';
String tim1='';
String dat1='';
var len=0;


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'QR Scanner'),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ///////////////////////////


  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(
          nam,
          num,
          ad,
          cus,
          dat,
          tim,
          dat1,
          tim1);

      FormController formController = FormController();

      _showSnackbar("Adding Customer Data");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Customer Data Added");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Customer Data NOtT Added");
        }
      });
    }
  }

  ////////////////
  Future _scanQR() async {
    try {
      var now = new DateTime.now();
      String cameraScanResult = await scanner.scan();
      setState(() {
        result = cameraScanResult;
        arr=result.split("-");
        if(arr.length==6) {
          nam = arr[0];
          num = arr[1];
          ad = arr[2];
          cus = arr[3];
          tim = arr[5];
          dat = arr[4]; // setting string result with cameraScanResult
          tim1 = new DateFormat("hh:mm:ss").format(now);
          dat1 = new DateFormat("dd/MM/yyyy").format(now);

          _submitForm();
        }
        else{
          _showSnackbar("Scan a valid QR code");
        }
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        // centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => info()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
                key: _formKey,
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  ],
                )
            ),
            // Text(nam+num+ad+cus+tim),
            RaisedButton.icon(
              icon: Icon(Icons.scanner),
              label: Text('Scan'),
              color: Colors.blue,
              onPressed: () {
                _scanQR();
                // _submitForm();
              },
            ),
            // Text(tim+'-'+tim1+'--'+dat+'-'+dat1),
          ],
        ),
      ),
    );
  }
}