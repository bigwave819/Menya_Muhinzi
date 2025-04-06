import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/data/products.dart';
import '../models/product.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool showMore = false;
  late TapGestureRecognizer readMoreGestureRecognizer;

  @override
  void initState() {
    readMoreGestureRecognizer =
        TapGestureRecognizer()
          ..onTap = () {
            setState(() {
              showMore = !showMore;
            });
          };
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    readMoreGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Details"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(IconlyBroken.bookmark)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            height: 250,
            margin: EdgeInsets.only(bottom: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.product.image),
              ),
            ),
          ),
          Text(
            widget.product.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ibiboneka mububiko",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "frw ${widget.product.price}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.star, size: 16, color: Colors.yellow.shade600),
              Text("${widget.product.rating}"),
              const Spacer(),
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filled(
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                  onPressed: () {},
                  icon: Icon(Icons.remove),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text("12"),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filled(
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "ibisobanuro",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text:
                      showMore
                          ? widget.product.description
                          : "${widget.product.description.substring(0, widget.product.description.length - 100)} ...",
                ),
                TextSpan(
                  recognizer: readMoreGestureRecognizer,
                  text: showMore ? " Soma Bike" : "Soma Byinshi",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            "ibicuruzwa bifitanye isano",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 90,
            child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: 90,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage((products[index].image))
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: products.length,
          ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(7),
            child: FilledButton.icon(
            onPressed: () {}, 
            label: const Text("Ongera ku Ikarita"),
            icon: Icon(IconlyLight.bag),
          ),
          )
        ],
      ),
    );
  }
}
