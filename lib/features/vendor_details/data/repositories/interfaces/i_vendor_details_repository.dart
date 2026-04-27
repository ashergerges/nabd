// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
import 'package:nawy/features/vendor_details/data/models/vendor_details_model.dart';
import 'package:nawy/features/venues/data/models/product_model.dart';
abstract class IVendorDetailsRepository {
  Future<Result<VendorDetailsModel>> vendorDetails({required int id});

}
