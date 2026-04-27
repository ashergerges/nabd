import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/create_invitation/data/models/selected_guest.dart';
Future<List<SelectedGuest>?> showContactSelectedSheet(
    BuildContext context,
    List<Contact> allContacts,
    ) {
  return showModalBottomSheet<List<SelectedGuest>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) =>  ContactSelectedSheet(allContacts: allContacts,),
  );
}


class ContactSelectedSheet extends StatelessWidget {
  final   List<Contact> allContacts;

  const ContactSelectedSheet({super.key, required this.allContacts});

  @override
  Widget build(BuildContext context) {
      return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // drag handle
              Container(
                margin:10.padTop,
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              8.verticalSpace,
              Expanded(
                child:  ListView.builder(
                  controller: scrollController,
                  itemCount: allContacts.length,
                  itemBuilder: (_, i) {
                    final contact = allContacts[i];
                    final phone = contact.phones.first.number;
                    final initials = contact.displayName
                        .trim()
                        .split(' ')
                        .take(2)
                        .map((w) => w.isNotEmpty ? w[0] : '')
                        .join()
                        .toUpperCase();

                    return ListTile(
                      contentPadding:2.padVertical+20.padHorizontal,
                      leading: CircleAvatar(
                        radius: 22,
                        backgroundColor:
                        AppColors.blue,
                        child: Text(
                          initials,
                          style: AppTextTheme.bodyMediumSemiBold(context).copyWith(color: AppColors.white)
                        ),
                      ),
                      title: Text(
                        contact.displayName,
                        style: AppTextTheme.bodyMediumSemiBold(context)
                      ),
                      subtitle: Text(
                        phone,
                        style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.neutral200,fontWeight: FontWeight.w300)
                      ),


                    );
                  },
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}

