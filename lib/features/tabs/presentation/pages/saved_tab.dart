import 'package:YumFind/core/utils/app_strings.dart';
import 'package:YumFind/features/tabs/data/models/SearchModel.dart';
import 'package:YumFind/features/tabs/presentation/widgets/saved_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SavedTab extends StatelessWidget {
  const SavedTab({super.key});

  @override
  Widget build(BuildContext context) {
    var favBox = Hive.box<Recipe>(AppStrings.favBox);

    return ValueListenableBuilder(
      valueListenable: favBox.listenable(),
      builder: (context, Box<Recipe> box, _) {
        var data = box.values.toList();

        return SizedBox(
          height: 800.h,
          child: GridView.builder(
            itemCount: data.length,
            padding: EdgeInsets.only(right: 20.w, top: 20.h, bottom: 105.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.w,
              crossAxisSpacing: 16.h,
              childAspectRatio: .75,
            ),
            itemBuilder: (context, index) {
              var recipe = data[index];
              return SavedWidget(recipe: recipe);
            },
          ),
        );
      },
    );
  }
}
