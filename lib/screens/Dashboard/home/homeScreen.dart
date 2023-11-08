import 'package:cached_network_image/cached_network_image.dart';
import 'package:coding_hands/helpers/Helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/const.dart';
import 'model/productListModel.dart';
import 'productDetailsScreen/productDetailsScreen.dart';
import 'services/HomeScreenServices.dart';
import 'widgets/CustomProductList.dart';
import 'widgets/selectionButton.dart';
import 'widgets/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String choice = '';

  @override
  Widget build(BuildContext context) {
    HomeScreenServices homeServices({required bool uiRender}) =>
        Provider.of<HomeScreenServices>(
          context,
          listen: uiRender,
        );
    return Scaffold(
      backgroundColor: Helpers.getColorFromHex("#FFFFFF"),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  color: Helpers.getColorFromHex('#000000'),
                  size: 24,
                ),
                Positioned(
                    left: 13,
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Helpers.getColorFromHex('#4E00AF'),
                      ),
                      width: 8,
                    ))
              ],
            )),
        title: Text(
          'Coding Hands',
          style: GoogleFonts.manrope(
            color: Helpers.getColorFromHex('#000000'),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 24,
                color: Helpers.getColorFromHex('#000000'),
              ))
        ],
        bottom: PreferredSize(
            preferredSize: const Size(0.0, 10.0),
            child: Divider(
              height: 1,
              color: Helpers.getColorFromHex('#E6E6E6'),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
            physics: scrollingPhysics,
            child: FutureBuilder<ProductListModal>(
                future: homeServices(uiRender: false).productListApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const ShimmerHome();
                  } else {
                    return Column(
                      children: [
                        h10SizedBox,
                        Container(
                          width: double.infinity,
                          height: 166,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)),
                          child: CachedNetworkImage(
                            fadeInCurve: Curves.decelerate,
                            fadeInDuration: const Duration(milliseconds: 300),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            imageUrl: snapshot.data!.products[0].thumbnail,
                            progressIndicatorBuilder:
                                (context, url, progress) => Shimmer.fromColors(
                              baseColor: shimmerBaseColor,
                              highlightColor: shimmerHighlightColor,
                              child: Container(
                                width: double.infinity,
                                height: 166,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        ),
                        h20SizedBox,
                        SizedBox(
                          height: 32,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SelectionButtonChipList(
                                choice: choice == 'All',
                                onPressed: ({required isSelected}) {
                                  setState(() {
                                    choice = (isSelected ? 'All' : null)!;
                                  });
                                },
                                text: 'All',
                              ),
                              SelectionButtonChipList(
                                choice: choice == 'iPhone',
                                onPressed: ({required isSelected}) {
                                  setState(() {
                                    choice = (isSelected ? 'iPhone' : null)!;
                                  });
                                },
                                text: 'iPhone',
                              ),
                              SelectionButtonChipList(
                                choice: choice == 'Samsung',
                                onPressed: ({required isSelected}) {
                                  setState(() {
                                    choice = (isSelected ? 'Samsung' : null)!;
                                  });
                                },
                                text: 'Samsung',
                              ),
                              SelectionButtonChipList(
                                choice: choice == 'Oppo',
                                onPressed: ({required isSelected}) {
                                  setState(() {
                                    choice = (isSelected ? 'Oppo' : null)!;
                                  });
                                },
                                text: 'Oppo',
                              ),
                              SelectionButtonChipList(
                                choice: choice == 'Nokia',
                                onPressed: ({required isSelected}) {
                                  setState(() {
                                    choice = (isSelected ? 'Nokia' : null)!;
                                  });
                                },
                                text: 'Nokia',
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () => Helpers.navigateTo(
                                      context, const ProductDetailsScreen()),
                                  child: CustomProductList(
                                    rating: snapshot
                                        .data!.products[index].rating
                                        .toString(),
                                    image: snapshot
                                        .data!.products[index].thumbnail,
                                    off: snapshot.data!.products[index]
                                        .discountPercentage
                                        .toString(),
                                    price: snapshot.data!.products[index].price
                                        .toString(),
                                    productName:
                                        snapshot.data!.products[index].title,
                                  ),
                                )),
                      ],
                    );
                  }
                })),
      ),
    );
  }
}
