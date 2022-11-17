import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_create_screen/aims_create_screen.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_edit_screen.dart/aims_edit_screen.dart';

enum PageNames {
  createAim,
  editAim,
}

void openScreen(BuildContext context, { required Widget screen }) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    )
  );
}

class AppRouter {
  static void openPage(BuildContext context, PageNames name, [int? aimId, int? stepId]) {
    switch (name) {
      case PageNames.createAim: {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AimCreateScreen(),
          )
        );
        break;
      }
      case PageNames.editAim: {
        if (aimId != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AimEditScreen(id: aimId),
            )
          );
        } else {
          throw Exception("Parameter [id] of route is missing");
        }
        break;
      }
    }
  }
}