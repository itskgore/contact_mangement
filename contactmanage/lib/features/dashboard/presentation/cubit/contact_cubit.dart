import 'package:bloc/bloc.dart';
import 'package:contactmanage/core/usecase/usecase.dart';
import 'package:contactmanage/features/dashboard/domain/model/contact_model.dart';
import 'package:contactmanage/features/dashboard/domain/usecase/get_contact_usecase.dart';
import 'package:equatable/equatable.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final GetContactUsecase getContactUsecase;
  ContactCubit(this.getContactUsecase) : super(ContactInitial());

  getContact() {
    final result = getContactUsecase(NoParams());
    emit(ContactLoading());
    result.then((value) => value.fold(
        (l) => emit(ContactError(l.displayErrorMessage())),
        (r) => emit(ContactLoaded(r))));
  }
}
