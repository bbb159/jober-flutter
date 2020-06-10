import 'package:flutter/material.dart';
import 'package:jober/utils/constants.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String description;

  JobCard({Key key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: Colors.white,
        elevation: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                color: Colors.grey,
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                description,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  Icon(Icons.share, color: kPurpleDefaultColor), // icon-1
                  Icon(Icons.book, color: Colors.grey), // icon-2
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton.icon(
                      color: kPurpleDefaultColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {},
                      icon: Icon(
                        Icons.compare_arrows,
                        color: Colors.white,
                      ),
                      label: Text("Troca de serviço")),
                  FlatButton(
                    child: const Text('CANDIDATAR',
                        style: TextStyle(
                            color: kPurpleDefaultColor,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
