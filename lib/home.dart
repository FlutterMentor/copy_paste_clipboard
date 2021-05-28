import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final walletAddress = '3J98t1WpEZ73CNmQviecrnyiWrnqRhWNLy';

  TextEditingController copyController = TextEditingController();
  TextEditingController pasteController = TextEditingController();

  @override
  void dispose() {
    copyController.dispose();
    pasteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Copy & Paste To/From Clipboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Your Wallet Address:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.0),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text(walletAddress),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepOrange, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20.0),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: walletAddress));
                  },
                  icon: Icon(
                    Icons.content_copy,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Copy This Input'),
                  controller: copyController,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: copyController.text));
                },
                label: Text('Copy'),
                icon: Icon(Icons.content_copy),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  final clipPaste =
                      await Clipboard.getData(Clipboard.kTextPlain);

                  setState(() {
                    pasteController.text = clipPaste.text;
                  });
                },
                label: Text('Paste'),
                icon: Icon(Icons.paste),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Paste Here'),
                  controller: pasteController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
