import 'package:admin_app/util/colors.dart';
import 'package:admin_app/util/dimensions.dart';
import 'package:admin_app/util/images.dart';
import 'package:admin_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool _isCollapsed = false;

  void _toggleCollapse() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: size.height,
                width: _isCollapsed ? size.width * 0.10 : size.width * 0.20,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .hintColor
                                          .withOpacity(0.1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(Icons.arrow_back, size: 20),
                              ),
                            ),
                            Spacer(),
                            _isCollapsed == true
                                ? SizedBox(
                                    height: 1,
                                    width: 1,
                                  )
                                : GestureDetector(
                                    onTap: _toggleCollapse,
                                    child: CollapsedButton(),
                                  ),
                          ],
                        ),
                        _isCollapsed == false
                            ? SizedBox(
                                height: 1,
                                width: 1,
                              )
                            : GestureDetector(
                                onTap: _toggleCollapse,
                                child: CollapsedButton()),
                        _isCollapsed == true
                            ? SizedBox(
                                height: 1,
                                width: 1,
                              )
                            : Theme(
                                data: ThemeData(
                                  dividerColor: Colors.transparent,
                                ),
                                child: ExpansionTile(
                                  title: Text(
                                    "Pending (4)",
                                    style: robotoMedium.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.color,
                                        fontSize: Dimensions.fontSizeLarge),
                                  ),
                                  iconColor: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color,
                                  tilePadding: const EdgeInsets.all(0),
                                  children: List.generate(4, (index) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .hintColor
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const CircleAvatar(
                                                maxRadius: 14,
                                                backgroundImage: NetworkImage(
                                                    "https://media.designrush.com/inspiration_images/134933/conversions/_1511456189_555_McDonald's-preview.jpg"),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                "McDonals",
                                                style: robotoRegular.copyWith(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.color),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Order #203",
                                            style: robotoBold.copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.color),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).cardColor,
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              "Delivery",
                                              style: robotoRegular.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                        _isCollapsed == true
                            ? SizedBox(
                                height: 1,
                                width: 1,
                              )
                            : Theme(
                                data: ThemeData(
                                  dividerColor: Colors.transparent,
                                ),
                                child: ExpansionTile(
                                  title: Text(
                                    "Processing (4)",
                                    style: robotoMedium.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.color,
                                        fontSize: Dimensions.fontSizeLarge),
                                  ),
                                  //trailing: const Icon(Icons.arrow_drop_down),
                                  iconColor: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color,
                                  tilePadding: const EdgeInsets.all(0),

                                  children: List.generate(4, (index) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .hintColor
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const CircleAvatar(
                                                maxRadius: 14,
                                                backgroundImage: NetworkImage(
                                                    "https://media.designrush.com/inspiration_images/134933/conversions/_1511456189_555_McDonald's-preview.jpg"),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                "McDonals",
                                                style: robotoRegular.copyWith(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.color),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Order #203",
                                            style: robotoBold.copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.color),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).cardColor,
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              "Delivery",
                                              style: robotoRegular.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                        _isCollapsed == true
                            ? SizedBox(
                                height: 1,
                                width: 1,
                              )
                            : Theme(
                                data: ThemeData(
                                  dividerColor: Colors.transparent,
                                ),
                                child: ExpansionTile(
                                  title: Text(
                                    "Ready (4)",
                                    style: robotoMedium.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.color,
                                        fontSize: Dimensions.fontSizeLarge),
                                  ),
                                  //trailing: const Icon(Icons.arrow_drop_down),
                                  iconColor: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color,
                                  tilePadding: const EdgeInsets.all(0),

                                  children: List.generate(4, (index) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .hintColor
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const CircleAvatar(
                                                maxRadius: 14,
                                                backgroundImage: NetworkImage(
                                                    "https://media.designrush.com/inspiration_images/134933/conversions/_1511456189_555_McDonald's-preview.jpg"),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                "McDonals",
                                                style: robotoRegular.copyWith(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.color),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Order #203",
                                            style: robotoBold.copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.color),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).cardColor,
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              "Delivery",
                                              style: robotoRegular.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                        _isCollapsed == true
                            ? SizedBox(
                                height: 1,
                                width: 1,
                              )
                            : Theme(
                                data: ThemeData(
                                  dividerColor: Colors.transparent,
                                ),
                                child: ExpansionTile(
                                  title: Text(
                                    "On the way (2)",
                                    style: robotoMedium.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.color,
                                        fontSize: Dimensions.fontSizeLarge),
                                  ),
                                  //trailing: const Icon(Icons.arrow_drop_down),
                                  iconColor: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color,
                                  tilePadding: const EdgeInsets.all(0),

                                  children: List.generate(4, (index) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .hintColor
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const CircleAvatar(
                                                maxRadius: 14,
                                                backgroundImage: NetworkImage(
                                                    "https://media.designrush.com/inspiration_images/134933/conversions/_1511456189_555_McDonald's-preview.jpg"),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                "McDonals",
                                                style: robotoRegular.copyWith(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.color),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Order #203",
                                            style: robotoBold.copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.color),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).cardColor,
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              "Delivery", //can i call whatsa ok?
                                              style: robotoRegular.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 1.5,
                color: Theme.of(context).hintColor.withOpacity(0.1),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 175,
                      padding:
                          const EdgeInsets.only(top: 15, left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                maxRadius: 14,
                                backgroundImage: NetworkImage(
                                    "https://media.designrush.com/inspiration_images/134933/conversions/_1511456189_555_McDonald's-preview.jpg"),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "McDonals",
                                style: robotoRegular.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "Order #203",
                                  style: robotoBold.copyWith(
                                      fontSize: Dimensions.fontSizeExtraLarge),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.color,
                                      maxRadius: 2),
                                ),
                                Text(
                                  "XX2435-L",
                                  style: robotoRegular.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: Dimensions.fontSizeExtraLarge),
                                ),
                                Spacer(),
                                MaterialButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    icon: Icon(
                                                      Icons.arrow_back,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Adjust processing time",
                                                    style: robotoMedium.copyWith(
                                                        color: AppColors.black,
                                                        fontSize: Dimensions
                                                            .fontSizeExtraLarge),
                                                  )
                                                ],
                                              ),
                                              content: Container(
                                                height: 320,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.all(8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                AppColors.grey9,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("5",
                                                                  style: robotoMedium
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeOverLarge,
                                                                  )),
                                                              Text("min",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  right: 8,
                                                                  bottom: 8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            border: Border.all(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                width: 1.5),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("10",
                                                                  style: robotoBold
                                                                      .copyWith(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeOverLarge,
                                                                  )),
                                                              Text("min",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  right: 8,
                                                                  bottom: 8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                AppColors.grey9,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("15",
                                                                  style: robotoMedium
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeOverLarge,
                                                                  )),
                                                              Text("min",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  right: 8,
                                                                  bottom: 8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                AppColors.grey9,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("20",
                                                                  style: robotoMedium
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeOverLarge,
                                                                  )),
                                                              Text("min",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.all(8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                AppColors.grey9,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("30",
                                                                  style: robotoMedium
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeOverLarge,
                                                                  )),
                                                              Text("min",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  right: 8,
                                                                  bottom: 8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                AppColors.grey9,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("35",
                                                                  style: robotoBold
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeOverLarge,
                                                                  )),
                                                              Text("min",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  right: 8,
                                                                  bottom: 8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                AppColors.grey9,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("40",
                                                                  style: robotoMedium
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeOverLarge,
                                                                  )),
                                                              Text("min",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  right: 8,
                                                                  bottom: 8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                AppColors.grey9,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("45",
                                                                  style: robotoMedium
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeOverLarge,
                                                                  )),
                                                              Text("min",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.all(8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                AppColors.grey9,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("50",
                                                                  style: robotoMedium
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeOverLarge,
                                                                  )),
                                                              Text("min",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  right: 8,
                                                                  bottom: 8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                AppColors.grey9,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("55",
                                                                  style: robotoBold
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeOverLarge,
                                                                  )),
                                                              Text("min",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  right: 8,
                                                                  bottom: 8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                AppColors.grey9,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("1",
                                                                  style: robotoMedium
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeOverLarge,
                                                                  )),
                                                              Text("hr",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  right: 8,
                                                                  bottom: 8),
                                                          height: 90,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                AppColors.grey9,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("Custom",
                                                                  style: robotoMedium
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeLarge,
                                                                  )),
                                                              Text("time",
                                                                  style: robotoRegular
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeLarge,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets.all(
                                                            30.0),
                                                        child: MaterialButton(
                                                            onPressed: () {},
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                side: BorderSide(
                                                                    width: 1.5,
                                                                    color: AppColors
                                                                        .grey8)),
                                                            child: Text(
                                                              "Cancel",
                                                              style: robotoMedium
                                                                  .copyWith(
                                                                      fontSize:
                                                                          Dimensions
                                                                              .fontSizeDefault),
                                                            ))),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              30.0),
                                                      child: MaterialButton(
                                                          //height: 56,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Update time",
                                                            style: robotoMedium
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeDefault),
                                                          )),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ));
                                  },
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "02:44",
                                    style: robotoBold.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: Icon(
                                                    Icons.arrow_back,
                                                  ),
                                                ),
                                                Text(
                                                  "Change order status",
                                                  style: robotoMedium.copyWith(
                                                      color: AppColors.black,
                                                      fontSize: Dimensions
                                                          .fontSizeExtraLarge),
                                                )
                                              ],
                                            ),
                                            content: Container(
                                              height: 240,
                                              width: 332,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color: AppColors.grey9,
                                                      width: 1)),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 12,
                                                        top: 12,
                                                        right: 12),
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        const CircleAvatar(
                                                            maxRadius: 4,
                                                            backgroundColor:
                                                                AppColors
                                                                    .yellow),
                                                        SizedBox(
                                                          width: 12,
                                                        ),
                                                        Text("Pending",
                                                            style: robotoRegular
                                                                .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge
                                                                  ?.color,
                                                              fontSize: Dimensions
                                                                  .fontSizeDefault,
                                                            )),
                                                        Spacer(),
                                                        //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: AppColors.grey9,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 12,
                                                        top: 12,
                                                        right: 12),
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        const CircleAvatar(
                                                            maxRadius: 4,
                                                            backgroundColor:
                                                                AppColors
                                                                    .green),
                                                        SizedBox(
                                                          width: 12,
                                                        ),
                                                        Text("Processing",
                                                            style: robotoMedium
                                                                .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge
                                                                  ?.color,
                                                              fontSize: Dimensions
                                                                  .fontSizeDefault,
                                                            )),
                                                        Spacer(),
                                                        Icon(Icons.check,
                                                            size: 20,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: AppColors.grey9,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 12,
                                                        top: 12,
                                                        right: 12),
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        const CircleAvatar(
                                                            maxRadius: 4,
                                                            backgroundColor:
                                                                AppColors
                                                                    .grey7),
                                                        SizedBox(
                                                          width: 12,
                                                        ),
                                                        Text(
                                                            "Ready to handover",
                                                            style: robotoRegular
                                                                .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge
                                                                  ?.color,
                                                              fontSize: Dimensions
                                                                  .fontSizeDefault,
                                                            )),
                                                        Spacer(),
                                                        //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: AppColors.grey9,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 12,
                                                        top: 12,
                                                        right: 12),
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        const CircleAvatar(
                                                            maxRadius: 4,
                                                            backgroundColor:
                                                                AppColors
                                                                    .black),
                                                        SizedBox(
                                                          width: 12,
                                                        ),
                                                        Text("On the way",
                                                            style: robotoRegular
                                                                .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge
                                                                  ?.color,
                                                              fontSize: Dimensions
                                                                  .fontSizeDefault,
                                                            )),
                                                        Spacer(),
                                                        //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: AppColors.grey9,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 12,
                                                        top: 12,
                                                        right: 12),
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        const CircleAvatar(
                                                            maxRadius: 4,
                                                            backgroundColor:
                                                                AppColors.red),
                                                        SizedBox(
                                                          width: 12,
                                                        ),
                                                        Text("Canceled",
                                                            style: robotoRegular
                                                                .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge
                                                                  ?.color,
                                                              fontSize: Dimensions
                                                                  .fontSizeDefault,
                                                            )),
                                                        Spacer(),
                                                        //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )));
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Theme.of(context).hintColor,
                                          width: 1),
                                    ),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                            maxRadius: 3,
                                            backgroundColor: Colors.green),
                                        SizedBox(width: 10),
                                        Text("Open",
                                            style: robotoBold.copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.color,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                                fontWeight: FontWeight.w600)),
                                        Icon(Icons.keyboard_arrow_down,
                                            size: 25,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.color),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8.0, // Horizontal space between items
                            runSpacing: 8.0,

                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 1),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  "Delivery",
                                  style: robotoRegular.copyWith(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 1),
                                decoration: BoxDecoration(
                                  color: AppColors.yellow,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Text("1st", style: robotoRegular),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                    backgroundColor: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                    maxRadius: 2),
                              ),
                              Image.asset(Images.cash, height: 20),
                              const SizedBox(width: 10),
                              Text("Cash Payment",
                                  style: robotoRegular.copyWith(
                                      fontWeight: FontWeight.w300)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                    backgroundColor: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                    maxRadius: 2),
                              ),
                              Image.asset(Images.coupon, height: 20),
                              const SizedBox(width: 10),
                              Text("Free Delivery",
                                  style: robotoRegular.copyWith(
                                      fontWeight: FontWeight.w300)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                    backgroundColor: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                    maxRadius: 2),
                              ),
                              Text("Ordered on 10:00 PM",
                                  style: robotoRegular.copyWith(
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                        endIndent: 0,
                        indent: 0,
                        thickness: 1.5,
                        height: 0,
                        color: AppColors.grey9),
                    SizedBox(
                        height: size.height - 200,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // First scrollable column
                                  Expanded(
                                    flex: 22,
                                    child: Column(children: [
                                      Container(
                                        padding: const EdgeInsets.all(30),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.5,
                                            color: Theme.of(context)
                                                .hintColor
                                                .withOpacity(0.1),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Orders",
                                                      style: robotoBold.copyWith(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: Dimensions
                                                              .fontSizeExtraLarge),
                                                    ),
                                                    Text(
                                                      "Total 4 items",
                                                      style: robotoRegular.copyWith(
                                                          color:
                                                              AppColors.grey5,
                                                          fontSize: Dimensions
                                                              .fontSizeSmall),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffF5F5F4),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                  ),
                                                  child: Row(
                                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image.asset(
                                                        "assets/image/list.png",
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 12,
                                                      ),
                                                      Text(
                                                        "This is the order note received\nfrom the customer",
                                                        style: robotoRegular.copyWith(
                                                            color:
                                                                AppColors.grey2,
                                                            fontSize: Dimensions
                                                                .fontSizeSmall),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: AppColors.grey9,
                                          border: Border.all(
                                            width: 1.5,
                                            color: Theme.of(context)
                                                .hintColor
                                                .withOpacity(0.1),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 10,
                                              child: Text(
                                                "ITEMS",
                                                style: robotoRegular.copyWith(
                                                    color: AppColors.grey3,
                                                    fontSize: Dimensions
                                                        .fontSizeSmall),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 3,
                                                child: Center(
                                                  child: Text(
                                                    "QTY",
                                                    style:
                                                        robotoRegular.copyWith(
                                                            color:
                                                                AppColors.grey3,
                                                            fontSize: Dimensions
                                                                .fontSizeSmall),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 4,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "PRICE",
                                                      style: robotoRegular.copyWith(
                                                          color:
                                                              AppColors.grey3,
                                                          fontSize: Dimensions
                                                              .fontSizeSmall),
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                      ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: 3,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1.5,
                                                  color: Theme.of(context)
                                                      .hintColor
                                                      .withOpacity(0.1),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 10,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          right: 20,
                                                          top: 10,
                                                          bottom: 10),
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          right: BorderSide(
                                                            width: 1,
                                                            color:
                                                                AppColors.grey8,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Image.asset(
                                                                "assets/image/burger.png",
                                                                height: 40,
                                                                width: 40,
                                                              ),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  'Bacon Double Cheeseburger Cheeseburger',
                                                                  style: robotoMedium.copyWith(
                                                                      color: AppColors
                                                                          .black,
                                                                      fontSize:
                                                                          Dimensions
                                                                              .fontSizeDefault),
                                                                  maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 48,
                                                                    top: 5),
                                                            child: RichText(
                                                              text: TextSpan(
                                                                text:
                                                                    'Roast Beef/Asado:',
                                                                style: robotoRegular.copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeSmall),
                                                                children: <TextSpan>[
                                                                  TextSpan(
                                                                    text:
                                                                        ' Asado',
                                                                    style: robotoMedium.copyWith(
                                                                        color: AppColors
                                                                            .black,
                                                                        fontSize:
                                                                            Dimensions.fontSizeSmall),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 48,
                                                                    top: 0),
                                                            child: RichText(
                                                              text: TextSpan(
                                                                text:
                                                                    'Degree of Action:',
                                                                style: robotoRegular.copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeSmall),
                                                                children: <TextSpan>[
                                                                  TextSpan(
                                                                    text:
                                                                        ' Rare',
                                                                    style: robotoMedium.copyWith(
                                                                        color: AppColors
                                                                            .black,
                                                                        fontSize:
                                                                            Dimensions.fontSizeSmall),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Divider(
                                                              endIndent: 0,
                                                              indent: 48,
                                                              thickness: 1.5,
                                                              color: AppColors
                                                                  .grey9),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 48,
                                                                    top: 0),
                                                            child: Text(
                                                              "ADD-ONS",
                                                              style: robotoRegular.copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .grey5,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeExtraSmall),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            48,
                                                                        top: 0),
                                                                child: RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    text: '2x',
                                                                    style: robotoMedium.copyWith(
                                                                        color: Theme.of(context)
                                                                            .primaryColor,
                                                                        fontSize:
                                                                            Dimensions.fontSizeSmall),
                                                                    children: <TextSpan>[
                                                                      TextSpan(
                                                                        text:
                                                                            '  Cheese',
                                                                        style: robotoMedium.copyWith(
                                                                            color:
                                                                                AppColors.black,
                                                                            fontSize: Dimensions.fontSizeSmall),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "\$0.75",
                                                                style: robotoRegular.copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeSmall),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                              endIndent: 5,
                                                              indent: 48,
                                                              thickness: 1.5,
                                                              color: AppColors
                                                                  .grey9),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            48,
                                                                        top: 0),
                                                                child: RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    text: '1x',
                                                                    style: robotoMedium.copyWith(
                                                                        color: Theme.of(context)
                                                                            .primaryColor,
                                                                        fontSize:
                                                                            Dimensions.fontSizeSmall),
                                                                    children: <TextSpan>[
                                                                      TextSpan(
                                                                        text:
                                                                            '  Mushrooms',
                                                                        style: robotoMedium.copyWith(
                                                                            color:
                                                                                AppColors.black,
                                                                            fontSize: Dimensions.fontSizeSmall),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "\$0.50",
                                                                style: robotoRegular.copyWith(
                                                                    color: AppColors
                                                                        .grey5,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeSmall),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      height: 215,
                                                      // Need to work hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          right: BorderSide(
                                                            width: 1.5,
                                                            color: AppColors
                                                                .grey9, // Use your color here
                                                          ),
                                                        ),
                                                      ),

                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text: '1',
                                                              style: robotoMedium.copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeExtraLarge),
                                                              children: <TextSpan>[
                                                                TextSpan(
                                                                  text: 'x',
                                                                  style: robotoRegular.copyWith(
                                                                      color: AppColors
                                                                          .black,
                                                                      fontSize:
                                                                          Dimensions
                                                                              .fontSizeSmall),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 4,
                                                      child: Center(
                                                        child: Text('\$25.35',
                                                            style: robotoRegular.copyWith(
                                                                color: AppColors
                                                                    .black,
                                                                fontSize: Dimensions
                                                                    .fontSizeLarge)),
                                                      ))
                                                ],
                                              ),
                                            );
                                          }),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          width: 300,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 6),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Subtotal",
                                                style: robotoRegular.copyWith(
                                                    color: AppColors.grey5,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                              Text("\$41.00",
                                                  style: robotoRegular.copyWith(
                                                      color: AppColors.black,
                                                      fontSize: Dimensions
                                                          .fontSizeLarge,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          width: 300,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 6),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Processing Fee",
                                                style: robotoRegular.copyWith(
                                                    color: AppColors.grey5,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                              Text("\$1.00",
                                                  style: robotoRegular.copyWith(
                                                      color: AppColors.black,
                                                      fontSize: Dimensions
                                                          .fontSizeLarge,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          width: 300,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 6),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Delivery Fee",
                                                style: robotoRegular.copyWith(
                                                    color: AppColors.grey5,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                              Text("\$2.00",
                                                  style: robotoRegular.copyWith(
                                                      color: AppColors.black,
                                                      fontSize: Dimensions
                                                          .fontSizeLarge,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          width: 300,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 6),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Discount",
                                                style: robotoRegular.copyWith(
                                                    color: AppColors.grey5,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                              Text("\$3.00",
                                                  style: robotoRegular.copyWith(
                                                      color: AppColors.black,
                                                      fontSize: Dimensions
                                                          .fontSizeLarge,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                            width: 265,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            height: 1,
                                            color: AppColors.grey8),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          width: 300,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 6),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total",
                                                style: robotoRegular.copyWith(
                                                    color: AppColors.grey5,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                              Text(
                                                "\$3.00",
                                                style: robotoBold.copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize: Dimensions
                                                        .fontSizeLarge),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  // Second scrollable column
                                  Expanded(
                                    flex: 15,
                                    child: Column(children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 260),
                                        child: TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (context) => AlertDialog(
                                                          title: Row(
                                                            children: [
                                                              IconButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_back,
                                                                ),
                                                              ),
                                                              Text(
                                                                "Activity Log",
                                                                style: robotoMedium.copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        Dimensions
                                                                            .fontSizeExtraLarge),
                                                              )
                                                            ],
                                                          ),
                                                          content: Container(
                                                            height: 450,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10,
                                                                      top: 15,
                                                                      right:
                                                                          150),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      PointWidget(
                                                                          statusColor:
                                                                              Colors.yellow),
                                                                      const SizedBox(
                                                                          width:
                                                                              15),
                                                                      StatusTitleWidget(
                                                                        statusText:
                                                                            'Pending- 5 min',
                                                                        statusTime:
                                                                            '10:10 - 10:15, 24 Aug 2024',
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          30),
                                                                  Row(
                                                                    children: [
                                                                      Column(
                                                                        children: [
                                                                          const PointWidget(
                                                                              statusColor: Colors.green),
                                                                          Container(
                                                                              width: 1,
                                                                              height: 50,
                                                                              color: Colors.grey.withOpacity(0.2)),
                                                                          const PointWidget(
                                                                              statusColor: Colors.green),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                          width:
                                                                              15),
                                                                      Column(
                                                                        children: [
                                                                          StatusTitleWidget(
                                                                            statusText:
                                                                                'Processing- 10 min',
                                                                            statusTime:
                                                                                '10:10 - 10:15, 24 Aug 2024',
                                                                          ),
                                                                          const SizedBox(
                                                                              height: 35),
                                                                          StatusTitleWidget(
                                                                            statusText:
                                                                                'Processing- 5 min*',
                                                                            statusTime:
                                                                                '10:10 - 10:15, 24 Aug 2024',
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          30),
                                                                  Row(
                                                                    children: [
                                                                      PointWidget(
                                                                          statusColor:
                                                                              AppColors.grey7),
                                                                      const SizedBox(
                                                                          width:
                                                                              15),
                                                                      StatusTitleWidget(
                                                                        statusText:
                                                                            'Handed over',
                                                                        statusTime:
                                                                            '10:22, 24 Aug 2024',
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          30),
                                                                  Row(
                                                                    children: [
                                                                      PointWidget(
                                                                          statusColor:
                                                                              AppColors.black),
                                                                      const SizedBox(
                                                                          width:
                                                                              15),
                                                                      StatusTitleWidget(
                                                                        statusText:
                                                                            'Picked up',
                                                                        statusTime:
                                                                            '10:24, 24 Aug 2024',
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          30),
                                                                  Row(
                                                                    children: [
                                                                      PointWidget(
                                                                          statusColor:
                                                                              AppColors.black),
                                                                      const SizedBox(
                                                                          width:
                                                                              15),
                                                                      StatusTitleWidget(
                                                                        statusText:
                                                                            'Delivered- 12 min',
                                                                        statusTime:
                                                                            '10:24 - 10:36, 24 Aug 2024',
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                          },
                                          child: Text(
                                            "View Activity Log",
                                            style: robotoMedium.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize:
                                                    Dimensions.fontSizeSmall),
                                          ),
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 30, bottom: 20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                PointWidget(
                                                    statusColor: Colors.yellow),
                                                const SizedBox(width: 15),
                                                StatusTitleWidget(
                                                  statusText: 'Pending- 5 min',
                                                  statusTime:
                                                      '10:10 - 10:15, 24 Aug 2024',
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 30),
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    const PointWidget(
                                                        statusColor:
                                                            Colors.green),
                                                    Container(
                                                        width: 1,
                                                        height: 50,
                                                        color: Colors.grey
                                                            .withOpacity(0.2)),
                                                    const PointWidget(
                                                        statusColor:
                                                            Colors.green),
                                                  ],
                                                ),
                                                const SizedBox(width: 15),
                                                Column(
                                                  children: [
                                                    StatusTitleWidget(
                                                      statusText:
                                                          'Processing- 10 min',
                                                      statusTime:
                                                          '10:10 - 10:15, 24 Aug 2024',
                                                    ),
                                                    const SizedBox(height: 35),
                                                    StatusTitleWidget(
                                                      statusText:
                                                          'Processing- 5 min*',
                                                      statusTime:
                                                          '10:10 - 10:15, 24 Aug 2024',
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(
                                            left: 30,
                                            right: 30,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Deliveryman",
                                                    style:
                                                        robotoMedium.copyWith(
                                                            color:
                                                                AppColors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: Dimensions
                                                                .fontSizeSmall),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Change",
                                                      style: robotoMedium.copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontSize: Dimensions
                                                              .fontSizeSmall),
                                                    ),
                                                    style: TextButton.styleFrom(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 0,
                                                              horizontal: 0),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              //SizedBox(height: 10,),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 25),
                                                width: double.infinity,
                                                constraints: BoxConstraints(),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: AppColors.grey8),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "assets/image/Frame 84.png",
                                                      height: 54,
                                                      width: 54,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "No rider has been \n    assigned yet",
                                                      style: robotoRegular.copyWith(
                                                          color:
                                                              AppColors.grey4,
                                                          fontSize: Dimensions
                                                              .fontSizeSmall),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 30, right: 30, top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Customer",
                                              style: robotoMedium.copyWith(
                                                  color: AppColors.black,
                                                  fontSize:
                                                      Dimensions.fontSizeSmall),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.grey10,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    top: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "David Gomes",
                                                              style: robotoMedium.copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeDefault),
                                                            ),
                                                            Text(
                                                              "24 Orders",
                                                              style: robotoRegular.copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .grey5,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeSmall),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(
                                                                  "assets/image/Frame 35.png",
                                                                  height: 40,
                                                                  width: 40,
                                                                ),
                                                                Image.asset(
                                                                  "assets/image/Frame 36.png",
                                                                  height: 40,
                                                                  width: 40,
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      "25/17 Uttara, Sector 11, \nDhaka, Bangladesh",
                                                      style: robotoRegular.copyWith(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: Dimensions
                                                              .fontSizeSmall),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Show location on map",
                                                        style: robotoRegular.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            fontSize: Dimensions
                                                                .fontSizeSmall),
                                                      ),
                                                      style:
                                                          TextButton.styleFrom(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 0,
                                                                horizontal: 0),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 30, right: 30, top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Store",
                                              style: robotoMedium.copyWith(
                                                  color: AppColors.black,
                                                  fontSize:
                                                      Dimensions.fontSizeSmall),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.grey10,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 20,
                                                    horizontal: orientation ==
                                                            Orientation.portrait
                                                        ? 10
                                                        : 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              "assets/image/Avatar.png",
                                                              height: 35,
                                                              width: 35,
                                                            ),
                                                            SizedBox(
                                                              width: 12,
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "McDonalds",
                                                                  style: robotoMedium.copyWith(
                                                                      color: AppColors
                                                                          .black,
                                                                      fontSize:
                                                                          Dimensions
                                                                              .fontSizeDefault),
                                                                ),
                                                                Text(
                                                                  "Total 567 Orders",
                                                                  style: robotoRegular.copyWith(
                                                                      color: AppColors
                                                                          .grey5,
                                                                      fontSize:
                                                                          Dimensions
                                                                              .fontSizeSmall),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              "assets/image/Frame 35.png",
                                                              height: 30,
                                                              width: 30,
                                                            ),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Image.asset(
                                                              "assets/image/Frame 36.png",
                                                              height: 30,
                                                              width: 30,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(30.0),
                                      child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: BorderSide(
                                                  width: 1.5,
                                                  color: AppColors.grey8)),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            icon: Icon(
                                                              Icons.arrow_back,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Select an issue",
                                                            style: robotoMedium.copyWith(
                                                                color: AppColors
                                                                    .black,
                                                                fontSize: Dimensions
                                                                    .fontSizeExtraLarge),
                                                          )
                                                        ],
                                                      ),
                                                      content: Container(
                                                        height: 240,
                                                        width: 332,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            border: Border.all(
                                                                color: AppColors
                                                                    .grey9,
                                                                width: 1)),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 12,
                                                                      top: 12,
                                                                      right:
                                                                          12),
                                                              child: Row(
                                                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Text(
                                                                      "Item out of stock",
                                                                      style: robotoRegular
                                                                          .copyWith(
                                                                        color: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyLarge
                                                                            ?.color,
                                                                        fontSize:
                                                                            Dimensions.fontSizeDefault,
                                                                      )),
                                                                  Spacer(),
                                                                  //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              color: AppColors
                                                                  .grey9,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 12,
                                                                      top: 12,
                                                                      right:
                                                                          12),
                                                              child: Row(
                                                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Text(
                                                                      "Store is closed",
                                                                      style: robotoMedium
                                                                          .copyWith(
                                                                        color: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyLarge
                                                                            ?.color,
                                                                        fontSize:
                                                                            Dimensions.fontSizeDefault,
                                                                      )),
                                                                  Spacer(),
                                                                  Icon(
                                                                      Icons
                                                                          .check,
                                                                      size: 20,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              color: AppColors
                                                                  .grey9,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 12,
                                                                      top: 12,
                                                                      right:
                                                                          12),
                                                              child: Row(
                                                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Text(
                                                                      "Store is too busy",
                                                                      style: robotoRegular
                                                                          .copyWith(
                                                                        color: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyLarge
                                                                            ?.color,
                                                                        fontSize:
                                                                            Dimensions.fontSizeDefault,
                                                                      )),
                                                                  Spacer(),
                                                                  //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              color: AppColors
                                                                  .grey9,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 12,
                                                                      top: 12,
                                                                      right:
                                                                          12),
                                                              child: Row(
                                                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Text(
                                                                      "Customer called to cancel",
                                                                      style: robotoRegular
                                                                          .copyWith(
                                                                        color: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyLarge
                                                                            ?.color,
                                                                        fontSize:
                                                                            Dimensions.fontSizeDefault,
                                                                      )),
                                                                  Spacer(),
                                                                  //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              color: AppColors
                                                                  .grey9,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 12,
                                                                      top: 12,
                                                                      right:
                                                                          12),
                                                              child: Row(
                                                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Text("Others",
                                                                      style: robotoRegular
                                                                          .copyWith(
                                                                        color: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyLarge
                                                                            ?.color,
                                                                        fontSize:
                                                                            Dimensions.fontSizeDefault,
                                                                      )),
                                                                  Spacer(),
                                                                  //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: [
                                                        MaterialButton(
                                                            //height: 56,
                                                            color:
                                                                AppColors.red,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            onPressed: () {},
                                                            child: Text(
                                                              "Cancel Order",
                                                              style: robotoMedium.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeDefault),
                                                            )),
                                                      ],
                                                    ));
                                          },
                                          child: Text(
                                            "Cancel Order",
                                            style: robotoMedium.copyWith(
                                                fontSize:
                                                    Dimensions.fontSizeDefault),
                                          ))),
                                  Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: MaterialButton(
                                        //height: 56,
                                        color: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPressed: () {},
                                        child: Text(
                                          "Accept Order",
                                          style: robotoMedium.copyWith(
                                              color: Colors.white,
                                              fontSize:
                                                  Dimensions.fontSizeDefault),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CollapsedButton extends StatelessWidget {
  const CollapsedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).hintColor.withOpacity(0.1), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(8),
      child: Image.asset(Images.sidebarIcon, width: 20),
    );
  }
}

class PointWidget extends StatelessWidget {
  final Color statusColor;

  const PointWidget({super.key, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
      ),
      child: Container(
        decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
      ),
    );
  }
}

class StatusTitleWidget extends StatelessWidget {
  final String statusText;
  final String statusTime;

  const StatusTitleWidget(
      {super.key, required this.statusText, required this.statusTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(statusText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(statusTime,
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
