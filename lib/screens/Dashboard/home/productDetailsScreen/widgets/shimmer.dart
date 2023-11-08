import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/const.dart';

class ShimmerForProductDetailsScreen extends StatelessWidget {
  const ShimmerForProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: shimmerBaseColor,
          highlightColor: shimmerHighlightColor,
          child: Container(
            width: double.infinity,
            height: 212,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
          ),
        ),
        h20SizedBox,
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Shimmer.fromColors(
            baseColor: shimmerBaseColor,
            highlightColor: shimmerHighlightColor,
            child: Container(
              width: double.infinity,
              height: 212,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
