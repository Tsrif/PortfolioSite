import 'dart:convert';
import 'dart:html' as html;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Utility/Globaltheme.dart';
import 'package:portfolio_site/Utility/size_config.dart';
import 'package:http/http.dart' as http;

// Create a Form widget.
class ContactForm extends StatefulWidget {
  @override
  ContactFormState createState() {
    return ContactFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class ContactFormState extends State<ContactForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    InputDecoration inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: GlobalTheme.primaryColor, width: 5),
      ),
    );
    TextStyle textStyle = TextStyle(
        color: Colors.white, fontSize: SizeConfig.safeBlockHorizontal * 2);

    TextStyle bodyStyle = TextStyle(
        color: Colors.black, //GlobalTheme.secondaryColor,
        fontSize: SizeConfig.safeBlockHorizontal * 1.5);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AutoSizeText('Name', style: textStyle),
          SizedBox(height: 5),
          TextFormField(
            controller: nameController,
            style: bodyStyle,
            decoration: inputDecoration,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          AutoSizeText('Email', style: textStyle),
          SizedBox(height: 5),
          TextFormField(
            controller: emailController,
            style: bodyStyle,
            decoration: inputDecoration,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          AutoSizeText('Message', style: textStyle),
          SizedBox(height: 5),
          TextFormField(
            controller: messageController,
            style: bodyStyle,
            maxLines: 7,
            decoration: inputDecoration,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: GlobalTheme.primaryColor),
              onPressed: () async {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar.
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Thanks for reaching out! I will get back to you when I can!")));

                  FirebaseFirestore.instance
                      .runTransaction((Transaction transaction) async {
                    FirebaseFirestore.instance.collection('message').add({
                      'name': nameController.text,
                      'email': emailController.text,
                      'message': messageController.text,
                    });
                  });
                }
              },
              child: Text('Submit', style: textStyle),
            ),
          ),
        ],
      ),
    );
  }
}
