import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pet_shop/widgets/text_custom.dart';

Widget searchBar(
    {double width = 1,
    Function(String)? onChange,
    required TextEditingController controller}) {
  return Container(
    // margin: const EdgeInsets.symmetric(horizontal: 4 * 5),
    width: Get.width * width,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.05),
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      onChanged: onChange,
      controller: controller,
      textAlign: TextAlign.left,
      decoration: const InputDecoration(
        // contentPadding: EdgeInsets.all(4 * 3),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: "Tìm kiếm ...",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        prefixIcon: Icon(
          LucideIcons.search,
          size: 16,
        ),
      ),
    ),
  );
}

//avater tròn
Widget avatarImage(
    {required String url,
    double? radius,
    bool isFileImage = false,
    Uint8List? imageF}) {
  bool loadImageError = false;
  return StatefulBuilder(builder: (context, setState) {
    return !isFileImage
        ? CircleAvatar(
            radius: radius,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(url),
            onBackgroundImageError:
                (dynamic exception, StackTrace? stackTrace) {
              setState(() {
                loadImageError = true;
              });
            },
            child: loadImageError
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/image_notfound.jpg'))
                : null)
        : CircleAvatar(
            radius: radius,
            backgroundColor: Colors.transparent,
            backgroundImage:
                const AssetImage('assets/images/image_notfound.jpg'),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(radius ?? 20), // Image radius
                child: (imageF == null)
                    ? Image.asset(
                        'assets/images/image_notfound.jpg',
                        fit: BoxFit.cover,
                      )
                    : Image.memory(
                        imageF,
                        errorBuilder: (buildContext, object, stackTrace) =>
                            Image.asset(
                          'assets/images/image_notfound.jpg',
                          fit: BoxFit.cover,
                        ),
                        fit: BoxFit.cover,
                      ),
              ),
            ));
  });
}

Widget buttonSetting({
  required IconData iconStart,
  required IconData iconEnd,
  Function? onTap,
  required String title,
  bool isToggle = false,
  Color? disabledTrackColor,
  Color? enabledTrackColor,
  bool valToggle = false,
  Function(bool?)? onChangeToggle,
}) {
  return Container(
    decoration: BoxDecoration(
        color: Get.theme.colorScheme.background,
        border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 0.5))),
    padding: const EdgeInsets.only(top: 4 * 5, bottom: 4 * 5),
    child: InkWell(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4 * 5,
            children: [
              Icon(
                iconStart,
                size: 4 * 6,
              ),
              textTitleSmall(text: title),
            ],
          ),
          isToggle
              ? GFToggle(
                  onChanged: onChangeToggle!,
                  value: valToggle,
                  disabledTrackColor:
                      disabledTrackColor ?? Colors.grey.shade300,
                  enabledTrackColor: enabledTrackColor ?? Colors.black,
                  type: GFToggleType.ios,
                )
              : Icon(
                  iconEnd,
                  size: 4 * 5,
                ),
        ],
      ),
    ),
  );
}

Widget noData({required Function inReload}) {
  return Container(
    margin: EdgeInsets.zero,
    color: Get.theme.colorScheme.background,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              // color: Colors.cyan,
              margin: EdgeInsets.zero,
              //height: 20,
              child: Lottie.asset('assets/animate/nodata.json',
                  width: Get.width, fit: BoxFit.fill)),
          textBodyMedium(
            text: 'Không có dữ liệu',
            color: Get.theme.colorScheme.onBackground,
          ),
          GFButton(
            onPressed: () {
              inReload();
            },
            color: Get.theme.colorScheme.onBackground,
            colorScheme: Get.theme.colorScheme,
            text: 'Làm mới',
          )
        ],
      ),
    ),
  );
}
