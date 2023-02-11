import 'package:cc_threehours/features/home/presentation/image_detail.dart';
import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<ImageGridItem> gridItems = [];

    for (int i = 0; i < 10; i++) {
      gridItems.add(
        ImageGridItem(imageNumber: i),
      );
    }

    return GridView.count(
      crossAxisCount: 2,
      children: gridItems,
    );
  }
}

class ImageGridItem extends StatelessWidget {
  final int imageNumber;

  const ImageGridItem({super.key, required this.imageNumber});

  @override
  Widget build(BuildContext context) {
    var imageUrl = 'https://picsum.photos/400?image=$imageNumber';
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 5, color: Colors.white)),
      child: GestureDetector(
        child: Image.network(imageUrl),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ImageDetail(
                      imageUrl: imageUrl,
                    ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
