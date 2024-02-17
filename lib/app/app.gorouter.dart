import 'package:constacked/ui/common/app_keys.dart';
import 'package:constacked/ui/views/contact_details/contact_details_view.dart';
import 'package:constacked/ui/views/contact_list/contact_list_view.dart';
import 'package:constacked/ui/views/startup/startup_view.dart';
import 'package:go_router/go_router.dart';

// Define route paths as constants for readability and maintainability.
const String krRoot = '/';
const String krContacts = '/contacts';
const String krContactDetails = '/contacts/:$kkContactId';

// Create the GoRouter instance for navigation.
final router = GoRouter(
  routes: [
    // Route for the root path, building the StartupView.
    GoRoute(
      path: krRoot,
      builder: (context, state) => const StartupView(),
    ),
    // Route for the contacts list, building the ContactListView.
    GoRoute(
      path: krContacts,
      builder: (context, state) => const ContactListView(),
    ),
    // Route for contact details, extracting the contact ID from path parameters.
    GoRoute(
      name: krContacts, // Name for potential deep linking.
      path: krContactDetails,
      builder: (context, state) {
        final id = state.pathParameters[kkContactId];
        return ContactDetailsView(id: id);
      },
    ),
  ],
);
