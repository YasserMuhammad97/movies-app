import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';

class DescriptionScreen extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, launch_on;

  const DescriptionScreen(
      {Key key,
      this.name,
      this.description,
      this.bannerUrl,
      this.posterUrl,
      this.vote,
      this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: ModifiedText(
                    text: ' ⭐ Average Rating - ' + vote,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ModifiedText(
              text: name != null ? name : 'not loaded',
              size: 24,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: ModifiedText(text: 'Releasing On -' + launch_on, size: 14),
          ),
          Row(children: [
            Container(
              margin:EdgeInsets.all(5),
              height: 200,
              width: 100,
              child: Image.network(posterUrl),
            ),
            Flexible(child: Container(child: ModifiedText(text:description, size:18),))
          ])
        ],
      )),
    );
  }
}
