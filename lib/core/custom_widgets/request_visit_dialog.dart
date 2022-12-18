import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/custom_button.dart';
import 'package:my_home/core/custom_widgets/custom_text_field.dart';

class RequestVisitDialog extends StatefulWidget {
  const RequestVisitDialog({Key? key, this.appointedTime, required this.onSave})
      : super(key: key);
  final String? appointedTime;
  final void Function(String?) onSave;

  @override
  State<RequestVisitDialog> createState() => _RequestVisitDialogState();
}

class _RequestVisitDialogState extends State<RequestVisitDialog> {
  final TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _timeController.text = widget.appointedTime ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: width / 4,
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: AppConstants.marginAll16,
        decoration: const BoxDecoration(
          borderRadius: AppConstants.borderRadius12,
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                  ),
                  onPressed: Get.back,
                ),
              ],
            ),
            AppConstants.boxHeight4,
            CustomTextField(
              labelText: 'Time of visit',
              enabled: widget.appointedTime == null,
              hintText:
                  'DAY/MONTH/YEAR HOUR:MINUTE in 24 hour format',
              controller: _timeController,
            ),
            if (widget.appointedTime == null) AppConstants.boxHeight16,
            if (widget.appointedTime == null)
              CustomButton(
                title: 'Request a visit',
                onPressed: () {
                  widget.onSave.call(_timeController.text);
                },
              )
          ],
        ),
      ),
    );
  }
}
