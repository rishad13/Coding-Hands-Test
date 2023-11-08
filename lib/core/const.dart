import 'package:flutter/material.dart';

//Icons
const homeIcons = 'assets/icons/HomeIcons.svg';
const ordersIcons = 'assets/icons/OrdersIcons.svg';
const searchIcons = 'assets/icons/SearchIcons.svg';

//ScrollingPhysics
ScrollPhysics scrollingPhysics = const BouncingScrollPhysics(
    decelerationRate: ScrollDecelerationRate.fast,
    parent: BouncingScrollPhysics());

//SizedBox
const h20SizedBox = SizedBox(height: 20);
const h10SizedBox = SizedBox(height: 10);
const h5SizedBox = SizedBox(height: 5);
const w10SizedBox = SizedBox(width: 10);
const w5SizedBox = SizedBox(width: 5);

//shimmer
Color shimmerBaseColor = Colors.grey[400]!;
Color shimmerHighlightColor = Colors.grey[50]!;
