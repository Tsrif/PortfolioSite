import 'package:flutter/material.dart';

class ScrollView extends StatelessWidget {
  final dataKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      primary: true,
      appBar: new AppBar(
        title: const Text('Home'),
      ),
      body: new SingleChildScrollView(
          child: Row(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                  height: 160.0, width: double.infinity, child: new Card()),
              SizedBox(
                  height: 160.0, width: double.infinity, child: new Card()),
              SizedBox(
                  height: 160.0, width: double.infinity, child: new Card()),
              // destination
              Card(
                key: dataKey,
                child: Text("data\n\n\n\n\n\ndata"),
              )
            ],
          ),
        ],
      )),
      bottomNavigationBar: RaisedButton(
        onPressed: () => Scrollable.ensureVisible(dataKey.currentContext),
        child: Text("Scroll to data"),
      ),
    );
  }
}
