// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/create_invitation/data/models/selected_guest.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
abstract class ICreateInvitationRepository {
    Future<Result<String>> createInvitation({ required int bookingId, required String nameBride,required String nameGroom,required List<SelectedGuest> listGuest,});

}
