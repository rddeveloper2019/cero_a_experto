import 'package:cero_a_experto/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';

extension Loader on Widget {
  Widget loading(bool isLoading) {
    if (isLoading) {
      return const FullScreenLoader();
    }

    return this;
  }
}
