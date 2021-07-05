import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubCategoryItem extends StatefulWidget {
  final String subCategoryName;
  final bool selected;
  final Function onSelected;
  SubCategoryItem({
    Key key,
    @required this.subCategoryName,
    @required this.selected,
    @required this.onSelected,
  }) : super(key: key);

  @override
  _SubCategoryItemState createState() => _SubCategoryItemState();
}

class _SubCategoryItemState extends State<SubCategoryItem> {
  bool _subcatSelected;

  @override
  void initState() {
    _subcatSelected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _subcatSelected = _subcatSelected ? false : true;
        });
        widget.onSelected();
      },
      child: Container(
        width: 80,
        height: 50, //data.categoryNameAr
        child: Center(
            child: Text(
          widget.subCategoryName,
          style: TextStyle(
            color: _subcatSelected ? Colors.white : Colors.black,
          ),
        )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: _subcatSelected ? Colors.green : Color(0xFFCBCED1)),
      ),
    );
  }
}
