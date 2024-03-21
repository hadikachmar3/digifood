import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_colors.dart';
import '../models/product_model.dart';
import '../screens/product_details.dart';
import '../state/cart_provider.dart';
import '../utils/navigator.dart';

class ProductWidget extends ConsumerWidget {
  final Product product;

  const ProductWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    bool isInCart = cart.containsKey(product);
    final navigationService = NavigationService.instance;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            navigationService.navigate(
              ProductDetails(product: product),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Hero(
                    tag: product.id,
                    child: FancyShimmerImage(
                      width: double.infinity,
                      imageUrl: product.images[0],
                      boxFit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '\$',
                        style: const TextStyle(
                          color: Color.fromRGBO(33, 150, 243, 1),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: product.price.toString(),
                            style: TextStyle(
                              color: AppColors.lightTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: isInCart
                          ? null
                          : () {
                              ref
                                  .read(cartProvider.notifier)
                                  .addToCart(product);
                            },
                      icon: Icon(
                        isInCart
                            ? Icons.check_circle_outline_outlined
                            : Icons.add_shopping_cart,
                        size: 16,
                      ),
                    ),
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
