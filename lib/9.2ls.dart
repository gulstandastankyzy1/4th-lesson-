import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Page()));
}

class Page extends StatefulWidget {
  @override
  State<Page> createState() => _Page();
}

class _Page extends State<Page> {
  int rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vanilla Demo', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    rating = 1;
                  });
                },
                icon: (rating >= 1
                    ? Icon(Icons.star, size: 70)
                    : Icon(Icons.star_border, size: 70)),
                color: Colors.indigo[500],
              ),
            ),

            Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    rating = 2;
                  });
                },
                icon: (rating >= 2
                    ? Icon(Icons.star, size: 70)
                    : Icon(Icons.star_border, size: 70)),
                color: Colors.indigo[500],
              ),
            ),

            Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    rating = 3;
                  });
                },
                icon: (rating >= 3
                    ? Icon(Icons.star, size: 70)
                    : Icon(Icons.star_border, size: 70)),
                color: Colors.indigo[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
