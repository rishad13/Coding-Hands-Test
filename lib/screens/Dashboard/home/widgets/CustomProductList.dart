import 'package:cached_network_image/cached_network_image.dart';
import 'package:coding_hands/helpers/Helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/const.dart';

class CustomProductList extends StatelessWidget {
  const CustomProductList(
      {super.key,
      required this.image,
      required this.off,
      required this.productName,
      required this.rating,
      required this.price});
  final String rating;
  final String image;
  final String productName;
  final String off;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        h20SizedBox,
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            color: Helpers.getColorFromHex("#FFFFFF"),
            border:
                Border.all(color: Helpers.getColorFromHex('#E0E0E0'), width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 96,
                    child: CachedNetworkImage(
                      fadeInCurve: Curves.decelerate,
                      fadeInDuration: const Duration(milliseconds: 300),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      imageUrl: image,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Shimmer.fromColors(
                        baseColor: shimmerBaseColor,
                        highlightColor: shimmerHighlightColor,
                        child: Container(
                          width: double.infinity,
                          height: 96,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      left: 10,
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 15,
                            color: Helpers.getColorFromHex('#EB5757'),
                          ),
                          w5SizedBox,
                          Text(
                            rating,
                            style: GoogleFonts.manrope(
                                color: Helpers.getColorFromHex('#FFFFFF'),
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      )),
                ],
              ),
              h5SizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  w10SizedBox,
                  Text(
                    productName,
                    style: GoogleFonts.manrope(
                        color: Helpers.getColorFromHex('#000000'),
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ],
              ),
              h5SizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  w10SizedBox,
                  Text(
                    '\$ ${price.toString()} • ${off}% Off',
                    style: GoogleFonts.manrope(
                        color: Helpers.getColorFromHex('#828282'),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
