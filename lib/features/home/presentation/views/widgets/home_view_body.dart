import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: const [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedListViewItem(),
                SizedBox(height: 36),
                Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
          // The list view for best sellers
          BestSellerListView(),
        ],
      ),
    );
  }
}
