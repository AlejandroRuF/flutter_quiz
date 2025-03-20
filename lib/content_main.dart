import 'package:flutter/material.dart';

class ContentMain extends StatefulWidget {
  final VoidCallback switchScreen;
  const ContentMain({super.key, required this.switchScreen});

  @override
  State<StatefulWidget> createState() {
    return _ContentMainState();
  }
}

class _ContentMainState extends State<ContentMain> {
  double imgSize = 0.0;

  void imageSizeSelector() {
    setState(() {
      imgSize = 250;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: imgSize,
            color: const Color.fromARGB(150, 247, 247, 247),
          ),
          SizedBox(height: 20),
          Text(
            'Learn Flutter the fun way!',
            style: (TextStyle(fontSize: 28, color: Colors.white)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: imageSizeSelector,
                child: Text('Enseña la imagen'),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: widget.switchScreen,
                label: Text("Empieza el test"),
                icon: Icon(Icons.arrow_right_alt),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
