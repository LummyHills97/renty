import 'package:flutter/material.dart';
import 'package:rentcar_app/data/models/car.dart';
import 'package:rentcar_app/presentation/pages/MapDetailsPage.dart';
import 'package:rentcar_app/presentation/widgets/car_card.dart';
import 'package:rentcar_app/presentation/widgets/more_card.dart';

class CarDetailsPage extends StatefulWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // ✅ Properly dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.info_outlined),
            Text(' Information'),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(car: widget.car), // ✅ Fixed
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Oliver Dikuku',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$4,253',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapDetailsPage(car: widget.car), // ✅ Fixed
                        ),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/maps.png'), // ✅ Fixed missing image property
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation.value,
                          alignment: Alignment.center,
                          child: Image.asset('assets/maps.png', fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  car: Car(
                    model: '${widget.car.model}-1',
                    distance: widget.car.distance + 100,
                    fuelCapacity: widget.car.fuelCapacity + 100,
                    pricePerHour: widget.car.pricePerHour + 10,
                  ),
                ),
                const SizedBox(height: 5),
                MoreCard(
                  car: Car(
                    model: '${widget.car.model}-2',
                    distance: widget.car.distance + 200,
                    fuelCapacity: widget.car.fuelCapacity + 200,
                    pricePerHour: widget.car.pricePerHour + 20,
                  ),
                ),
                const SizedBox(height: 5),
                MoreCard(
                  car: Car(
                    model: '${widget.car.model}-3',
                    distance: widget.car.distance + 300,
                    fuelCapacity: widget.car.fuelCapacity + 300,
                    pricePerHour: widget.car.pricePerHour + 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
