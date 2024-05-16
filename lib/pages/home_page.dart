import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/const/size.dart';
import 'package:flutter_tasks/helper/responsive_sizer.dart';
import 'package:flutter_tasks/view/error_view.dart';
import 'package:flutter_tasks/view/user_view_list.dart';
import 'package:flutter_tasks/widgets/appbar_widget.dart';
import 'package:flutter_tasks/widgets/search_textfield.dart';
import '../bloc/users_bloc.dart';
import '../bloc/users_events.dart';
import '../bloc/users_state.dart';
import '../model/users_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(FetchUsers());
  }

  List<UsersModel> allUsers = [];
  List<UsersModel> users = [];

  searchUsers(String query) {
    if (query.isEmpty) {
      users = allUsers;
    }
    setState(() {
      users = users
          .where((user) => user.login!.toLowerCase().contains(query))
          .toList();
    });

    if (kDebugMode) {
      print(users.length);
    }
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Users",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.ms(SizeClass.size10, context)),
        child: Column(
          children: [
            SearchTextField(
              onChanged: (value) => searchUsers(value),
            ),
            SizedBox(height: Responsive.ms(SizeClass.size14, context)),
            Expanded(
              child: isLoading
                  ? BlocBuilder<UsersBloc, UsersState>(
                      builder: (context, state) {
                        if (state is UsersInitial) {
                        } else if (state is UsersLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is UsersLoaded) {
                          Future.delayed(
                            const Duration(milliseconds: 200),
                            () {
                              loadData(state.users);
                            },
                          );
                        } else if (state is UsersError) {
                          return const ErrorView("Something Went Wrong !",
                              isAnimationShow: true);
                        }
                        return Container();
                      },
                    )
                  : users.isNotEmpty
                      ? ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            return UserViewList(
                                userName: user.login ?? '',
                                userPic: user.avatarUrl ?? "");
                          },
                        )
                      : const ErrorView(
                          "No User Found !",
                          isAnimationShow: false,
                        ),
            ),
            SizedBox(height: Responsive.ms(SizeClass.size14, context)),
          ],
        ),
      ),
    );
  }

  void loadData(List<UsersModel> list) {
    setState(() {
      allUsers = list;
      users = list;
      isLoading = false;
    });
  }
}
