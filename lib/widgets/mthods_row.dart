import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MethodsRow extends StatelessWidget {
  const MethodsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.white,
                shape: CircleBorder(),
                elevation: 2.0,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.blue[800],
                  ),
                ),
              ),
            ),
            Flexible(
              child: RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.white,
                shape: CircleBorder(),
                elevation: 2.0,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Image.asset(
                    'assets/imgs/google.png',
                    height: 30,
                    // color: Colors.blue[800],
                  ),
                ),
              ),
            ),
            Flexible(
              child: RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.white,
                shape: CircleBorder(),
                elevation: 2.0,
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image.asset(
                      'assets/imgs/insta.webp',
                      height: 30,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
