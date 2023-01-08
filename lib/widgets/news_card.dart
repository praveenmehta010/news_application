import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/detail_screen.dart';
import 'package:flutter_application_2/utils/custom_text.dart';

class NewsCard extends StatelessWidget {
  final String backGroundImageUrl, title, author, publishedAt, description;
  const NewsCard({
    super.key,
    required this.backGroundImageUrl,
    required this.title,
    required this.author,
    required this.publishedAt,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height * 0.3;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 24),
      shadowColor: Colors.black,
      elevation: 10,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailNewsScreen(
                    author: author,
                    backGroundImageUrl: backGroundImageUrl,
                    description: description,
                    publishedAt: publishedAt,
                    title: title),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(backGroundImageUrl), fit: BoxFit.cover)),
          width: w,
          height: h,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black12,
                Colors.black87.withOpacity(0.7),
                Colors.black87.withOpacity(1)
              ],
            )),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 12, top: 12),
              child: Column(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    child: Column(
                      children: [
                        CustomText(
                            text: title,
                            size: 20,
                            fontColor: Color(0xfff2f2f2),
                            weight: FontWeight.normal),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            CustomText(
                                text: author,
                                size: 12,
                                fontColor: Color(0xfffbababa),
                                weight: FontWeight.bold),
                            SizedBox(
                              width: 20,
                            ),
                            CustomText(
                              text: publishedAt,
                              size: 12,
                              fontColor: Color(0xfffbababa),
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
