import 'package:flutter/material.dart';
import 'package:my_home/core/custom_widgets/single_info_item.dart';

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({
    Key? key,
    required this.area,
    required this.type,
    required this.rooms,
    required this.price,
    required this.address,
  }) : super(key: key);
  final bool type;
  final String area;
  final String rooms;
  final String price;
  final String address;

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
            content: '$area sqm',
            iconColor: Colors.green,
          ),
          SingleInfoItem(
            icon: Icons.sell,
            title: 'Type',
            content: type ? 'Rent' : 'Sell',
            iconColor: Colors.red,
          ),
          SingleInfoItem(
            icon: Icons.meeting_room_sharp,
            title: 'Rooms',
            content: rooms,
            iconColor: Colors.black,
          ),
          SingleInfoItem(
            icon: Icons.location_on,
            title: 'Address',
            content: address.isNotEmpty ? address.split(', ')[1] : 'Undefined',
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
