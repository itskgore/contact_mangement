import 'package:contactmanage/dependency/dependency_injection.dart';
import 'package:contactmanage/features/dashboard/presentation/cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> providers = [
  BlocProvider<ContactCubit>(
    create: (BuildContext context) => locator<ContactCubit>(),
  ),
];
