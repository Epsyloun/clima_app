import 'package:clima_app/utilities/const.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/corte1.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8), BlendMode.dstATop
            )
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: (){},
                      child: const Icon(Icons.location_city,
                      size: 50.0,
                      ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Text("32", style: kTempTextStyle),
                  Text("☀️", style: kConditionTextStyle),
                ],
              ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                    "Ta helao en la palma",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
