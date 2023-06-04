import 'package:contactmanage/core/error/failures.dart';
import 'package:contactmanage/features/dashboard/data/datasource/remote_datasource.dart';
import 'package:contactmanage/features/dashboard/domain/model/contact_model.dart';
import 'package:contactmanage/features/dashboard/domain/repo/contact_repo.dart';
import 'package:dartz/dartz.dart';

class ContactRepositoryImp extends ContactRepository {
  final ContactDataSource contactDataSource;

  ContactRepositoryImp(this.contactDataSource);
  @override
  Future<Either<Failure, List<ContactModel>>> getContacts() async {
    try {
      final result = await contactDataSource.getContacts();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
