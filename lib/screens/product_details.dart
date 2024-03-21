import 'package:card_swiper/card_swiper.dart';
import 'package:digifood_app/models/product_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../widgets/texts/text_w600.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const TextW600(
                          label: 'Category: ',
                        ),
                        Text(
                          widget.product.category.toString(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: TextW600(
                            label: widget.product.title.toString(),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const Spacer(),
                        Flexible(
                          flex: 1,
                          child: RichText(
                            text: TextSpan(
                                text: '\$',
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Color.fromRGBO(33, 150, 243, 1)),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: widget.product.price.toString(),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
              widget.product.images.length == 1
                  ? Hero(
                      tag: widget.product.id,
                      child: FancyShimmerImage(
                        // height: size.height * 0.2,
                        width: double.infinity,
                        imageUrl: widget.product.images[0].toString(),
                        boxFit: BoxFit.fill,
                      ),
                    )
                  : SizedBox(
                      height: size.height * 0.4,
                      child: Hero(
                        tag: widget.product.id,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return FancyShimmerImage(
                              // height: size.height * 0.2,
                              width: double.infinity,
                              imageUrl: widget.product.images[index].toString(),
                              boxFit: BoxFit.cover,
                            );
                          },
                          // viewportFraction: 0.99,
                          // indicatorLayout: PageIndicatorLayout.COLOR,
                          autoplay: true,
                          itemCount: widget.product.images.length,
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: Colors.red,
                            ),
                          ),
                          // control: const SwiperControl(),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextW600(label: 'Description'),
                    const SizedBox(),
                    Text(
                      widget.product.description.toString(),
                      style: const TextStyle(fontSize: 25),
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
