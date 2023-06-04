import 'package:contactmanage/features/dashboard/presentation/cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    context.read<ContactCubit>().getContact();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Mangement"),
      ),
      body: BlocBuilder<ContactCubit, ContactState>(
        builder: (context, state) {
          if (state is ContactLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ContactLoaded) {
            _controller.forward();
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ContactCubit>().getContact();
              },
              child: ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final users = state.data[index];
                  return FadeTransition(
                    opacity: _animation,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${users.id}"),
                      ),
                      title: Text(
                        "${users.name}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${users.email}"),
                    ),
                  );
                },
              ),
            );
          } else if (state is ContactError) {
            return Center(
              child: GestureDetector(
                  onTap: () {
                    context.read<ContactCubit>().getContact();
                  },
                  child: Text("${state.error} Tap here to refresh again!")),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
