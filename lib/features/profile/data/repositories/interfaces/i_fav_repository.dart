// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nawy/features/profile/data/models/fav/fav_package_model.dart';
import 'package:nawy/features/profile/data/models/fav/fav_vendor_model.dart';
abstract class IFavRepository {
  Future<Result<List<FavVendorModel>>> getWishlistVendor();
  Future<Result<List<FavPackageModel>>> getWishlistPackage();


}
