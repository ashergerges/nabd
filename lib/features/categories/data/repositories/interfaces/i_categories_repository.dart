// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nawy/features/categories/data/models/category_model.dart';
abstract class ICategoriesRepository {
  Future<Result<List<CategoryModel>>> categories({ String? search});

}
