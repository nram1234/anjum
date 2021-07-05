import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'subcategory_item.dart';

class SubCategoriesList extends StatelessWidget {
  final List<SubCategories> allsubcat;
  final Function(String) onSelected;
  SubCategoriesList({
    Key key,
    @required this.allsubcat,
    @required this.onSelected,
  }) : super(key: key);


  List<Widget> subcat = [];
  List<bool> subcatSelected = [];

  @override
  Widget build(BuildContext context) {

    for (int i = 0; i < allsubcat.length; i++) {
      subcatSelected.add(false);
      subcat.add(subitems(data: allsubcat[i], selected: subcatSelected[i]));
    }

    return Wrap(
      children: subcat,
    );
  }

  Widget subitems({SubCategories data, bool selected,}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SubCategoryItem(
        subCategoryName: data.subCategoryNameEn,
        selected: selected,
        onSelected: () {
          onSelected(data.id);
        },
      ),
    );
  }
}
