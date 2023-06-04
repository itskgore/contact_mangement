import 'package:contactmanage/core/error/failures.dart';
import 'package:contactmanage/features/dashboard/domain/model/contact_model.dart';
import 'package:dartz/dartz.dart';

abstract class ContactRepository {
  Future<Either<Failure, List<ContactModel>>> getContacts();
}
