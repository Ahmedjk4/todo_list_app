import 'package:flutter/material.dart';

import '../../widgets/modal_bottom_sheet.dart';

void showCustomModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return const ModalBottomSheet();
    },
    backgroundColor: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    enableDrag: true,
  );
}
