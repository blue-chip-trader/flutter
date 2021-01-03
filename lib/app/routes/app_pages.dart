import 'package:bluechip/app/modules/messages/views/messages_view.dart';
import 'package:bluechip/app/modules/messages/bindings/messages_binding.dart';
import 'package:bluechip/app/modules/confirmdetails/views/confirmdetails_view.dart';
import 'package:bluechip/app/modules/confirmdetails/bindings/confirmdetails_binding.dart';
import 'package:bluechip/app/modules/otp/views/otp_view.dart';
import 'package:bluechip/app/modules/otp/bindings/otp_binding.dart';
import 'package:bluechip/app/modules/explore/views/explore_view.dart';
import 'package:bluechip/app/modules/explore/bindings/explore_binding.dart';
import 'package:bluechip/app/modules/auth/views/auth_view.dart';
import 'package:bluechip/app/modules/auth/bindings/auth_binding.dart';
import 'package:bluechip/app/modules/article/views/article_view.dart';
import 'package:bluechip/app/modules/article/bindings/article_binding.dart';
import 'package:bluechip/app/modules/search/views/search_view.dart';
import 'package:bluechip/app/modules/search/bindings/search_binding.dart';
import 'package:bluechip/app/modules/login/views/login_view.dart';
import 'package:bluechip/app/modules/login/bindings/login_binding.dart';
import 'package:bluechip/app/modules/signals/views/signals_view.dart';
import 'package:bluechip/app/modules/signals/bindings/signals_binding.dart';
import 'package:bluechip/app/modules/settings_terms/views/settings_terms_view.dart';
import 'package:bluechip/app/modules/settings_terms/bindings/settings_terms_binding.dart';
import 'package:bluechip/app/modules/settings_faqs/views/settings_faqs_view.dart';
import 'package:bluechip/app/modules/settings_faqs/bindings/settings_faqs_binding.dart';
import 'package:bluechip/app/modules/settings_support/views/settings_support_view.dart';
import 'package:bluechip/app/modules/settings_support/bindings/settings_support_binding.dart';
import 'package:bluechip/app/modules/settings_about/views/settings_about_view.dart';
import 'package:bluechip/app/modules/settings_about/bindings/settings_about_binding.dart';
import 'package:bluechip/app/modules/settings_books/views/settings_books_view.dart';
import 'package:bluechip/app/modules/settings_books/bindings/settings_books_binding.dart';
import 'package:bluechip/app/modules/settings_howitworks/views/settings_howitworks_view.dart';
import 'package:bluechip/app/modules/settings_howitworks/bindings/settings_howitworks_binding.dart';
import 'package:bluechip/app/modules/settings_theme/views/settings_theme_view.dart';
import 'package:bluechip/app/modules/settings_theme/bindings/settings_theme_binding.dart';
import 'package:bluechip/app/modules/settings_notifications/views/settings_notifications_view.dart';
import 'package:bluechip/app/modules/settings_notifications/bindings/settings_notifications_binding.dart';
import 'package:bluechip/app/modules/settings_subscription/views/settings_subscription_view.dart';
import 'package:bluechip/app/modules/settings_subscription/bindings/settings_subscription_binding.dart';
import 'package:bluechip/app/modules/settings_phone/views/settings_phone_view.dart';
import 'package:bluechip/app/modules/settings_phone/bindings/settings_phone_binding.dart';
import 'package:bluechip/app/modules/settings_email/views/settings_email_view.dart';
import 'package:bluechip/app/modules/settings_email/bindings/settings_email_binding.dart';
import 'package:bluechip/app/modules/settings_profile/views/settings_profile_view.dart';
import 'package:bluechip/app/modules/settings_profile/bindings/settings_profile_binding.dart';
import 'package:bluechip/app/modules/notifications/views/notifications_view.dart';
import 'package:bluechip/app/modules/notifications/bindings/notifications_binding.dart';
import 'package:bluechip/app/modules/signal/views/signal_view.dart';
import 'package:bluechip/app/modules/signal/bindings/signal_binding.dart';
import 'package:bluechip/app/modules/signals_history/views/signals_history_view.dart';
import 'package:bluechip/app/modules/signals_history/bindings/signals_history_binding.dart';
import 'package:bluechip/app/modules/signals_active/views/signals_active_view.dart';
import 'package:bluechip/app/modules/signals_active/bindings/signals_active_binding.dart';
import 'package:bluechip/app/modules/calendar/views/calendar_view.dart';
import 'package:bluechip/app/modules/calendar/bindings/calendar_binding.dart';
import 'package:bluechip/app/modules/news/views/news_view.dart';
import 'package:bluechip/app/modules/news/bindings/news_binding.dart';
import 'package:bluechip/app/modules/profile/views/profile_view.dart';
import 'package:bluechip/app/modules/profile/bindings/profile_binding.dart';
import 'package:bluechip/app/modules/home/home_view.dart';
import 'package:bluechip/app/modules/home/home_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.CONFIRMDETAILS;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.NEWS,
      page: () => NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: Routes.CALENDAR,
      page: () => CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: Routes.SIGNALS_ACTIVE,
      page: () => SignalsActiveView(),
      binding: SignalsActiveBinding(),
    ),
    GetPage(
      name: Routes.SIGNALS_HISTORY,
      page: () => SignalsHistoryView(),
      binding: SignalsHistoryBinding(),
    ),
    GetPage(
      name: Routes.SIGNAL,
      page: () => SignalView(),
      binding: SignalBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_PROFILE,
      page: () => SettingsProfileView(),
      binding: SettingsProfileBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_EMAIL,
      page: () => SettingsEmailView(),
      binding: SettingsEmailBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_PHONE,
      page: () => SettingsPhoneView(),
      binding: SettingsPhoneBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_SUBSCRIPTION,
      page: () => SettingsSubscriptionView(),
      binding: SettingsSubscriptionBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_NOTIFICATIONS,
      page: () => SettingsNotificationsView(),
      binding: SettingsNotificationsBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_THEME,
      page: () => SettingsThemeView(),
      binding: SettingsThemeBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_HOWITWORKS,
      page: () => SettingsHowitworksView(),
      binding: SettingsHowitworksBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_BOOKS,
      page: () => SettingsBooksView(),
      binding: SettingsBooksBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_ABOUT,
      page: () => SettingsAboutView(),
      binding: SettingsAboutBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_SUPPORT,
      page: () => SettingsSupportView(),
      binding: SettingsSupportBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_FAQS,
      page: () => SettingsFaqsView(),
      binding: SettingsFaqsBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_TERMS,
      page: () => SettingsTermsView(),
      binding: SettingsTermsBinding(),
    ),
    GetPage(
      name: Routes.SIGNALS,
      page: () => SignalsView(),
      binding: SignalsBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.ARTICLE,
      page: () => ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: Routes.AUTH, 
      page:()=> AuthView(), 
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.EXPLORE, 
      page:()=> ExploreView(), 
      binding: ExploreBinding(),
    ),
    GetPage(
      name: Routes.OTP, 
      page:()=> OtpView(), 
      binding: OtpBinding(),
    ),
    GetPage(
      name: Routes.CONFIRMDETAILS, 
      page:()=> ConfirmdetailsView(), 
      binding: ConfirmdetailsBinding(),
    ),
    GetPage(
      name: Routes.MESSAGES, 
      page:()=> MessagesView(), 
      binding: MessagesBinding(),
    ),
  ];
}