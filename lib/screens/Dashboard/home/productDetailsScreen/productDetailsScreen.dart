import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/const.dart';
import '../../../../helpers/Helpers.dart';
import 'model/productDetailsModel.dart';
import 'services/productDetailsServices.dart';
import 'widgets/shimmer.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ProductDetailsScreenServices homeServices({required bool uiRender}) =>
        Provider.of<ProductDetailsScreenServices>(
          context,
          listen: uiRender,
        );
    return Scaffold(
      body: FutureBuilder<ProductDetailsModal>(
        future: homeServices(uiRender: false).productDetailsApi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const ShimmerForProductDetailsScreen();
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 212,
                      child: CachedNetworkImage(
                        fadeInCurve: Curves.decelerate,
                        fadeInDuration: const Duration(milliseconds: 300),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        imageUrl: snapshot.data!.thumbnail,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Shimmer.fromColors(
                          baseColor: shimmerBaseColor,
                          highlightColor: shimmerHighlightColor,
                          child: Container(
                            width: double.infinity,
                            height: 212,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 25,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 24,
                                  color: Helpers.getColorFromHex('#FFFFFF'),
                                )),
                          ],
                        )),
                  ],
                ),
                h10SizedBox,
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.data!.title,
                        style: GoogleFonts.manrope(
                            color: Helpers.getColorFromHex('#000000'),
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 15,
                            color: Helpers.getColorFromHex('#EB5757'),
                          ),
                          w5SizedBox,
                          Text(
                            snapshot.data!.rating.toString(),
                            style: GoogleFonts.manrope(
                                color: Helpers.getColorFromHex('#000000'),
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                h5SizedBox,
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    '\$ ${snapshot.data!.price.toString()} • ${snapshot.data!.discountPercentage.toString()}% Off',
                    style: GoogleFonts.manrope(
                        color: Helpers.getColorFromHex('#828282'),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
                h5SizedBox,
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    snapshot.data!.description,
                    style: GoogleFonts.manrope(
                        color: Helpers.getColorFromHex('#000000'),
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
