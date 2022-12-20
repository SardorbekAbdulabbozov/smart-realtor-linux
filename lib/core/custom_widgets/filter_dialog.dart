import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/custom_button.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({
    Key? key,
    required this.isRent,
    required this.isRecommended,
    required this.isLand,
    required this.onApply,
    required this.status,
  }) : super(key: key);
  final bool isRent;
  final bool isRecommended;
  final bool isLand;
  final void Function(bool, bool, bool) onApply;
  final void Function(bool, bool, bool) status;

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  bool _isRent = false;
  bool _isRentEnable = false;
  bool _isRecommended = false;
  bool _isRecommendedEnable = false;
  bool _isLand = false;
  bool _isLandEnable = false;

  @override
  void initState() {
    super.initState();
    _isRent = widget.isRent;
    _isRecommended = widget.isRecommended;
    _isLand = widget.isLand;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: width / 3,
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: AppConstants.marginAll16,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: AppConstants.borderRadius12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text(
                  'Filter',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppConstants.spacer,
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: Get.back,
                ),
              ],
            ),
            FilterItem(
              title: 'Is Land?',
              value: _isLand,
              onChanged: (value) {
                _isLand = value;
                setState(() {});
              },
              onEnableOrDisable: (value) {
                _isLandEnable = value;
                setState(() {});
              },
              isEnabled: _isLandEnable,
            ),
            FilterItem(
              title: 'Is Rent?',
              value: _isRent,
              onChanged: (value) {
                _isRent = value;
                setState(() {});
              },
              onEnableOrDisable: (value) {
                _isRentEnable = value;
                setState(() {});
              },
              isEnabled: _isRentEnable,
            ),
            FilterItem(
              title: 'Is Recommended?',
              value: _isRecommended,
              onChanged: (value) {
                _isRecommended = value;
                setState(() {});
              },
              onEnableOrDisable: (value) {
                _isRecommendedEnable = value;
                setState(() {});
              },
              isEnabled: _isRecommendedEnable,
            ),
            AppConstants.boxHeight16,
            CustomButton(
              title: 'Apply Filter',
              onPressed: () {
                widget.status
                    .call(_isLandEnable, _isRentEnable, _isRecommendedEnable);
                widget.onApply.call(_isLand, _isRent, _isRecommended);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.onEnableOrDisable,
    required this.isEnabled,
  }) : super(key: key);
  final String title;
  final bool value;
  final bool isEnabled;
  final void Function(bool) onChanged;
  final void Function(bool) onEnableOrDisable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(title),
        ),
        Switch(
          value: value,
          onChanged:isEnabled? onChanged:null,
        ),
        AppConstants.spacer,
        SizedBox(
          height: 20,
          width: 100,
          child: CustomButton(
            title: isEnabled ? 'Disable' : 'Enable',
            color: isEnabled ? Colors.red : Colors.green,
            onPressed: () {
              onEnableOrDisable.call(!isEnabled);
            },
          ),
        ),
      ],
    );
  }
}
