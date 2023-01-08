import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/custom_text.dart';

class DetailNewsScreen extends StatelessWidget {
  final String backGroundImageUrl, title, author, publishedAt, description;
  const DetailNewsScreen(
      {super.key,
      required this.backGroundImageUrl,
      required this.title,
      required this.author,
      required this.publishedAt,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(backGroundImageUrl), fit: BoxFit.cover)),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // width: 200,
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
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(42)),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                          tooltip: 'back',
                          splashColor: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                CustomText( 
                  text: title,
                  size: 29,
                  fontColor: Color(0xfff2f2f2),
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 64,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: author,
                        size: 20,
                        fontColor: Color(0xfff2f2f2),
                        weight: FontWeight.normal),
                    CustomText(
                        text: publishedAt,
                        size: 20,
                        fontColor: Color(0xfff2f2f2),
                        weight: FontWeight.normal)
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustomText(
                    text: description,
                    size: 14,
                    fontColor: Color(0xffbababa),
                    weight: FontWeight.normal)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
