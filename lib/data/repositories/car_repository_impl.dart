import 'package:rentcar_app/data/dataresources/firebase_car_data_source.dart';
import 'package:rentcar_app/data/models/car.dart';
import 'package:rentcar_app/data/models/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}