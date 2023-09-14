import 'package:flutter/material.dart';


class FormFieldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Field"),
        ),
        body: RegistrationForm()
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your First Name';
                }
                return null;
              },
              onSaved: (value) {
                _firstName = value ?? '';
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Last Name';
                }
                return null;
              },
              onSaved: (value) {
                _lastName = value ?? '';
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Email';
                }
                // You can add email validation logic here.
                return null;
              },
              onSaved: (value) {
                _email = value ?? '';
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}