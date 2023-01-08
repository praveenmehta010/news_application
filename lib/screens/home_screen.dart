import 'package:flutter/material.dart';
import 'package:flutter_application_2/functions/get_news_data.dart';
import 'package:flutter_application_2/functions/internet_connection.dart';
import 'package:flutter_application_2/utils/custom_text.dart';
import 'package:flutter_application_2/widgets/news_card.dart';

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
    InternetConnection().getConnectivity();
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
                      backGroundImageUrl: snapshot.data![index]['urlToImage'] !=
                              null
                          ? snapshot.data![index]['urlToImage']
                          : "https://media.istockphoto.com/id/1193046540/vector/photo-coming-soon-image-icon-vector-illustration-isolated-on-white-background-no-website.jpg?s=612x612&w=0&k=20&c=4wx1UzigP0g9vJv9D_DmOxdAT_DtX5peZdoS4hi2Fqg=",
                      title: snapshot.data![index]['title'] != null
                          ? snapshot.data![index]['title']
                          : "Title Not Available",
                      publishedAt:
                          date[0] != null ? date[0] : "Date Not Available",
                      author: snapshot.data![index]['author'] != null
                          ? snapshot.data![index]['author']
                          : "Author Data Not Available",
                      description: snapshot.data![index]['description'] != null
                          ? snapshot.data![index]['description']
                          : "Artical Data Not Available",
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
