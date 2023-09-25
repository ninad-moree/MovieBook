import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/loading/loading_bloc.dart';
import '../../themes/app_color.dart';
import 'loading_circle.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;

  const LoadingScreen({
    super.key,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen,
            if (state is LoadingStarted)
              Container(
                decoration: BoxDecoration(
                  color: AppColor.vulcan.withOpacity(0.8),
                ),
                child: const Center(
                  child: LoadingCircle(size: 500),
                ),
              ),
          ],
        );
      },
    );
  }
}
