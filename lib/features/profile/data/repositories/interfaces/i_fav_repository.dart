// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
import 'package:nawy/features/vendor_details/data/models/vendor_details_model.dart';
import 'package:nawy/features/venues/data/models/product_model.dart';
abstract class IFavRepository {
  Future<Result<List<ProductModel>>> getWishlistVendor();
  Future<Result<List<ProductModel>>> getWishlistPackage();

  Future<Result<VendorDetailsModel>> wishlistVendor({required int id,});
  Future<Result<VendorDetailsModel>> wishlistPackage({required int id,});

}
