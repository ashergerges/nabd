import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/app_time_format.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/book/cubit/book_cubit.dart';
import 'package:nawy/features/book/data/model/book_screen_model.dart';
import 'package:nawy/features/book/ui/payment_step.dart';
import 'package:nawy/features/book/ui/selected_date_step.dart';
import 'package:nawy/features/book/ui/summary_step.dart';
import 'package:nawy/features/book/ui/widgets/custom_stepper.dart';
import 'package:nawy/gen/locale_keys.g.dart';

@RoutePage()
class BookScreen extends StatelessWidget {
  final BookScreenModel data;
   BookScreen({super.key, required this.data,});
  final List<String> buttonTitle=[LocaleKeys.continueKey.tr(),LocaleKeys.continueToPayment.tr(),LocaleKeys.confirmAndPay.tr(), ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> currentStep = [
      SelectedDateStep(vendorId: data.productId),
      SummaryStep(data: data),
      PaymentStep(),
    ];
    return BlocProvider(
  create: (context) => BookCubit()..getTimeSlots(vendorId: data.productId,date: AppTimeFormat.nowFormatted())..paymentMethods(data.price,data.packageId),
  child: BlocBuilder<BookCubit, BookState>(
  builder: (context, state) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.completeBooking.tr(),
        onBackPressed: state.currentStep==0?null:(){
          context.read<BookCubit>().currentStep(state.currentStep-1);

        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: 37.padHorizontal,
            child: CustomStepper(
              currentStep: state.currentStep,
              stepTitles: [LocaleKeys.yourAppointment.tr(), LocaleKeys.summary.tr(), LocaleKeys.payment.tr()],
            ),
          ),
          Expanded(child: currentStep[state.currentStep]),
        ],
      ),
      bottomNavigationBar: Container(
        padding: 16.padAll,
        child: AppButton(
           isDisable: (state.currentStep==0&&state.bookRequest?.time==null)||(state.currentStep==2&&state.paymentMethods.isEmpty),

            isLoading: state.currState is Loading,
            onTap: (){
              if(state.currentStep==2){
                 context.read<BookCubit>().makeBook().then((value){
                   context.navigateTo(BookingConfirmationRoute(bookConfirmation: value));

                 });
                 return;
              }
              context.read<BookCubit>().currentStep(state.currentStep+1);
            },
            text: buttonTitle[state.currentStep]),
      ),
    );
  },
),
);
  }
}







