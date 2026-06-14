import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';

class InformationDialogBox extends StatelessWidget {
  final String title;
  final String description;
  final bool isDeleting;
  final Function()? onClickActionButton;

  const InformationDialogBox({
    super.key,
    required this.title,
    required this.description,
    required this.onClickActionButton,
    this.isDeleting = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isDeleting ? Icons.dangerous : Icons.check_circle,
              size: 65,
              color: isDeleting ? Colors.red : Colors.green,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: _DialogActionButton(
                    text: isDeleting ? l10n.noKeepIt : l10n.noCancelIt,
                    onPressed: () {
                      context.router.maybePop();
                    },
                  ),
                ),
                Expanded(
                  child: _DialogActionButton(
                    text: isDeleting ? l10n.yesDeleteIt : l10n.yesConfirmIt,
                    textColor: Colors.white,
                    color: isDeleting ? Colors.red : Colors.blue,
                    onPressed: onClickActionButton,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function()? onPressed;

  const _DialogActionButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.grey,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      backgroundColor: color,
      child: Text(
        text,
        softWrap: false,
        overflow: TextOverflow.fade,
        style: TextStyle(
          color: textColor,
          fontSize: 15,
        ),
      ),
    );
  }
}
