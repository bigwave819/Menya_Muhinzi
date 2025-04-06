import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:secondapp/data/products.dart';
import 'package:secondapp/widgets/product_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      hintText: "shakisha hano",
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(99)),
                      ),
                      prefixIcon: Icon(IconlyLight.search),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(IconlyLight.filter),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: 178,
              child: Card(
                color: Colors.green.shade50,
                elevation: 0.1,
                shadowColor: Colors.green.shade50,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Inama z'ubuntu",
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(color: Colors.green.shade700),
                            ),
                            Text("bona ubufasha kubu-\ntu kuri serivisi zacu"),
                            FilledButton(
                              onPressed: () {},
                              child: Text("Hamagara Ubu"),
                            ),
                          ],
                        ),
                      ),
                      Image.asset("images/call.webp", width: 148),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ibicuruzwa Byihariye",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(onPressed: () {}, child: const Text("See All")),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.99,
            ),
            itemBuilder: (context, index) {
              return ProductCard( product: products[index],);
            },
          ),
        ],
      ),
    );
  }
}
