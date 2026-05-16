
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart'as dir;
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/create_invitation/data/models/selected_guest.dart';
import 'package:nawy/gen/locale_keys.g.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../gen/assets.gen.dart';

Future<List<SelectedGuest>?> showContactPickerSheet(
    BuildContext context, {
      List<SelectedGuest>? initialSelected,
      void Function(List<SelectedGuest> selected)? onConfirm,
    }) {
  return showModalBottomSheet<List<SelectedGuest>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _ContactPickerSheet(
      initialSelected: initialSelected,
      onConfirm: onConfirm,
    ),
  );
}


class _ContactPickerSheet extends StatefulWidget {
  final List<SelectedGuest>? initialSelected;
  final void Function(List<SelectedGuest> selected)? onConfirm;

  const _ContactPickerSheet({
    this.initialSelected,
    this.onConfirm,
  });

  @override
  State<_ContactPickerSheet> createState() => _ContactPickerSheetState();
}

class _ContactPickerSheetState extends State<_ContactPickerSheet> {
  List<Contact> _allContacts = [];
  List<Contact> _filtered = [];
  final Set<String> _selectedIds = {};
  final TextEditingController _search = TextEditingController();
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadContacts();
    _search.addListener(_onSearch);
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  // ── load contacts ──────────────────────────
  Future<void> _loadContacts() async {
    final status = await Permission.contacts.request();
    if (!status.isGranted) {
      setState(() {
        _error = 'Contacts permission denied.';
        _loading = false;
      });
      return;
    }

    try {
      final contacts = await FlutterContacts.getContacts(
        withProperties: true, // loads phones
        withPhoto: false,
      );
      // keep only contacts that have at least one phone number
      final withPhone =
      contacts.where((c) => c.phones.isNotEmpty).toList()
        ..sort((a, b) => a.displayName.compareTo(b.displayName));

      setState(() {
        _allContacts = withPhone;
        _filtered = withPhone;
        _loading = false;

        // Pre-select contacts based on initialSelected
        if (widget.initialSelected != null && widget.initialSelected!.isNotEmpty) {
          _preselectContacts();
        }
      });
    } catch (e) {
      setState(() {
        _error ='${ LocaleKeys.failedToLoadContacts.tr()} $e';
        _loading = false;
      });
    }
  }

  // ── pre-select contacts ────────────────────
  void _preselectContacts() {
    for (final guest in widget.initialSelected!) {
      // Try to match by phone number (more reliable)
      final contact = _allContacts.firstWhere(
            (c) => c.phones.any((p) =>
        p.number.replaceAll(RegExp(r'[^\d+]'), '') ==
            guest.phone.replaceAll(RegExp(r'[^\d+]'), '')
        ),
        orElse: () => _allContacts.firstWhere(
              (c) => c.displayName == guest.name,
          orElse: () => Contact(), // Empty contact if not found
        ),
      );

      if (contact.id.isNotEmpty) {
        _selectedIds.add(contact.id);
      }
    }
  }

  // ── search filter ──────────────────────────
  void _onSearch() {
    final q = _search.text.toLowerCase();
    setState(() {
      _filtered = q.isEmpty
          ? _allContacts
          : _allContacts
          .where((c) =>
      c.displayName.toLowerCase().contains(q) ||
          c.phones.any((p) => p.number.contains(q)))
          .toList();
    });
  }

  // ── toggle selection ───────────────────────
  void _toggle(Contact contact) {
    setState(() {
      if (_selectedIds.contains(contact.id)) {
        _selectedIds.remove(contact.id);
      } else {
        _selectedIds.add(contact.id);
      }
    });
  }

  // ── select / deselect all ──────────────────
  void _toggleAll() {
    setState(() {
      if (_selectedIds.length == _filtered.length) {
        _selectedIds.clear();
      } else {
        _selectedIds.addAll(_filtered.map((c) => c.id));
      }
    });
  }

  // ── get selected guests ────────────────────
  List<SelectedGuest> _getSelectedGuests() {
    return _allContacts
        .where((c) => _selectedIds.contains(c.id))
        .map((c) => SelectedGuest(
      name: c.displayName,
      phone: c.phones.first.number,
    ))
        .toList();
  }

  // ── build result and pop ───────────────────
  void _onSend() {
    final selected = _getSelectedGuests();

    // Call the onConfirm callback before popping
    if (widget.onConfirm != null) {
      widget.onConfirm!(selected);
    }

    Navigator.of(context).pop(selected);
  }

