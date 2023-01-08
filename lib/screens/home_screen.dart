import 'package:flutter/material.dart';
import 'package:flutter_application_2/functions/get_news_data.dart';
import 'package:flutter_application_2/utils/custom_text.dart';
import 'package:flutter_application_2/widgets/news_card.dart';
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
    return Scaffold(
      backgroundColor: Color(0xff464646),
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: CustomText(
            text: "HEADLINES",
            size: 29,
            fontColor: Color(0xffffffff),
            weight: FontWeight.bold),
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
                    String dateAndTime = snapshot.data![index]['publishedAt'];
                    var date = dateAndTime.split("T");
                    return NewsCard(
                      backGroundImageUrl: snapshot.data![index]['urlToImage'],
                      title: snapshot.data![index]['title'],
                      publishedAt: date[0],
                      author: snapshot.data![index]['author'],
                      description: snapshot.data![index]['description'],
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
