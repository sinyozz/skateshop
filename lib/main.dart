import 'package:flutter/material.dart';
import 'package:skateshop/SkateShop.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skate Shop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SkatePage(),
    );
  }
}

class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.lightBlue;

    final Rect rect = Rect.fromLTWH(0, 0, size.width * 0.25, size.height);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DieCuttingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 20;
    paint.style = PaintingStyle.fill;

    var x = size.height / 6;

    var path = Path();
    path.moveTo(0, -2 * x);

    for (var i = 0; i < 5; i++) {
      path.relativeLineTo(x, x);
      path.relativeLineTo(-x, x);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class SkatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
        painter: BluePainter(),
        child: SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                appBar(context),
                content(context),
                button(),
              ],
            )),
      ),
    );
  }
}

Widget appBar(BuildContext context) {
  return Row(
    children: <Widget>[
      MaterialButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SkateShop()));
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.orange,
          size: 32.0,
        ),
      ),
      SizedBox(
        width: 48.0,
      ),
      Flexible(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Text(
              "Attack on Titan",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    letterSpacing: 14,
                  ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget content(context) {
  return Expanded(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 32.0,
          top: 32,
          bottom: 32,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                child: Container(
                  width: 140,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                        'assets/board13.jpeg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 32,
                  top: 48,
                  bottom: 48,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 32.0,
                      ),
                      child: Text(
                        "Handmade skateboard Design from Japan",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 20.0,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Divider(),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "SIZE",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 10,
                            color: Colors.blueGrey,
                          ),
                    ),
                    Text(
                      "8\' x 32\'",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 22.0,
                          ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "Logo Corp",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                    ),
                    Text(
                      "Canadian Maple",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 10.0,
                          ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    Container(
                      width: double.infinity,
                      height: 48,
                      color: Colors.orange,
                      alignment: Alignment.centerLeft,
                      child: CustomPaint(
                        painter: DieCuttingPainter(),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                          ),
                          child: Text(
                            "\$240",
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 10,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget button() {
  return Container(
    width: double.infinity,
    height: 120,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        topLeft: Radius.circular(50),
      ),
    ),
    child: FlatButton(
      onPressed: () {
        print("hell yeah the function is working :P");
      },
      child: Text(
        "ADD TO THE CART",
        style: TextStyle(
            color: Colors.blueAccent, fontSize: 20.0, letterSpacing: 10.0),
      ),
    ),
  );
}