  // ─────────────────────────────────────────────
  // BUILD
  // ─────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final allSelected =
        _filtered.isNotEmpty && _selectedIds.length == _filtered.length;

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
                margin: const EdgeInsets.only(top: 10),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // ── search bar ──────────────────
              Padding(
                padding: 12.padVertical + 16.padHorizontal,
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.searchContacts.tr(),
                    prefixIcon: Padding(
                      padding: 12.padAll,
                      child: Assets.svg.search.svg(),
                    ),
                    suffixIcon: _search.text.isNotEmpty
                        ? IconButton(
                      icon: const Icon(Icons.close, size: 18),
                      onPressed: () {
                        _search.clear();
                        _onSearch();
                      },
                    )
                        : null,
                    filled: true,
                    fillColor: AppColors.neutral30,
                    contentPadding: 0.padVertical,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: 20.padHorizontal,
                child: Directionality(
                  textDirection: dir.TextDirection.ltr,
                  child: Row(
                    children: [
                      Text(LocaleKeys.chooseAll.tr(),
                          style: AppTextTheme.headingSmall(context)
                              .copyWith(fontWeight: FontWeight.w600)),
                      24.verticalSpace,
                      const Spacer(),
                      OnTap(
                        onTap: _loading ? null : _toggleAll,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: allSelected
                                  ? AppColors.primary
                                  : Colors.grey.shade400,
                              width: 2,
                            ),
                            color: allSelected
                                ? AppColors.primary
                                : Colors.transparent,
                          ),
                          child: allSelected
                              ? const Icon(Icons.check,
                              size: 16, color: Colors.white)
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              8.verticalSpace,

              // ── contact list ───────────────
              Expanded(
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null
                    ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(_error!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red)),
                  ),
                )
                    : _filtered.isEmpty
                    ?  Center(child: Text(LocaleKeys.noContactsFound.tr()))
                    : ListView.builder(
                  controller: scrollController,
                  itemCount: _filtered.length,
                  itemBuilder: (_, i) {
                    final contact = _filtered[i];
                    final selected =
                    _selectedIds.contains(contact.id);
                    final phone = contact.phones.first.number;
                    final initials = contact.displayName
                        .trim()
                        .split(' ')
                        .take(2)
                        .map((w) => w.isNotEmpty ? w[0] : '')
                        .join()
                        .toUpperCase();

                    return Directionality(
                      textDirection: dir.TextDirection.ltr,

                      child: ListTile(

                        contentPadding:
                        20.padHorizontal + 2.padVertical,
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundColor: AppColors.blue,
                          child: Text(initials,
                              textDirection: dir.TextDirection.ltr,
                              style: AppTextTheme.bodyMediumSemiBold(
                                  context)
                                  .copyWith(
                                  color: AppColors.white)),
                        ),
                        title: Text(contact.displayName,
                            style: AppTextTheme.bodyMediumSemiBold(
                                context)),
                        subtitle: Text(phone,
                            style: AppTextTheme.bodySmall(context)
                                .copyWith(
                                color: AppColors.neutral200,
                                fontWeight: FontWeight.w300)),
                        trailing: OnTap(
                          onTap: () => _toggle(contact),
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selected
                                    ? AppColors.primary
                                    : Colors.grey.shade400,
                                width: 2,
                              ),
                              color: selected
                                  ? AppColors.primary
                                  : Colors.transparent,
                            ),
                            child: selected
                                ? const Icon(Icons.circle,
                                size: 14, color: Colors.white)
                                : null,
                          ),
                        ),
                        onTap: () => _toggle(contact),
                      ),
                    );
                  },
                ),
              ),

              // ── Send button ────────────────
              Padding(
                padding: EdgeInsets.fromLTRB(
                    20, 12, 20, MediaQuery.of(context).padding.bottom + 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primary, AppColors.pink],
                      ),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: ElevatedButton(
                      onPressed: _selectedIds.isEmpty ? null : _onSend,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        disabledBackgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: Text(_selectedIds.isEmpty
                          ? LocaleKeys.send.tr()
                          :LocaleKeys.sendSelected.tr(args: ['${_selectedIds.length}']),
                          style: AppTextTheme.bodyMedium(context)
                              .copyWith(color: AppColors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
