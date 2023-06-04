import 'package:contactmanage/core/error/failures.dart';
import 'package:contactmanage/features/dashboard/domain/model/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ContactDataSource {
  Future<List<ContactModel>> getContacts();
}

class ContactDataSourceImp extends ContactDataSource {
  @override
  Future<List<ContactModel>> getContacts() async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      final result = await hanldeStatusCode(response);
      if (result.status) {
        final List<ContactModel> contact = [];
        response.data.forEach((e) {
          contact.add(ContactModel.fromJson(e));
        });
        return contact;
      } else {
        throw result.failure ?? ServerFailure();
      }
    } catch (e) {
      throw handleThrownException(e);
    }
  }
}
