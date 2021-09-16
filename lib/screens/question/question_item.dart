import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionItem extends StatelessWidget {
  var index = 0.obs;
  var question_count = 10.obs;
  var true_count = 3.obs;
  var false_count = 2.obs;
  var empty_count = 5.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        elevation: 3,
        margin: EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Soru : (${index.value}/${question_count.value})",
                    style: TextStyle(
                      color: Get.theme.primaryColorDark,
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Doğru:${true_count.value} -- Yanlış:${false_count
                        .value} -- Boş:${empty_count.value}",
                    style: TextStyle(
                      color: Get.theme.primaryColorLight,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${index.value +
                    1}. Soru : Aşağıdakilerden hangisi aşağıdadır sad asdsa d asdasdasdas dasdasdasd asd asd sa",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Get.theme.primaryColor,
                  fontSize: 12,
                ),
              ),
              OptionItemWidget(
                optionText:
                "Apple’ın her yılın Eylül ayında düzenlediği iPhone etkinliğinin tarihi, tahmin edildiği gibi 14 Eylül oldu. Salı günü tahmin edildiği üzere iPhone 13, AirPods 3 ve diğer cihazları canlı yayında sizlerle birlikte karşılayacağız. 14 Eylül saat 19:30’da SDN YouTube kanalında canlı yayındayız!",
                onClickListener: () {

                },
              ),
            ],
          ),
        ),
      );
    });
  }


}

class OptionItemWidget extends StatelessWidget {
  String optionText;
  void Function(int) onClickListener;
  late Rx<Color> bgColor = Colors.white.obs;
  late Rx<Color> textColor = Colors.black.obs;
  RxInt isOptionState = 0.obs;

  OptionItemWidget({required this.optionText, required this.onClickListener});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        elevation: 3,
        color: bgColor.value,
        child: InkWell(
          splashColor: Get.theme.primaryColor.withAlpha(30),
          onTap: () {
            onClickListener(isOptionState.value);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "A |",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: textColor.value,
                    fontSize: 14,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      optionText,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: textColor.value,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }


}

class OptionType {
  static int NONE = 0;
  static int TRUE = 1;
  static int FALSE = 2;
}
