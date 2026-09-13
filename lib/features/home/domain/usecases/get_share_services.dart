import '../entities/share_service.dart';
import '../repositories/home_repository.dart';

class GetShareServices {
  const GetShareServices(this._repository);

  final HomeRepository _repository;

  Future<List<ShareService>> call() => _repository.getShareServices();
}