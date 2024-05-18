import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/bloc/search_bloc.dart';
import 'package:flutter_tasks/bloc/search_events.dart';
import 'package:flutter_tasks/bloc/search_state.dart';
import 'package:flutter_tasks/const/size.dart';
import 'package:flutter_tasks/helper/responsive_sizer.dart';
import 'package:flutter_tasks/view/error_view.dart';
import 'package:flutter_tasks/view/user_view_list.dart';
import 'package:flutter_tasks/widgets/appbar_widget.dart';
import 'package:flutter_tasks/widgets/search_textfield.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchCRT = TextEditingController();

  bool isSearch = false;
  bool isSearching = false;

  searchUsers(String query) {
    if (query.isEmpty) {
      setState(() {
        isSearch = false;
      });
    } else {
      if (isSearching == false) {
        context.read<SearchBloc>().add(GetUser(username: query));
        setState(() {
          isSearch = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: " Search Users",
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.ms(SizeClass.size10, context)),
        child: Column(
          children: [
            SearchTextField(
              textEditingController: searchCRT,
              onChanged: (value) => searchUsers(value),
            ),
            SizedBox(height: Responsive.ms(SizeClass.size10, context)),
            searchCRT.text.isEmpty
                ? const Expanded(
                    child: ErrorView("Search User", isAnimationShow: false))
                : Expanded(child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SearchInitial) {
                      } else if (state is SearchLoading) {
                        Future.delayed(const Duration(milliseconds: 20),
                            () => setLoader(true));
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SearchLoaded) {
                        Future.delayed(const Duration(milliseconds: 20),
                            () => setLoader(false));
                        return state.search.isNotEmpty
                            ? ListView.builder(
                                itemCount: state.search.length,
                                itemBuilder: (context, index) {
                                  final repo = state.search[index];
                                  return UserViewList(
                                    userName: repo.login ?? '',
                                    userPic: repo.avatarUrl ?? '',
                                  );
                                })
                            : const ErrorView("No User Found !",
                                isAnimationShow: false);
                      } else if (state is SearchError) {
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

  setLoader(bool value) {
    setState(() {
      isSearch = value;
    });
  }
}
