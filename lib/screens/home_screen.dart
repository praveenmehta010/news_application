import 'package:flutter/material.dart';
import 'package:flutter_application_2/functions/get_news_data.dart';
import 'package:google_fonts/google_fonts.dart';

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
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: Text(
          "HEADLINES",
          style: GoogleFonts.roboto(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              letterSpacing: 3.5),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: FutureBuilder<List>(
            future: getNewsData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      shadowColor: Colors.black,
                      elevation: 10,
                      color: Colors.blue,
                      child: Container(
                        width: w,
                        height: 400,
                      ),
                    );
                  },
                );
              } else {
                print(snapshot.error);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
