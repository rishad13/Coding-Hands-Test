import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/const.dart';
import '../../../../helpers/Helpers.dart';

class ShimmerHome extends StatelessWidget {
  const ShimmerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => Column(
        children: [
          h20SizedBox,
          Shimmer.fromColors(
            baseColor: shimmerBaseColor,
            highlightColor: shimmerHighlightColor,
            child: Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                    color: Helpers.getColorFromHex('#E0E0E0'), width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
