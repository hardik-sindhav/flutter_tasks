import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/bloc/repos_bloc.dart';
import 'package:flutter_tasks/const/size.dart';
import 'package:flutter_tasks/helper/responsive_sizer.dart';
import 'package:flutter_tasks/view/error_view.dart';
import 'package:flutter_tasks/view/repos_list_view.dart';
import 'package:flutter_tasks/widgets/appbar_widget.dart';
import '../bloc/repos_events.dart';
import '../bloc/repos_state.dart';

class ReposPage extends StatefulWidget {
  final String user;
  const ReposPage({super.key, required this.user});

  @override
  State<ReposPage> createState() => _ReposPageState();
}

class _ReposPageState extends State<ReposPage> {
  @override
  void initState() {
    super.initState();
    context.read<ReposBloc>().add(FetchRepos(username: widget.user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: widget.user,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.ms(SizeClass.size10, context)),
        child: Column(
          children: [
            Expanded(child: BlocBuilder<ReposBloc, ReposState>(
              builder: (context, state) {
                if (state is ReposInitial) {
                } else if (state is ReposLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ReposLoaded) {
                  return ListView.builder(
                      itemCount: state.repos.length,
                      itemBuilder: (context, index) {
                        final user = state.repos[index];
                        return ReposListView(
                            index: index,
                            userName: user.name ?? '',
                            starCount: user.stargazersCount ?? 0,
                            userRepoUrl: user.htmlUrl ?? '');
                      });
                } else if (state is ReposError) {
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
