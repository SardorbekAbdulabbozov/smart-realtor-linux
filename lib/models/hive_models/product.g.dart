// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      objectId: fields[0] as String?,
      images: (fields[1] as List?)?.cast<String>(),
      isRent: fields[2] as bool?,
      price: fields[3] as dynamic,
      area: fields[4] as dynamic,
      numberOfRooms: fields[5] as dynamic,
      isRecommended: fields[6] as bool?,
      isLand: fields[12] as bool?,
      isBooked: fields[13] as bool?,
      createdAt: fields[7] as String?,
      updatedAt: fields[8] as String?,
      description: fields[9] as String?,
      address: fields[10] as String?,
      title: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.objectId)
      ..writeByte(1)
      ..write(obj.images)
      ..writeByte(2)
      ..write(obj.isRent)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.area)
      ..writeByte(5)
      ..write(obj.numberOfRooms)
      ..writeByte(6)
      ..write(obj.isRecommended)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.address)
      ..writeByte(11)
      ..write(obj.title)
      ..writeByte(12)
      ..write(obj.isLand)
      ..writeByte(13)
      ..write(obj.isBooked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
