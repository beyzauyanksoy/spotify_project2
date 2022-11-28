import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final String imageUrl;
  final String name;

  const CategoryItemWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            width: MediaQuery.of(context).size.width / 2,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 4,
            right: 0,
            left: 0,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
