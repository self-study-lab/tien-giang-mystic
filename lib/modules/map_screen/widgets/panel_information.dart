import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../utils/gap.dart';
import '../map_screen_controller.dart';
import 'news_tab.dart';
import 'place_description.dart';
import 'place_image.dart';

class PanelInformation extends GetView<MapScreenController> {
  final ScrollController scrollController;
  const PanelInformation({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapScreenController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: k16,
        ),
        child: Obx(
          () {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: k16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.placeDetail.value.placeName ?? '',
                        style: context.textTheme.titleLarge?.copyWith(
                          color: context.theme.colorScheme.scrim,
                        ),
                      ),
                      Gap(k4),
                      Text(
                        "Giá vé: ${controller.placeDetail.value.ticket ?? ''}",
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        controller.placeDetail.value.placeLabel ?? '',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        controller.placeDetail.value.openCloseHour ?? '',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(k4),
                TabBar(
                  tabs: controller.tabsData,
                  controller: controller.tabController,
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      PlaceDescription(
                        scrollController: scrollController,
                      ),
                      PlaceImage(
                        scrollController: scrollController,
                      ),
                      NewsTab(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
