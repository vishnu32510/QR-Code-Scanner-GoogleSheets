//ios platform
import 'package:flutter/cupertino.dart';
//main library
import 'package:flutter/material.dart';

class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('  About'),
        // centerTitle: true,
        // backgroundColor: Colors.red,
        // elevation: 50.0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/111.png',alignment: Alignment.center,),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  // color: Color.fromRGBO(161, 18, 62, 35.0)
                  color: Colors.grey[350],
                ),
                child: Text(
                  'Smart Shop Surveillance System',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(161, 18, 62, 40.0)
                    // color: Colors.brown,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,0.0,30.0,20.0),
                child: Text(
                  'An application that collects details of the customer for the'
                      ' ease of contact tracing.',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Text(
                'EPA02',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(
                height: 2.0,
                color: Colors.black,
                thickness: 2.0,
                indent: 50.0,
                endIndent: 50.0,
              ),SizedBox(
                height: 10.0,
              ),
              Text(
                'Guide : Dr.E Prabhu\n',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Barathi Kanna S - CB.EN.U4ECE17007\n\n'
                    'Gokul S - CB.EN.U4ECE17015\n\nKukan S - CB.EN.U4ECE17033\n'
                    '\nVishnu Priyan S S - CB.EN.U4ECE17063',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Divider(
                height: 2.0,
                color: Colors.black,
                thickness: 2.0,
                indent: 50.0,
                endIndent: 50.0,
              ),
              SizedBox(
                height: 35.0,
              ),
              CircleAvatar(
                // radius: 100.0,
                maxRadius: 30.0,
                backgroundImage: AssetImage('assets/5.png'),
                backgroundColor: Colors.white,
              ),
              Text(
                'QR Code Scanner',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

