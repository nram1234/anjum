import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'not_complete_order.g.dart';
@HiveType(typeId: 0)
class NotComplete_order{
  @HiveField(0)
late  String id;
  @HiveField(1)
late  String customerId;
  @HiveField(2)
late  String itemId;
  @HiveField(3)
 late String descount;
  @HiveField(4)
 late String itemCount;

  NotComplete_order(
      { required this.customerId, required this.itemId, required this.descount, required this.itemCount});
}