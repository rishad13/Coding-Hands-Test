import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../screens/Dashboard/home/productDetailsScreen/services/productDetailsServices.dart';
import '../screens/Dashboard/home/services/HomeScreenServices.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => HomeScreenServices(),
  ),
  ChangeNotifierProvider(
    create: (context) => ProductDetailsScreenServices(),
  )
];
