import 'package:eschool/ui/widgets/customRoundedButton.dart';
import 'package:eschool/utils/animationConfiguration.dart';
import 'package:eschool/utils/errorMessageKeysAndCodes.dart';
import 'package:eschool/utils/labelKeys.dart';
import 'package:eschool/utils/uiUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class ErrorContainer extends StatelessWidget {
  final String? errorMessageCode;
  final String? errorMessageText; //use when not using code
  final bool? showRetryButton;
  final bool? showErrorImage;
  final Color? errorMessageColor;
  final double? errorMessageFontSize;
  final Function? onTapRetry;
  final Color? retryButtonBackgroundColor;
  final Color? retryButtonTextColor;
  final bool animate;
  const ErrorContainer({
    Key? key,
    this.errorMessageCode,
    this.errorMessageText,
    this.errorMessageColor,
    this.errorMessageFontSize,
    this.onTapRetry,
    this.showErrorImage,
    this.retryButtonBackgroundColor,
    this.retryButtonTextColor,
    this.showRetryButton,
    this.animate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: animate ? customItemBounceScaleAppearanceEffects() : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * (0.025),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (0.35),
            child: SvgPicture.asset(
              UiUtils.getImagePath(
                errorMessageCode == ErrorMessageKeysAndCode.noInternetCode
                    ? "noInternet.svg"
                    : "somethingWentWrong.svg",
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (0.025),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              errorMessageText ??
                  UiUtils.getErrorMessageFromErrorCode(
                      context, errorMessageCode ?? ""),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: errorMessageColor ??
                    Theme.of(context).colorScheme.secondary,
                fontSize: errorMessageFontSize ?? 16,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          (showRetryButton ?? true)
              ? CustomRoundedButton(
                  height: 40,
                  widthPercentage: 0.3,
                  backgroundColor: retryButtonBackgroundColor ??
                      Theme.of(context).colorScheme.primary,
                  onTap: () {
                    onTapRetry?.call();
                  },
                  titleColor: retryButtonTextColor ??
                      Theme.of(context).scaffoldBackgroundColor,
                  buttonTitle: UiUtils.getTranslatedLabel(context, retryKey),
                  showBorder: false,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
