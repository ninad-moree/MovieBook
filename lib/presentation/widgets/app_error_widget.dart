import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

import '../../common/constants/translation_constants.dart';
import '../../common/extensions/string_extension.dart';
import '../../domain/entities/app_error.dart';
import 'button.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function() onPressed;

  const AppErrorWidget({
    super.key,
    required this.errorType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ButtonBar(
            children: [
              Button(
                text: TranslationConstants.retry.t(context),
                onPressed: onPressed,
              ),
              Button(
                text: TranslationConstants.feedback.t(context),
                onPressed: () => Wiredash.of(context).show(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
