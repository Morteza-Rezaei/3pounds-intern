import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/features/tracking/presentation/widgets/order_card.dart';
import 'package:food_delivery/shared/widgets/back_button.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackBtn(),
          title: const Text('My Orders'),
          bottom: TabBar(
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: 'Ongoing'),
              Tab(text: 'History'),
            ],

            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),

            indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
          ),
        ),
        body: const TabBarView(
          children: [OngoingOrdersView(), OrderHistoryView()],
        ),
      ),
    );
  }
}

class OngoingOrdersView extends StatelessWidget {
  const OngoingOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.r),
      children: [
        OrderCard.ongoing(
          type: 'Food',
          imageUrl: AppPaths.pizzaFood,
          title: 'Pizza Hut',
          price: 35.25,
          items: 1,
          orderId: '#162432',
        ),
        OrderCard.ongoing(
          type: 'Food',
          imageUrl: AppPaths.burgerFood,
          title: 'Burger Food',
          price: 40.15,
          items: 2,
          orderId: '#242432',
        ),
        OrderCard.ongoing(
          type: 'Drink',
          imageUrl: AppPaths.beefTaco,
          title: 'Beef Taco',
          price: 10.20,
          items: 1,
          orderId: '#240112',
        ),
      ],
    );
  }
}

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.r),
      children: [
        OrderCard.history(
          type: 'Food',
          imageUrl: AppPaths.pizzaFood,
          title: 'Pizza Hut',
          price: 35.25,
          items: 1,
          orderId: '#162432',
          status: OrderStatus.completed,
          date: '29 JAN, 12:30',
        ),
        OrderCard.history(
          type: 'Food',
          imageUrl: AppPaths.burgerFood,
          title: 'Burger Food',
          price: 40.15,
          items: 2,
          orderId: '#242432',
          status: OrderStatus.completed,
          date: '30 JAN, 12:30',
        ),
        OrderCard.history(
          type: 'Drink',
          imageUrl: AppPaths.beefTaco,
          title: 'Beef Taco',
          price: 10.20,
          items: 1,
          orderId: '#240112',
          status: OrderStatus.cancelled,
          date: '30 JAN, 12:30',
        ),
      ],
    );
  }
}
