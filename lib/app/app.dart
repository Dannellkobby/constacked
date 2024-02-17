import 'package:constacked/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:constacked/ui/views/contact_list/contact_list_view.dart';
import 'package:constacked/services/contacts_service.dart';
import 'package:constacked/ui/bottom_sheets/add_contact/add_contact_sheet.dart';
import 'package:constacked/ui/views/contact_details/contact_details_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ContactListView),
    MaterialRoute(page: ContactDetailsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ContactsService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: AddContactSheet),
// @stacked-bottom-sheet
  ],)
class App {}
