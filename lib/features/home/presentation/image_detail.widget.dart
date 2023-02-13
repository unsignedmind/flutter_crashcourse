import 'package:flutter/material.dart';

class ImageDetail extends StatefulWidget {
  final String imageUrl;

  const ImageDetail({super.key, required this.imageUrl});

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              style: const ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: () {
                Navigator.of(context).pop(this);
              },
              child: const Row(              
                children: [
                  Icon(
                    Icons.navigate_before,
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Back'),
                ],
              ),
            ),
            Image.network(widget.imageUrl)
          ],
        ),
      ),
    );
  }
}
