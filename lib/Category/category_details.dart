import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Category/cubit/category_details_view_model.dart';
import 'package:news_app/Category/cubit/states.dart';
import 'package:news_app/model/category_dm.dart';
import '../Theme_Data.dart';
import '../tabs/tabs_widget.dart';
//ignore: must_be_immutable
class CategoryDetails extends StatefulWidget {
  static const String routeName = 'CategoryDetails';
  CategoryDM category;
  CategoryDetails({super.key, required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<CategoryDetailsViewModel, SourcesStates>(
        bloc: viewModel,
        builder: (BuildContext context, SourcesStates state) {
          if (state is SourceLoadingStates) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.primaryLightColor,
              ),
            );
          } else if (state is SourceErrorStates) {
            return Column(
              children: [
                Text(state.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                    viewModel.getSources(widget.category.id);
                    },
                    child: const Text('Try Again'))
              ],
            );
          }else if(state is SourceSuccessStates){
            return TabsWidget(sourecesList:state.sourcesList);
          }
          return Container(); // un reachable
        });

    // FutureBuilder<SourceResponse?>(future: ApiManager.getSources(widget.category.id),
    //           builder: (context,snapshot){
    //           if(snapshot.connectionState==ConnectionState.waiting){
    //             return Center(
    //               child: CircularProgressIndicator(
    //                 backgroundColor: MyTheme.primaryLightColor,
    //               ),
    //             );
    //
    //           }else if(snapshot.hasError){
    //             return Column(
    //               children: [
    //                 const Text('Something went wrong'),
    //                 ElevatedButton(onPressed: (){
    //                     ApiManager.getSources(widget.category.id);
    //                     setState(() {
    //
    //                     });
    //                 }, child: const Text('Try Again'))
    //               ],
    //             );
    //           }
    //           //server (success ,error)
    //             if(snapshot.data?.status!='ok'){
    //               return Column(
    //                 children: [
    //                    Text(snapshot.data?.message ?? 'Something went wrong'),
    //                   ElevatedButton(onPressed: (){
    //                     ApiManager.getSources(widget.category.id);
    //                     setState(() {
    //
    //                     });
    //                   }, child: const Text('Try Again'))
    //                 ],
    //               );
    //             }
    //             //success
    //           var sourcesList= snapshot.data?.sources??[];
    //             return TabsWidget(sourecesList:sourcesList);
    //           },
    //
    //     ),
    // );
  }
}
