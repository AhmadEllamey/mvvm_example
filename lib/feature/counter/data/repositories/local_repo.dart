import '../data_source/local.dart';

class LocalDataRepository {
  LocalDataRepository({required this.localDataSource});

  final LocalDataSource localDataSource;


  Future<void> incrementCounter() async {
    localDataSource.incrementCounter();
  }

  Future<int> getCounter() async {
    return localDataSource.getCounter();
  }

}