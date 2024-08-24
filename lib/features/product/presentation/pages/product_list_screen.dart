import 'package:flutter/material.dart';
import 'package:smbt/core/utils/custom_colors.dart';
import 'package:smbt/core/widgets/custom_app_bar.dart';
import 'package:smbt/core/widgets/custom_slidable_button_widget.dart';
import 'package:smbt/features/product/presentation/widgets/product_list_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.07),
        child: CustomAppBarWidget(
          title: appLocalizations.inventoryReport,
          options: const [],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: CustomColor.white,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(color: CustomColor.gray_medium),
                child: Center(
                  child: Text(
                    '${appLocalizations.debtor}/${appLocalizations.creditor}',
                    style:
                        const TextStyle(color: CustomColor.white, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      CustomSlidableButtonWidget(
                        options: [
                          appLocalizations.all,
                          appLocalizations.ended,
                          appLocalizations.stock,
                        ],
                        onTap: (slide) {
                          pageController.animateToPage(slide,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.linear);
                        },
                        initialValue: 0,
                        backgroundColor: CustomColor.gray_medium,
                        choseColor: CustomColor.white,
                        selectedTextColor: CustomColor.gray_darker,
                        unselectedTextColor: CustomColor.gray_medium_dark,
                      ),
                      Expanded(
                          child: PageView(
                        controller: pageController,
                        children: const [
                          ProductListWidget(type: 1),
                          ProductListWidget(type: 2),
                          ProductListWidget(type: 3),
                        ],
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
