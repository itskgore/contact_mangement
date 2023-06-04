part of 'contact_cubit.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {
  final List<ContactModel> data;

  const ContactLoaded(this.data);
}

class ContactError extends ContactState {
  final String error;

  const ContactError(this.error);
}
