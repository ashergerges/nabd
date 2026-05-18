import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/venues/data/models/filter_model.dart';
import 'package:nawy/features/venues/data/models/product_model.dart';
import 'package:nawy/features/venues/data/repositories/interfaces/i_venues_repository.dart';
import 'package:nawy/main_common.dart';
import 'dart:async';

part 'venues_state.dart';
part 'venues_cubit.freezed.dart';


class VenuesCubit extends Cubit<VenuesState> {
  VenuesCubit()
      : _repository = getIt<IVenuesRepository>(),
        super(const VenuesState(
          filterDataTemp: FilterModel(),
          filterData: FilterModel()));

  final IVenuesRepository _repository;
  Timer? _debounceTimer;

  Future<void> venues(int categoryId) async {
    emit(state.copyWith(currState: Loading()));

    var venues = await _repository.venues(
      categoryId: categoryId,
      minPrice: state.filterData?.minPrice,
      maxPrice: state.filterData?.maxPrice,
      date: state.filterData?.date,
      search: state.searchTerm,
    );

    if (venues.isError) {
      MessageService.showToast(
        msg: venues.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));
      return;
    }

    emit(state.copyWith(
      currState: Success(),
      venuesList: venues.asValue?.value ?? [],
    ));
  }

  void setSearch(int categoryId, String? value) {
    emit(state.copyWith(searchTerm: value));
    _debounceTimer?.cancel();

    if (value == null || value.isEmpty || value.length >= 2) {
      _debounceTimer = Timer(const Duration(milliseconds: 500), () {
        venues(categoryId);
      });
    }
  }


  void initialFilter( ) {
    emit(state.copyWith(filterDataTemp:state.filterData));
  }
  void setRangeSuite( RangeValues value) {
    emit(state.copyWith(
        filterDataTemp: state.filterDataTemp?.copyWith(minPrice: value.start, maxPrice: value.end)));
  }
  void setDate(String date) {
    emit(state.copyWith(
        filterDataTemp: state.filterDataTemp?.copyWith(date:date)));
  }

  void resetSuiteFilter(int categoryId) {
    emit(state.copyWith(
        filterDataTemp: FilterModel(),
        filterData: FilterModel()));
    venues(categoryId);
  }

  void saveFilterSuite(int categoryId) {
    emit(state.copyWith(
        filterData: state.filterData?.copyWith(
          maxPrice: state.filterDataTemp?.maxPrice,
          minPrice: state.filterDataTemp?.minPrice,
          date: state.filterDataTemp?.date,
        )));
    venues(categoryId);
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
