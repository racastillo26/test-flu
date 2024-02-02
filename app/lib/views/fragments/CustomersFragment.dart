import 'package:app/data/remote/response/Status.dart';
import 'package:app/models/users/Users.dart';
import 'package:app/viewmodels/users/users_viewmodel.dart';
import 'package:app/views/pages/CustomerDetailsPage.dart';
import 'package:app/views/widgets/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerFragment extends StatefulWidget {
  final String id = "home_screen";

  const CustomerFragment({super.key});

  @override
  _CustomerFragment createState() => _CustomerFragment();
}

class _CustomerFragment extends State<CustomerFragment>
    with WidgetsBindingObserver {
  final Users_ViewModel viewModel = Users_ViewModel();

  @override
  void initState() {
    viewModel.Fet_Users();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<Users_ViewModel>.value(
        value: viewModel,
        child: Consumer<Users_ViewModel>(builder: (context, viewModel, _) {
          switch (viewModel.userMain.status) {
            case Status.LOADING:
              return const LoadingWidget();
            case Status.ERROR:
              return ErrorWidget(viewModel.userMain.message ?? "NA");
            case Status.COMPLETED:
              return _getMoviesListView(viewModel.userMain.data);
            default:
          }
          return Container();
        }),
      ),
    );
  }

  Widget _getMoviesListView(List<Users>? moviesList) {
    return ListView.builder(
        itemCount: moviesList?.length,
        itemBuilder: (context, position) {
          return _getMovieListItem(moviesList![position]);
        });
  }

  Widget _getMovieListItem(Users item) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(item.name ?? ""),
        subtitle: Text(item.email ?? ""),
        onTap: () {
          _sendDataToMovieDetailScreen(context, item);
        },
      ),
    );
  }

  void _sendDataToMovieDetailScreen(BuildContext context, Users item) {
    Navigator.pushNamed(context, CustomerDetailsPage.id, arguments: item);
  }
}
