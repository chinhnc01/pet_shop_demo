import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pet_shop/app_styles.dart';
import 'package:pet_shop/modules/order_list/order_list_controller.dart';
import 'package:pet_shop/widgets/base/base.dart';
import 'package:pet_shop/widgets/text_custom.dart';
import 'package:pet_shop/widgets/widgets.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);
  static const String routeName = '/order_list';
  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  OrderListController orderListController = Get.put(OrderListController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(
      context: context,
      body: _buildBody(),
      appBar: appBarCustom(
        title: 'Order List',
        leadingAppBar: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        isBorder: false,
        isPadding: true,
        marginTop: 0,
        bigTitle: true,
        isCenterTitle: true,
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: orderListController.obx(
        (state) => SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: orderListController.billList.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) => orderTicket(
                  name: orderListController.billList[index]!.userEmail ?? '',
                  orderId:
                      orderListController.billList[index]!.billId.toString(),
                  quantity: orderListController.billList[index]!.quantity ?? 0,
                  totalPrice:
                      orderListController.billList[index]!.billTotal ?? 0,
                  orderTime: DateFormat('HH:mm dd/MM/yyyy').format(
                    DateTime.fromMillisecondsSinceEpoch(
                      orderListController.billList[index]!.checkoutTime ?? 0,
                    ),
                  ),
                  status: orderListController.billList[index]!.status ?? '',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget orderTicket({
    required String name,
    required String orderId,
    required num totalPrice,
    required num quantity,
    required String orderTime,
    required String status,
  }) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            offset: const Offset(3, 2),
            blurRadius: 7,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBodyMedium(text: 'Order Id:'),
              textBodyMedium(
                text: '#$orderId',
                color: kOrange,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBodyMedium(text: 'Orderer\'s email:'),
              textBodyMedium(
                text: name,
                color: kOrange,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBodyMedium(text: 'Quantity:'),
              textBodyMedium(
                text: '$quantity',
                color: kOrange,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBodyMedium(text: 'Order time:'),
              textBodyMedium(
                text: orderTime,
                color: kOrange,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBodyMedium(text: 'Total price:'),
              textBodyMedium(
                text: '\$ $totalPrice',
                color: kOrange,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBodyMedium(text: 'Sattus:'),
              textBodyMedium(
                text: status,
                color: kOrange,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          const Divider(
            height: 32,
          ),
          // orderIem(
          //   image:
          //       'https://cdn.icon-icons.com/icons2/2468/PNG/512/user_kids_avatar_icon_149311.png',
          //   name: 'Adu',
          //   price: 120,
          //   quantity: 1,
          // ),
        ],
      ),
    );
  }

  Widget orderIem({
    required String image,
    required String name,
    required num price,
    required num quantity,
  }) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: 5,
          itemBuilder: (context, index) => Row(
            children: [
              SizedBox(
                height: 36,
                width: 36,
                child: Image.network(image),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textBodyMedium(text: name),
                    textBodyMedium(
                      text: '\$ $price',
                      color: kOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              textBodyLarge(
                text: 'x $quantity',
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
