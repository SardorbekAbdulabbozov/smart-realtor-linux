import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/custom_button.dart';
import 'package:my_home/core/custom_widgets/custom_text_field.dart';

class ProductEditAddDialog extends StatefulWidget {
  const ProductEditAddDialog({
    Key? key,
    required this.isLand,
    required this.isRent,
    required this.isRecommended,
    required this.onSave,
    this.title,
    this.description,
    this.address,
    this.price,
    this.area,
    this.rooms,
    this.district,
    this.region,
  }) : super(key: key);
  final String? title;
  final String? description;
  final String? address;
  final String? district;
  final String? region;
  final String? price;
  final String? area;
  final String? rooms;
  final bool isLand;
  final bool isRent;
  final bool isRecommended;
  final void Function(
    String?, // title
    String?, // description
    String?, // address
    String?, // district
    String?, // region
    String?, // price
    String?, // area
    String?, // rooms
    bool, // isLand
    bool, // isRent
    bool, // isRecommended
  ) onSave;

  @override
  State<ProductEditAddDialog> createState() => _ProductEditAddDialogState();
}

class _ProductEditAddDialogState extends State<ProductEditAddDialog> {
  late bool _isLand;
  late bool _isRent;
  late bool _isRecommended;
  String _selectedDistrict = 'Choose district';
  String _selectedRegion = 'Choose region';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _roomsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title ?? "";
    _descriptionController.text = widget.description ?? "";
    _addressController.text = widget.address ?? "";
    _priceController.text = widget.price ?? "";
    _areaController.text = widget.area ?? "";
    _roomsController.text = widget.rooms ?? "";
    _selectedDistrict = widget.district ?? "Choose district";
    _selectedRegion = widget.region ?? "Choose region";
    _isLand = widget.isLand;
    _isRent = widget.isRent;
    _isRecommended = widget.isRecommended;
    setState(() {});
  }

  void showErrorSnackBar(String errorMessage) {
    if (Get.isSnackbarOpen) return;
    Get.snackbar(
      'Error!',
      errorMessage,
      titleText: const Center(
        child: Text(
          'Error!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/ic_close_circle.svg',
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 12,
      backgroundColor: Colors.red,
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 800),
      margin: EdgeInsets.symmetric(horizontal: Get.width / 5, vertical: 64),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
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
          color: Colors.white,
          borderRadius: AppConstants.borderRadius12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.title ?? "New Item",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppConstants.spacer,
                IconButton(
                  icon: const Icon(
                    Icons.close,
                  ),
                  onPressed: Get.back,
                ),
              ],
            ),
            AppConstants.boxHeight12,
            CustomTextField(
              labelText: 'Title',
              controller: _titleController,
            ),
            AppConstants.boxHeight12,
            CustomTextField(
              labelText: "Description",
              controller: _descriptionController,
            ),
            AppConstants.boxHeight12,
            CustomTextField(
              labelText: "Address",
              controller: _addressController,
            ),
            AppConstants.boxHeight12,
            CustomTextField(
              labelText: "Price",
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              controller: _priceController,
            ),
            AppConstants.boxHeight12,
            CustomTextField(
              labelText: "Area",
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              controller: _areaController,
            ),
            AppConstants.boxHeight12,
            CustomTextField(
              labelText: "No. of Rooms",
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              controller: _roomsController,
            ),
            AppConstants.boxHeight12,
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: AppConstants.borderRadius12,
                  ),
                  child: DropdownButton<String>(
                    items: <DropdownMenuItem<String>>[
                          const DropdownMenuItem<String>(
                            value: 'Choose district',
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text('Choose district'),
                            ),
                          )
                        ] +
                        ((AppConstants.districts[_selectedRegion] ?? [])
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(e),
                                ),
                              ),
                            )
                            .toList()),
                    value: _selectedDistrict,
                    onChanged: (value) {
                      _selectedDistrict = value ?? 'Choose district';
                      setState(() {});
                    },
                    underline: Container(),
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.arrow_drop_down_sharp),
                    ),
                  ),
                ),
                AppConstants.spacer,
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: AppConstants.borderRadius12,
                  ),
                  child: DropdownButton<String>(
                    items: AppConstants.regions
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(e),
                            ),
                          ),
                        )
                        .toList(),
                    value: _selectedRegion,
                    onChanged: (value) {
                      _selectedDistrict = 'Choose district';
                      _selectedRegion = value ?? 'Choose region';
                      setState(() {});
                    },
                    underline: Container(),
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.arrow_drop_down_sharp),
                    ),
                  ),
                ),
              ],
            ),
            AppConstants.boxHeight12,
            Row(
              children: [
                const Text('Is Land?'),
                Switch(
                  value: _isLand,
                  onChanged: (value) {
                    setState(() {
                      _isLand = value;
                    });
                  },
                ),
                AppConstants.spacer,
                const Text('Sell'),
                Switch(
                  value: _isRent,
                  onChanged: (value) {
                    setState(() {
                      _isRent = value;
                    });
                  },
                  inactiveThumbColor: Colors.green,
                  inactiveTrackColor: Colors.green[100],
                ),
                const Text('Rent'),
                AppConstants.spacer,
                const Text('Is Recommended?'),
                Switch(
                  value: _isRecommended,
                  onChanged: (value) {
                    setState(() {
                      _isRecommended = value;
                    });
                  },
                ),
              ],
            ),
            AppConstants.boxHeight12,
            CustomButton(
              title: 'Save',
              onPressed: //widget.onSave,
                  () {
                List<String> errorMessage = [];
                if (_selectedDistrict == 'Choose district' ||
                    _selectedRegion == 'Choose region') {
                  if (_selectedRegion == 'Choose region') {
                    errorMessage.add('region');
                  }
                  if (_selectedDistrict == 'Choose district') {
                    errorMessage.add('district');
                  }
                  showErrorSnackBar('Please choose ${errorMessage.join(', ')}');
                  return;
                }

                widget.onSave.call(
                  _titleController.text == widget.title
                      ? null
                      : _titleController.text,
                  _descriptionController.text == widget.description
                      ? null
                      : _descriptionController.text,
                  _addressController.text == widget.address
                      ? null
                      : _addressController.text,
                  _selectedDistrict,
                  _selectedRegion,
                  _priceController.text == widget.price
                      ? null
                      : _priceController.text,
                  _areaController.text == widget.area
                      ? null
                      : _areaController.text,
                  _roomsController.text == widget.rooms
                      ? null
                      : _roomsController.text,
                  _isLand,
                  _isRent,
                  _isRecommended,
                );
                debugPrint("Title: ${_titleController.text}");
                debugPrint("Description: ${_descriptionController.text}");
                debugPrint("Address: ${_addressController.text}");
                debugPrint("District: $_selectedDistrict");
                debugPrint("Region: $_selectedRegion");
                debugPrint("Price: ${_priceController.text}");
                debugPrint("Area: ${_areaController.text}");
                debugPrint("Rooms: ${_roomsController.text}");
                debugPrint("Is Land: $_isLand");
                debugPrint("Is Rent: $_isRent");
                debugPrint("Is Recommended: $_isRecommended");
              },
            ),
          ],
        ),
      ),
    );
  }
}
