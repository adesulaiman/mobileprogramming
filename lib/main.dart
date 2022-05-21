import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Belajar Form Flutter",
    home: BelajarForm(),
  ));
}

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey =
      GlobalKey<FormState>(); //validasi key form untuk tidak di inject

  double nilaiSlider = 1;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Form Flutter"),
      ),
      body: Form(
        key: _formKey, //validasi key form untuk tidak di inject
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              // TextField(),
              TextFormField(
                keyboardType: TextInputType.phone, // for type input option
                obscureText: false, // for password textfield
                decoration: new InputDecoration(
                  hintText: "contoh: Susilo Bambang",
                  labelText: "Nama Lengkap",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  // for validator text field
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              CheckboxListTile( //checkbox
                title: Text('Belajar Dasar Flutter'),
                subtitle: Text('Dart, widget, http'),
                value: nilaiCheckBox,
                activeColor: Colors.deepPurpleAccent,
                onChanged: (value) {
                  setState(() {
                    nilaiCheckBox = value!;
                  });
                },
              ),
              SwitchListTile( // switch
                title: Text('Backend Programming'),
                subtitle: Text('Dart, Nodejs, PHP, Java, dll'),
                value: nilaiSwitch,
                activeTrackColor: Colors.pink[100],
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    nilaiSwitch = value;
                  });
                },
              ),
              Slider( //slider
                value: nilaiSlider,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    nilaiSlider = value;
                  });
                },
              ),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("nilai check box : " + nilaiCheckBox.toString());
                    print("nilai switch : " + nilaiSwitch.toString());
                    print("nilai slider : " + nilaiSlider.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
