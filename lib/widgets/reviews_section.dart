import 'package:flutter/material.dart';
import 'package:restaurant/widgets/smooth_star_rating.dart';
import '../util/comments.dart'; // Assuming this is a list of comments

class ReviewsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Reviews",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          itemCount: comments.length,
          itemBuilder: (BuildContext context, int index) {
            Map comment = comments[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage("${comment['img']}"),
              ),
              title: Text("${comment['name']}"),
              subtitle: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SmoothStarRating(
                        starCount: 5,
                        color: Colors.orange,
                        allowHalfRating: true,
                        rating: 5.0,
                        size: 12.0,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        "February 14, 2020",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0),
                  Text("${comment["comment"]}"),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
