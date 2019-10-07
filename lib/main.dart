import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preference',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller_key=TextEditingController();
  final _controller_data=TextEditingController();
   String text_to_show="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferenced"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller_key,
              decoration: InputDecoration(hintText: 'Enter key'),
            ),
            TextField(
              controller: _controller_data,
              decoration: InputDecoration(hintText: 'Enter value'),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      onPressed: ()=>saveData(_controller_key.text,_controller_data.text),
                    child: Text('Save Data..!',style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: ()=>readData(_controller_key.text),
                    child: Text('Read Data..!',style: TextStyle(color: Colors.white),),
                    color: Colors.green,

                  ),
                ),

              ],
            ),
            Text('$text_to_show',style: TextStyle(fontSize: 32.0),),
          ],
        ),
      ),
    );
  }

  saveData(String key,String value) async{
    final prefers=await SharedPreferences.getInstance();
    prefers.setString(key, value);
    Fluttertoast.showToast(
        msg: 'Saved Data in phone',
        toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.yellow,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  readData(String text) async {
    final prefers=await SharedPreferences.getInstance();
    setState(() {
      text_to_show=prefers.getString(text);
    });
  }
}
