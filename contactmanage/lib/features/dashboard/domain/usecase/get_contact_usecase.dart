import 'package:contactmanage/core/error/failures.dart';
import 'package:contactmanage/core/usecase/usecase.dart';
import 'package:contactmanage/features/dashboard/domain/model/contact_model.dart';
import 'package:contactmanage/features/dashboard/domain/repo/contact_repo.dart';
import 'package:dartz/dartz.dart';

class GetContactUsecase extends UseCase<dynamic, NoParams> {
  final ContactRepository contactRepository;

  GetContactUsecase(this.contactRepository);
  @override
  Future<Either<Failure, List<ContactModel>>> call(NoParams params) {
    return contactRepository.getContacts();
  }
}
