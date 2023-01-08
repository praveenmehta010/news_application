import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/custom_text.dart';

class NewsCard extends StatelessWidget {
  final String backGroundImageUrl, title, author, publishedAt;
  const NewsCard({
    super.key,
    required this.backGroundImageUrl,
    required this.title,
    required this.author,
    required this.publishedAt,
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
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: Colors.blue
            image: DecorationImage(
                image: NetworkImage(backGroundImageUrl), fit: BoxFit.cover)),
        width: w,
        height: h,
        child: Column(
          children: [
            CustomText(text: title, size: 20, fontColor: Color(0xfff2f2f2), weight: FontWeight.normal),
            
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                CustomText(text: author, size: 12, fontColor: Color(0xfff2f2f2), weight: FontWeight.normal),
                SizedBox(width: 20,),
                CustomText(text: publishedAt, size: 12, fontColor: Color(0xfff2f2f2), weight: FontWeight.normal)
              ],
            )
          ],
        ),
      ),
    );
  }
}
