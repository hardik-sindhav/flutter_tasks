import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/bloc/search_bloc.dart';
import 'package:flutter_tasks/bloc/search_events.dart';
import 'package:flutter_tasks/const/size.dart';
import 'package:flutter_tasks/helper/responsive_sizer.dart';
import 'package:flutter_tasks/pages/search_page.dart';
import 'package:flutter_tasks/view/error_view.dart';
import 'package:flutter_tasks/view/user_view_list.dart';
import 'package:flutter_tasks/widgets/appbar_widget.dart';
import '../bloc/users_bloc.dart';
import '../bloc/users_events.dart';
import '../bloc/users_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchCRT = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(const FetchUser(username: "all"));
  }

  searchUsers(String query) {
    if (query.isEmpty) {
      context.read<UsersBloc>().add(const FetchUser(username: "all"));
    } else {
      context.read<SearchBloc>().add(const GetUser(username: ""));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Users",
        menuItem: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  )),
              icon: const Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.ms(SizeClass.size10, context)),
        child: Column(
          children: [
            Expanded(child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is UsersInitial) {
                } else if (state is UsersLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UsersLoaded) {
                  return ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final repo = state.users[index];

                        return UserViewList(
                          userName: repo.login ?? '',
                          userPic: repo.avatarUrl ?? '',
                        );
                      });
                } else if (state is UsersError) {
                  return const ErrorView("Something Went Wrong !",
                      isAnimationShow: true);
                }
                return Container();
              },
            )),
            SizedBox(height: Responsive.ms(SizeClass.size14, context)),
          ],
        ),
      ),
    );
  }
}
