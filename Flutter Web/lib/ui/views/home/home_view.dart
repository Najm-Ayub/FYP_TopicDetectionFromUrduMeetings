import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import 'package:topicdetectionweb/ui/common/app_strings.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:topicdetectionweb/ui/views/dashborad/dashborad_view.dart';
import 'package:topicdetectionweb/ui/views/historypage/Project_view.dart';
import 'package:topicdetectionweb/ui/views/home/home_viewmodel.dart';
import 'package:topicdetectionweb/ui/views/home/widgets/create_project.dart';
import 'package:topicdetectionweb/ui/widgets/common/sidebarx_widget/sidebarx_widget.dart';
import '../privacy_policy/privacy_policy_view.dart';
import '../setting/settingBody.dart';
import 'widgets/uploadfile.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);
  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchUserDisplayName();
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Image(image: AssetImage(logopic)),
            
          ),
          leadingWidth: 310,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Row(
                children: [
                  Tooltip(
                    message: viewModel.userName ?? 'Guest User',
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundColor: kcpurpleColor,
                        child: Text(
                          viewModel.userName?.isNotEmpty == true
                              ? viewModel.userName![0].toUpperCase()
                              : 'G',
                          style:
                              const TextStyle(color: kcVeryLightGrey, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                    Text(viewModel.userName!,  style:
                              const TextStyle(color: kcVeryLightGrey, fontSize: 18),)
                ],
              ),
            ),
          
          ],
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 202, 163, 253),
        ),
        key: viewModel.key,
        body: Stack(children: [
          Container(
            height: screenHeight(context),
            width: screenWidth(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(newbackground), fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 150, top: 10, right: 10),
              child: Container(
                height: screenHeight(context) * 0.8,
                width: screenWidth(context) * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kcVeryLightGrey.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Row(
            children: [
              SidebarxWidget(controller: viewModel.controller),
              AnimatedBuilder(
                animation: viewModel.controller,
                builder: (context, child) {
                  switch (viewModel.controller.selectedIndex) {
                    case 0:
                      return DashboradView(homeViewModel: viewModel);
                    //return const CreateProject();
                    //return HomePageShowView(homeViewModel: viewModel);
                    case 1:
                      return const SettingBodyView();
                    //return HistorypageView(homeViewModel: viewModel);
                    case 2:
                      return PrivacyPolicyView();
                    // viewModel.logout();
                    //return Container();
                    case 3:
                      viewModel.logout();
                      return Container();

                    case 4:
                      return const CreateProject(
                        heading: "Create Project",
                      );
                    case 5:
                      return const CreateProject(
                        heading: "Edit Project",
                      );
                    case 6:
                      return Uploadfile(
                        projectname: viewModel.projectctrl.text,
                      );
                    case 7:
                      return HistorypageView(homeViewModel: viewModel);

                    default:
                      return Container();
                  }
                },
              ),
            ],
          ),
        ]),
      );
    });
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
