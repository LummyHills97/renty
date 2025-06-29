import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentcar_app/data/models/car.dart';
import 'package:rentcar_app/presentation/bloc/car_bloc.dart';
import 'package:rentcar_app/presentation/bloc/car_state.dart';
import 'package:rentcar_app/presentation/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});
  final List<Car> cars= [
    Car(model: 'Fortuner GR', distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Fortuner GR', distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Fortuner GR', distance: 870, fuelCapacity: 50, pricePerHour: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose your preferred Car' ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state){
          if(state is CarsLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index){
                return CarCard(car: state.cars[index]);
              },
            );
          }
          else if(state is CarsError) {
            return Center(child: Text('error : ${state.message}'),);
          }
          return Container();
        },
      ),
    );
  }
}