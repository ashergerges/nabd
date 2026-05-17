// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nawy/features/create_invitation/data/models/selected_guest.dart';
import 'package:nawy/features/profile/data/models/invitation_tracking/invitation_model.dart';

import '../../../../common/data/local/models/app_user.dart';
abstract class IInvitationTrackingRepository {
  Future<Result<InvitationModel>> invitation({int? bookingId});
  Future<Result<InvitationModel>> addedGuest({ required int invitationId,required List<SelectedGuest> listGuest,});


}
