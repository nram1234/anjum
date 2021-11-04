import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'not_complete_order.g.dart';
@HiveType(typeId: 0)
class NotComplete_order{
  @HiveField(0)
  String id;
  @HiveField(1)
  String customerId;
  @HiveField(2)
  String itemId;
  @HiveField(3)
  String descount;
  @HiveField(4)
  String itemCount;

  NotComplete_order(
      {@required this.customerId,@required this.itemId,@required this.descount,@required this.itemCount});
}