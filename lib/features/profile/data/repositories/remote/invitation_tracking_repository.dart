// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/create_invitation/data/models/selected_guest.dart';
import 'package:nawy/features/profile/data/models/fav/fav_package_model.dart';
import 'package:nawy/features/profile/data/models/fav/fav_vendor_model.dart';
import 'package:nawy/features/profile/data/models/invitation_tracking/invitation_model.dart';
import 'package:nawy/features/profile/data/repositories/interfaces/i_invitation_tracking_repository.dart';

@Injectable(as: IInvitationTrackingRepository)
class InvitationTrackingRepository implements IInvitationTrackingRepository {
  final NetworkService networkService;

  InvitationTrackingRepository({required this.networkService});
  @override
  Future<Result<InvitationModel>> invitation({int? bookingId}) async {
    var response = await networkService.getAsync(
      url:AppStrings.urls.getInvitationByBookingUrl,
      queryParameters: {if(bookingId!=null)"booking_id": bookingId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    return Result.value(
        InvitationModel.fromJson(response.asValue?.value.data['data']['invitation'])
    );
  }

  @override
  Future<Result<InvitationModel>> addedGuest({ required int invitationId,required List<SelectedGuest> listGuest,}) async {
    var response = await networkService.postAsync(
        url: AppStrings.urls.addGuestsUrl,
        body: {
          "invitation_id":invitationId,
          "guests": listGuest.map((e) => e.toJson()).toList(),
        }
    );
    if (response.isError) return Result.error(response.asError!.error);

    return Result.value(
        InvitationModel.fromJson(response.asValue?.value.data['data']['invitation'])
    );
  }
}
