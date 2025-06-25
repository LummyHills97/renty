import 'package:rentcar_app/data/models/car.dart';
import 'package:rentcar_app/data/models/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}