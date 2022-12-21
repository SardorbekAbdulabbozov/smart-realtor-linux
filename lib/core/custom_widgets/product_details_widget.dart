import 'package:flutter/material.dart';
import 'package:my_home/core/custom_widgets/single_info_item.dart';

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({
    Key? key,
    required this.area,
    required this.type,
    required this.rooms,
    required this.price,
    required this.region,
    required this.isLand,
    required this.district,
  }) : super(key: key);
  final bool type;
  final bool isLand;
  final String area;
  final String rooms;
  final String price;
  final String region;
  final String district;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleInfoItem(
            icon: Icons.square_foot,
            title: 'Area',
            content: '$area ${isLand ? 'ac' : 'm\u00B2'}',
            iconColor: Colors.green,
          ),
          SingleInfoItem(
            icon: Icons.sell,
            title: 'Type',
            content: type ? 'Rent' : 'Sell',
            iconColor: Colors.red,
          ),
          if (!isLand)
            SingleInfoItem(
              icon: Icons.meeting_room_sharp,
              title: 'Rooms',
              content: rooms,
              iconColor: Colors.black,
            ),
          SingleInfoItem(
            icon: Icons.location_on,
            title: 'Address',
            content: [district,region].join(' distict,\n'),
            iconColor: Colors.blue,
          ),
          SingleInfoItem(
            icon: Icons.attach_money,
            title: 'Price',
            content: '\$$price${type ? '/month' : ''}',
            iconColor: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}
