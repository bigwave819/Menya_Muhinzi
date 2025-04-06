import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:secondapp/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Container(
                height: 190,
                width: 190,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/farmer.jpg"),
                  ),
                ),
              ),
              Spacer(),
              Text(
                "Ikaze Kuri Menya Muhinzi",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  "shaka ibicuruzwa byawe byubuhinzi byogukoresha mumurmo wawe. Urimo gukanda ugatwara ibicuruzwa byawe.",
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                icon: const Icon(IconlyLight.login),
                label: const Text("Komeza na google Google"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
