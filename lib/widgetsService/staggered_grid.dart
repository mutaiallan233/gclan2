import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore firestore = FirebaseFirestore.instance;

class InstagramSearchGrid extends StatelessWidget {
  const InstagramSearchGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<DocumentSnapshot>(
        stream: firestore
            .collection('services')
            .doc('Gadgets Pro')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            DocumentSnapshot doc = snapshot.data;

            return StaggeredGridView.countBuilder(
              crossAxisCount: 3,
              itemCount: imageList.length,
              itemBuilder: (context, index) => ImageCard(
                imageData: imageList[index],
              ),
              staggeredTileBuilder: (index) => StaggeredTile.count(
                  (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            );
          } else {
            return SizedBox();
          }
        });
    /*return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: imageList.length,
      itemBuilder: (context, index) => ImageCard(
        imageData: imageList[index],
      ),
      staggeredTileBuilder: (index) => StaggeredTile.count(
          (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );*/
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
    );
  }
}

class ImageData {
  final String id;
  final String imageUrl;

  const ImageData({
    this.id,
    this.imageUrl,
  });
}

const imageList = [
  ImageData(
    id: 'id-001',
    imageUrl: 'https://picsum.photos/seed/image001/500/500',
  ),
  ImageData(
    id: 'id-002',
    imageUrl: 'https://picsum.photos/seed/image002/500/800',
  ),
  ImageData(
    id: 'id-003',
    imageUrl: 'https://picsum.photos/seed/image003/500/300',
  ),
  ImageData(
    id: 'id-004',
    imageUrl: 'https://picsum.photos/seed/image004/500/900',
  ),
  ImageData(
    id: 'id-005',
    imageUrl: 'https://picsum.photos/seed/image005/500/600',
  ),
  ImageData(
    id: 'id-006',
    imageUrl: 'https://picsum.photos/seed/image006/500/500',
  ),
  ImageData(
    id: 'id-007',
    imageUrl: 'https://picsum.photos/seed/image007/500/400',
  ),
  ImageData(
    id: 'id-008',
    imageUrl: 'https://picsum.photos/seed/image008/500/700',
  ),
  ImageData(
    id: 'id-009',
    imageUrl: 'https://picsum.photos/seed/image009/500/600',
  ),
  ImageData(
    id: 'id-010',
    imageUrl: 'https://picsum.photos/seed/image010/500/900',
  ),
  ImageData(
    id: 'id-011',
    imageUrl: 'https://picsum.photos/seed/image011/500/900',
  ),
  ImageData(
    id: 'id-012',
    imageUrl: 'https://picsum.photos/seed/image012/500/700',
  ),
  ImageData(
    id: 'id-013',
    imageUrl: 'https://picsum.photos/seed/image013/500/700',
  ),
  ImageData(
    id: 'id-014',
    imageUrl: 'https://picsum.photos/seed/image014/500/800',
  ),
  ImageData(
    id: 'id-015',
    imageUrl: 'https://picsum.photos/seed/image015/500/500',
  ),
  ImageData(
    id: 'id-016',
    imageUrl: 'https://picsum.photos/seed/image016/500/700',
  ),
  ImageData(
    id: 'id-017',
    imageUrl: 'https://picsum.photos/seed/image017/500/600',
  ),
  ImageData(
    id: 'id-018',
    imageUrl: 'https://picsum.photos/seed/image018/500/900',
  ),
  ImageData(
    id: 'id-019',
    imageUrl: 'https://picsum.photos/seed/image019/500/800',
  ),
];