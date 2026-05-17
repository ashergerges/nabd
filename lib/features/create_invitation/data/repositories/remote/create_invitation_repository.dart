// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/create_invitation/data/models/selected_guest.dart';
import 'package:nawy/features/home/data/models/home_response.dart';

import '../interfaces/i_create_invitation_repository.dart';

@Injectable(as: ICreateInvitationRepository)
class CreateInvitationRepository implements ICreateInvitationRepository {
  final NetworkService networkService;

  CreateInvitationRepository({required this.networkService});

  @override
  Future<Result<String>> createInvitation({ required int bookingId,required String nameBride,required String nameGroom,required List<SelectedGuest> listGuest,}) async {
    var response = await networkService.postAsync(
      url: AppStrings.urls.createInvitationUrl,
      body: {
        "booking_id":bookingId,
        "groom_name":nameGroom,
        "bride_name":nameBride,
        "guests": listGuest.map((e) => e.toJson()).toList(),
      }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['message']}");
    return Result.value(
        response.asValue?.value.data['message']
    );
  }
}
