import 'package:flutter/material.dart';
import 'package:flutter_application_2/functions/get_news_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
