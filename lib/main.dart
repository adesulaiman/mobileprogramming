import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cuaca/models/cuaca_model.dart';
import 'package:cuaca/provider/cuaca_providers.dart';

void main() {
  runApp(new MaterialApp(home: new HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}