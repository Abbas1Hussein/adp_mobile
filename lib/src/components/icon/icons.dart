import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/common/adaptive.dart';

enum AdpIcons {
  add(
    iICON: CupertinoIcons.add,
    aICON: Icons.add,
  ),
  addCircle(
    aICON: Icons.add_circle_outline,
    iICON: CupertinoIcons.add_circled,
  ),
  addCircleFilled(
    aICON: Icons.add_circle,
    iICON: CupertinoIcons.add_circled_solid,
  ),
  airplane(
    aICON: Icons.airplanemode_active,
    iICON: CupertinoIcons.airplane,
  ),
  alarm(
    aICON: Icons.alarm_outlined,
    iICON: CupertinoIcons.alarm,
  ),
  alarmFilled(
    aICON: Icons.alarm,
    iICON: CupertinoIcons.alarm_fill,
  ),
  app(
    aICON: Icons.apps,
    iICON: CupertinoIcons.app,
  ),
  archive(
    aICON: Icons.archive_outlined,
    iICON: CupertinoIcons.archivebox,
  ),
  archiveFilled(
    aICON: Icons.archive,
    iICON: CupertinoIcons.archivebox_fill,
  ),
  arrowDown(
    aICON: Icons.arrow_downward,
    iICON: CupertinoIcons.arrow_down,
  ),
  arrowLeft(
    aICON: Icons.arrow_back,
    iICON: CupertinoIcons.arrow_left,
  ),
  arrowRight(
    aICON: Icons.arrow_forward,
    iICON: CupertinoIcons.arrow_right,
  ),
  arrowUp(
    aICON: Icons.arrow_upward,
    iICON: CupertinoIcons.arrow_up,
  ),
  arrowDownCircle(
    aICON: Icons.arrow_circle_down_outlined,
    iICON: CupertinoIcons.arrow_down_circle,
  ),
  arrowLeftCircle(
    aICON: Icons.arrow_circle_left_outlined,
    iICON: CupertinoIcons.arrow_left_circle,
  ),
  arrowRightCircle(
    aICON: Icons.arrow_circle_right_outlined,
    iICON: CupertinoIcons.arrow_right_circle,
  ),
  arrowUpCircle(
    aICON: Icons.arrow_circle_up_outlined,
    iICON: CupertinoIcons.arrow_up_circle,
  ),
  arrowDownCircleFilled(
    aICON: Icons.arrow_circle_down,
    iICON: CupertinoIcons.arrow_down_circle_fill,
  ),
  arrowLeftCircleFilled(
    aICON: Icons.arrow_circle_left,
    iICON: CupertinoIcons.arrow_left_circle_fill,
  ),
  arrowRightCircleFilled(
    aICON: Icons.arrow_circle_right,
    iICON: CupertinoIcons.arrow_right_circle_fill,
  ),
  arrowUpCircleFilled(
    aICON: Icons.arrow_circle_up,
    iICON: CupertinoIcons.arrow_up_circle_fill,
  ),
  atMark(
    aICON: Icons.alternate_email_outlined,
    iICON: CupertinoIcons.at,
  ),
  bag(
    aICON: Icons.shopping_bag_outlined,
    iICON: CupertinoIcons.bag,
  ),
  bagFilled(
    aICON: Icons.shopping_bag,
    iICON: CupertinoIcons.bag_fill,
  ),
  addToBag(
    aICON: Icons.add_shopping_cart_outlined,
    iICON: CupertinoIcons.bag_badge_plus,
  ),
  addToBagFilled(
    aICON: Icons.add_shopping_cart,
    iICON: CupertinoIcons.bag_fill_badge_plus,
  ),
  barcodeScanner(
    aICON: Icons.barcode_reader,
    iICON: CupertinoIcons.barcode_viewfinder,
  ),
  battery0(
    aICON: Icons.battery_0_bar,
    iICON: CupertinoIcons.battery_0,
  ),
  battery25(
    aICON: Icons.battery_2_bar,
    iICON: CupertinoIcons.battery_25,
  ),
  battery75(
    aICON: Icons.battery_5_bar,
    iICON: CupertinoIcons.battery_75_percent,
  ),
  battery100(
    aICON: Icons.battery_full,
    iICON: CupertinoIcons.battery_full,
  ),
  batteryCharge(
    aICON: Icons.battery_charging_full,
    iICON: CupertinoIcons.battery_charging,
  ),
  bed(
    aICON: Icons.bed_outlined,
    iICON: CupertinoIcons.bed_double,
  ),
  bedFilled(
    aICON: Icons.bed,
    iICON: CupertinoIcons.bed_double_fill,
  ),
  bolt(
    aICON: Icons.bolt_outlined,
    iICON: CupertinoIcons.bolt_fill,
  ),
  bluetooth(
    aICON: Icons.bluetooth_outlined,
    iICON: CupertinoIcons.bluetooth,
  ),
  bluetoothConnected(
    aICON: Icons.bluetooth_connected_outlined,
    iICON: CupertinoIcons.bluetooth,
  ),
  bluetoothDisabled(
    aICON: Icons.bluetooth_disabled_outlined,
    iICON: CupertinoIcons.bluetooth,
  ),
  book(
    aICON: Icons.menu_book_outlined,
    iICON: CupertinoIcons.book,
  ),
  bookFilled(
    aICON: Icons.menu_book,
    iICON: CupertinoIcons.book_fill,
  ),
  bookmark(
    aICON: Icons.bookmark_outline,
    iICON: CupertinoIcons.bookmark,
  ),
  bookmarkFilled(
    aICON: Icons.bookmark,
    iICON: CupertinoIcons.bookmark_fill,
  ),
  bookmarkAdd(
    aICON: Icons.bookmark_add_outlined,
    iICON: CupertinoIcons.bookmark,
  ),
  bookmarkAddFilled(
    aICON: Icons.bookmark_add,
    iICON: CupertinoIcons.bookmark_fill,
  ),
  bookmarkRemove(
    aICON: Icons.bookmark_remove_outlined,
    iICON: CupertinoIcons.bookmark,
  ),
  briefcase(
    aICON: Icons.work_outline,
    iICON: CupertinoIcons.briefcase,
  ),
  calendar(
    aICON: Icons.calendar_month_outlined,
    iICON: CupertinoIcons.calendar,
  ),
  calendarFilled(
    aICON: Icons.calendar_month,
    iICON: CupertinoIcons.calendar,
  ),
  calendarAdd(
    aICON: Icons.event_outlined,
    iICON: CupertinoIcons.calendar_badge_plus,
  ),
  calendarAddFilled(
    aICON: Icons.event,
    iICON: CupertinoIcons.calendar_badge_plus,
  ),
  calenderRemove(
    aICON: Icons.event_busy_outlined,
    iICON: CupertinoIcons.calendar_badge_minus,
  ),
  camera(
    aICON: Icons.camera_alt_outlined,
    iICON: CupertinoIcons.camera,
  ),
  cameraFilled(
    aICON: Icons.camera_alt,
    iICON: CupertinoIcons.camera_fill,
  ),
  cameraSwitch(
    aICON: Icons.switch_camera_outlined,
    iICON: CupertinoIcons.switch_camera,
  ),
  cameraSwitchFilled(
    aICON: Icons.switch_camera,
    iICON: CupertinoIcons.switch_camera,
  ),
  calenderRemoveFilled(
    aICON: Icons.event_busy,
    iICON: CupertinoIcons.calendar_badge_minus,
  ),
  capslock(
    aICON: Icons.keyboard_capslock_outlined,
    iICON: CupertinoIcons.capslock,
  ),
  capslockFilled(
    aICON: Icons.keyboard_capslock,
    iICON: CupertinoIcons.capslock_fill,
  ),
  car(
    aICON: Icons.directions_car_outlined,
    iICON: CupertinoIcons.car_detailed,
  ),
  carFilled(
    aICON: Icons.directions_car,
    iICON: CupertinoIcons.car_detailed,
  ),
  cart(
    aICON: Icons.shopping_cart_outlined,
    iICON: CupertinoIcons.cart,
  ),
  cartFilled(
    aICON: Icons.shopping_cart,
    iICON: CupertinoIcons.cart_fill,
  ),
  cartAdd(
    aICON: Icons.add_shopping_cart_outlined,
    iICON: CupertinoIcons.cart_badge_plus,
  ),
  cartRemove(
    aICON: Icons.remove_shopping_cart_outlined,
    iICON: CupertinoIcons.cart_badge_minus,
  ),
  chartBar(
    aICON: Icons.bar_chart_outlined,
    iICON: CupertinoIcons.chart_bar,
  ),
  chartBarFilled(
    aICON: Icons.bar_chart,
    iICON: CupertinoIcons.chart_bar_fill,
  ),
  chartPie(
    aICON: Icons.pie_chart_outline,
    iICON: CupertinoIcons.chart_pie,
  ),
  chartPieFilled(
    aICON: Icons.pie_chart,
    iICON: CupertinoIcons.chart_pie_fill,
  ),
  chartLine(
    aICON: Icons.ssid_chart,
    iICON: Icons.ssid_chart,
  ),
  chartBubble(
    aICON: Icons.bubble_chart_outlined,
    iICON: Icons.bubble_chart_outlined,
  ),
  bug(
    aICON: Icons.bug_report_outlined,
    iICON: CupertinoIcons.ant,
  ),
  bugFilled(
    aICON: Icons.bug_report,
    iICON: CupertinoIcons.ant_fill,
  ),
  chatBubble(
    aICON: Icons.chat_bubble_outline,
    iICON: CupertinoIcons.chat_bubble,
  ),
  chatBubbleFilled(
    aICON: Icons.chat_bubble,
    iICON: CupertinoIcons.chat_bubble_fill,
  ),
  chatBubbleAdd(
    aICON: Icons.add_comment_outlined,
    iICON: CupertinoIcons.chat_bubble_text,
  ),
  checkMark(
    aICON: Icons.check_outlined,
    iICON: CupertinoIcons.check_mark,
  ),
  checkMarkCircle(
    aICON: Icons.check_circle_outline,
    iICON: CupertinoIcons.checkmark_circle,
  ),
  checkMarkCircleFilled(
    aICON: Icons.check_circle,
    iICON: CupertinoIcons.checkmark_circle_fill,
  ),
  checkMarkShield(
    aICON: Icons.verified_user_outlined,
    iICON: CupertinoIcons.checkmark_shield,
  ),
  checkMarkShieldFilled(
    aICON: Icons.verified_user,
    iICON: CupertinoIcons.checkmark_shield_fill,
  ),
  checkBoxEmpty(
    aICON: Icons.check_box_outline_blank_outlined,
    iICON: CupertinoIcons.square,
  ),
  checkBoxChecked(
    aICON: Icons.check_box_outlined,
    iICON: CupertinoIcons.checkmark_square,
  ),
  checkBoxCheckedFilled(
    aICON: Icons.check_box,
    iICON: CupertinoIcons.checkmark_square_fill,
  ),
  checkBoxIndeterminate(
    aICON: Icons.indeterminate_check_box_outlined,
    iICON: CupertinoIcons.minus_square,
  ),
  circle(
    aICON: Icons.circle_outlined,
    iICON: CupertinoIcons.circle,
  ),
  circleFilled(
    aICON: Icons.circle,
    iICON: CupertinoIcons.circle_fill,
  ),
  circleHalf(
    aICON: Icons.contrast,
    iICON: CupertinoIcons.circle_lefthalf_fill,
  ),
  clear(
    aICON: Icons.clear_outlined,
    iICON: CupertinoIcons.clear,
  ),
  grid(
    aICON: Icons.grid_view_outlined,
    iICON: CupertinoIcons.square_grid_2x2,
  ),
  gridFilled(
    aICON: Icons.grid_view,
    iICON: CupertinoIcons.square_grid_2x2_fill,
  ),
  clock(
    aICON: Icons.access_time_outlined,
    iICON: CupertinoIcons.clock,
  ),
  clockFilled(
    aICON: Icons.access_time,
    iICON: CupertinoIcons.clock_fill,
  ),
  cloud(
    aICON: Icons.cloud_outlined,
    iICON: CupertinoIcons.cloud,
  ),
  cloudFilled(
    aICON: Icons.cloud,
    iICON: CupertinoIcons.cloud_fill,
  ),
  cloudDownload(
    aICON: Icons.cloud_download_outlined,
    iICON: CupertinoIcons.cloud_download,
  ),
  cloudDownloadFilled(
    aICON: Icons.cloud_download,
    iICON: CupertinoIcons.cloud_download_fill,
  ),
  cloudUpload(
    aICON: Icons.cloud_upload_outlined,
    iICON: CupertinoIcons.cloud_upload,
  ),
  cloudUploadFilled(
    aICON: Icons.cloud_upload,
    iICON: CupertinoIcons.cloud_upload_fill,
  ),
  cloudSync(
    aICON: Icons.sync_outlined,
    iICON: CupertinoIcons.arrow_clockwise_circle,
  ),
  cloudSyncFilled(
    aICON: Icons.sync,
    iICON: CupertinoIcons.arrow_clockwise_circle_fill,
  ),
  cloudError(
    aICON: Icons.cloud_off_outlined,
    iICON: CupertinoIcons.exclamationmark_circle,
  ),
  cloudErrorFilled(
    aICON: Icons.cloud_off,
    iICON: CupertinoIcons.exclamationmark_circle_fill,
  ),
  collection(
    aICON: Icons.library_add_outlined,
    iICON: CupertinoIcons.collections,
  ),
  collectionFilled(
    aICON: Icons.library_add,
    iICON: CupertinoIcons.collections_solid,
  ),
  compass(
    aICON: Icons.explore_outlined,
    iICON: CupertinoIcons.compass,
  ),
  creditCard(
    aICON: Icons.credit_card_outlined,
    iICON: CupertinoIcons.creditcard,
  ),
  creditCardFilled(
    aICON: Icons.credit_card,
    iICON: CupertinoIcons.creditcard_fill,
  ),
  crop(
    aICON: Icons.crop_outlined,
    iICON: CupertinoIcons.crop,
  ),
  delete(
    aICON: Icons.delete_outline_outlined,
    iICON: CupertinoIcons.delete,
  ),
  deleteFilled(
    aICON: Icons.delete_outline,
    iICON: CupertinoIcons.delete_solid,
  ),
  deviceDesktop(
    aICON: Icons.desktop_windows_outlined,
    iICON: CupertinoIcons.desktopcomputer,
  ),
  deviceDesktopFilled(
    aICON: Icons.personal_video,
    iICON: CupertinoIcons.desktopcomputer,
  ),
  deviceLaptop(
    aICON: Icons.laptop_outlined,
    iICON: CupertinoIcons.device_laptop,
  ),
  deviceLaptopFilled(
    aICON: Icons.laptop,
    iICON: CupertinoIcons.device_laptop,
  ),
  deviceMobile(
    aICON: Icons.smartphone_outlined,
    iICON: CupertinoIcons.device_phone_portrait,
  ),
  document(
    aICON: Icons.insert_drive_file_outlined,
    iICON: CupertinoIcons.doc,
  ),
  documentFilled(
    aICON: Icons.insert_drive_file,
    iICON: CupertinoIcons.doc_fill,
  ),
  documentChart(
    aICON: Icons.description_outlined,
    iICON: CupertinoIcons.doc_chart,
  ),
  documentChartFilled(
    aICON: Icons.description,
    iICON: CupertinoIcons.doc_chart_fill,
  ),
  documentCheck(
    aICON: Icons.task_outlined,
    iICON: CupertinoIcons.doc_checkmark,
  ),
  documentCheckFilled(
    aICON: Icons.task,
    iICON: CupertinoIcons.doc_checkmark_fill,
  ),
  documentCopy(
    aICON: Icons.copy_outlined,
    iICON: CupertinoIcons.doc_on_clipboard,
  ),
  documentCopyFilled(
    aICON: Icons.copy,
    iICON: CupertinoIcons.doc_on_clipboard_fill,
  ),
  documentPerson(
    aICON: Icons.contact_page_outlined,
    iICON: CupertinoIcons.doc_person,
  ),
  documentPersonFilled(
    aICON: Icons.contact_page,
    iICON: CupertinoIcons.doc_person_fill,
  ),
  documentSearch(
    aICON: Icons.find_in_page_outlined,
    iICON: CupertinoIcons.doc_text_search,
  ),
  drop(
    aICON: Icons.water_drop_outlined,
    iICON: CupertinoIcons.drop,
  ),
  dropFilled(
    aICON: Icons.water_drop,
    iICON: CupertinoIcons.drop_fill,
  ),
  edit(
    aICON: Icons.edit,
    iICON: Icons.edit,
  ),
  eject(
    aICON: Icons.eject_outlined,
    iICON: CupertinoIcons.eject,
  ),
  ejectFilled(
    aICON: Icons.eject,
    iICON: CupertinoIcons.eject_fill,
  ),
  ellipsesHoriz(
    aICON: Icons.more_horiz_outlined,
    iICON: CupertinoIcons.ellipsis,
  ),
  ellipsesVert(
    aICON: Icons.more_vert_outlined,
    iICON: CupertinoIcons.ellipsis_vertical,
  ),
  envelope(
    aICON: Icons.mail_outline_outlined,
    iICON: CupertinoIcons.envelope,
  ),
  envelopeFilled(
    aICON: Icons.mail_outline,
    iICON: CupertinoIcons.envelope_fill,
  ),
  envelopeOpen(
    aICON: Icons.drafts_outlined,
    iICON: CupertinoIcons.envelope_open,
  ),
  envelopeOpenFilled(
    aICON: Icons.drafts,
    iICON: CupertinoIcons.envelope_open_fill,
  ),
  envelopeBadge(
    aICON: Icons.mark_email_unread_outlined,
    iICON: CupertinoIcons.envelope_badge,
  ),
  eye(
    aICON: Icons.visibility_outlined,
    iICON: CupertinoIcons.eye,
  ),
  eyeFilled(
    aICON: Icons.visibility,
    iICON: CupertinoIcons.eye_fill,
  ),
  eyeOff(
    aICON: Icons.visibility_off_outlined,
    iICON: CupertinoIcons.eye_slash,
  ),
  eyeOffFilled(
    aICON: Icons.visibility_off,
    iICON: CupertinoIcons.eye_slash_fill,
  ),
  film(
    aICON: Icons.movie_outlined,
    iICON: CupertinoIcons.film,
  ),
  filmFilled(
    aICON: Icons.movie,
    iICON: CupertinoIcons.film_fill,
  ),
  flag(
    aICON: Icons.flag_outlined,
    iICON: CupertinoIcons.flag,
  ),
  flagFilled(
    aICON: Icons.flag,
    iICON: CupertinoIcons.flag_fill,
  ),
  folder(
    aICON: Icons.folder_outlined,
    iICON: CupertinoIcons.folder,
  ),
  folderFilled(
    aICON: Icons.folder,
    iICON: CupertinoIcons.folder_fill,
  ),
  folderAdd(
    aICON: Icons.create_new_folder_outlined,
    iICON: CupertinoIcons.folder_badge_plus,
  ),
  folderAddFilled(
    aICON: Icons.create_new_folder,
    iICON: CupertinoIcons.folder_fill_badge_plus,
  ),
  folderPerson(
    aICON: Icons.folder_shared_outlined,
    iICON: CupertinoIcons.folder_badge_person_crop,
  ),
  folderPersonFilled(
    aICON: Icons.folder_shared,
    iICON: CupertinoIcons.folder_fill_badge_person_crop,
  ),
  folderOpen(
    aICON: Icons.folder_open_outlined,
    iICON: CupertinoIcons.folder_open,
  ),
  folderOpenFilled(
    aICON: Icons.folder_open,
    iICON: CupertinoIcons.folder_solid,
  ),
  fullScreen(
    aICON: Icons.fullscreen_outlined,
    iICON: CupertinoIcons.fullscreen,
  ),
  fullScreenExit(
    aICON: Icons.fullscreen_exit_outlined,
    iICON: CupertinoIcons.fullscreen_exit,
  ),
  gauge(
    aICON: Icons.speed_outlined,
    iICON: CupertinoIcons.gauge,
  ),
  gaugeFilled(
    aICON: Icons.speed,
    iICON: CupertinoIcons.gauge,
  ),
  gamecontroller(
    aICON: Icons.videogame_asset_outlined,
    iICON: CupertinoIcons.game_controller,
  ),
  gamecontrollerFilled(
    aICON: Icons.videogame_asset,
    iICON: CupertinoIcons.game_controller_solid,
  ),
  gear(
    aICON: Icons.settings_outlined,
    iICON: CupertinoIcons.gear,
  ),
  gearFilled(
    aICON: Icons.settings,
    iICON: CupertinoIcons.gear_solid,
  ),
  gift(
    aICON: Icons.card_giftcard_outlined,
    iICON: CupertinoIcons.gift,
  ),
  giftFilled(
    aICON: Icons.card_giftcard,
    iICON: CupertinoIcons.gift_fill,
  ),
  giftCard(
    aICON: Icons.card_giftcard_outlined,
    iICON: CupertinoIcons.gift_alt,
  ),
  giftCardFilled(
    aICON: Icons.card_giftcard,
    iICON: CupertinoIcons.gift_alt_fill,
  ),
  globe(
    aICON: Icons.public_outlined,
    iICON: CupertinoIcons.globe,
  ),
  globeFilled(
    aICON: Icons.public,
    iICON: CupertinoIcons.globe,
  ),
  group(
    aICON: Icons.group_outlined,
    iICON: CupertinoIcons.group,
  ),
  groupFilled(
    aICON: Icons.group,
    iICON: CupertinoIcons.group_solid,
  ),
  guitar(
    aICON: Icons.dehaze,
    iICON: CupertinoIcons.guitars,
  ),
  thumbUp(
    aICON: Icons.thumb_up_outlined,
    iICON: CupertinoIcons.hand_thumbsup,
  ),
  thumbUpFilled(
    aICON: Icons.thumb_up,
    iICON: CupertinoIcons.hand_thumbsup_fill,
  ),
  thumbDown(
    aICON: Icons.thumb_down_outlined,
    iICON: CupertinoIcons.hand_thumbsdown,
  ),
  thumbDownFilled(
    aICON: Icons.thumb_down,
    iICON: CupertinoIcons.hand_thumbsdown_fill,
  ),
  headPhones(
    aICON: Icons.headset_outlined,
    iICON: CupertinoIcons.headphones,
  ),
  headPhonesFilled(
    aICON: Icons.headset,
    iICON: CupertinoIcons.headphones,
  ),
  heart(
    aICON: Icons.favorite_border_outlined,
    iICON: CupertinoIcons.heart,
  ),
  heartFilled(
    aICON: Icons.favorite,
    iICON: CupertinoIcons.heart_fill,
  ),
  heartBroken(
    aICON: Icons.heart_broken_outlined,
    iICON: CupertinoIcons.heart_slash,
  ),
  heartBrokenFilled(
    aICON: Icons.heart_broken,
    iICON: CupertinoIcons.heart_slash_fill,
  ),
  home(
    aICON: Icons.home_outlined,
    iICON: CupertinoIcons.house,
  ),
  homeFilled(
    aICON: Icons.home,
    iICON: CupertinoIcons.house_fill,
  ),
  info(
    aICON: Icons.info_outline,
    iICON: CupertinoIcons.info_circle,
  ),
  infoFilled(
    aICON: Icons.info,
    iICON: CupertinoIcons.info_circle_fill,
  ),
  keyboard(
    aICON: Icons.keyboard_outlined,
    iICON: CupertinoIcons.keyboard,
  ),
  keyboardFilled(
    aICON: Icons.keyboard,
    iICON: CupertinoIcons.keyboard,
  ),
  lab(
    aICON: Icons.science_outlined,
    iICON: CupertinoIcons.lab_flask,
  ),
  labFilled(
    aICON: Icons.science,
    iICON: CupertinoIcons.lab_flask,
  ),
  layers(
    aICON: Icons.layers_outlined,
    iICON: CupertinoIcons.layers,
  ),
  layersFilled(
    aICON: Icons.layers,
    iICON: CupertinoIcons.layers_fill,
  ),
  lightBulb(
    aICON: Icons.lightbulb_outline,
    iICON: CupertinoIcons.lightbulb,
  ),
  lightBulbFilled(
    aICON: Icons.lightbulb,
    iICON: CupertinoIcons.lightbulb_fill,
  ),
  link(
    aICON: Icons.link_outlined,
    iICON: CupertinoIcons.link,
  ),
  locationPin(
    aICON: Icons.pin_drop_outlined,
    iICON: CupertinoIcons.map_pin,
  ),
  locationPinFilled(
    aICON: Icons.pin_drop,
    iICON: CupertinoIcons.map_pin,
  ),
  locationArrowPin(
    aICON: Icons.near_me_outlined,
    iICON: CupertinoIcons.location,
  ),
  locationArrowPinFilled(
    aICON: Icons.near_me,
    iICON: CupertinoIcons.location_fill,
  ),
  lock(
    aICON: Icons.lock_outline,
    iICON: CupertinoIcons.lock,
  ),
  lockFilled(
    aICON: Icons.lock,
    iICON: CupertinoIcons.lock_fill,
  ),
  lockOpen(
    aICON: Icons.lock_open_outlined,
    iICON: CupertinoIcons.lock_open,
  ),
  lockOpenFilled(
    aICON: Icons.lock_open,
    iICON: CupertinoIcons.lock_open_fill,
  ),
  map(
    aICON: Icons.map_outlined,
    iICON: CupertinoIcons.map,
  ),
  mapFilled(
    aICON: Icons.map,
    iICON: CupertinoIcons.map_fill,
  ),
  mic(
    aICON: Icons.mic_none,
    iICON: CupertinoIcons.mic,
  ),
  micFilled(
    aICON: Icons.mic,
    iICON: CupertinoIcons.mic_fill,
  ),
  micOff(
    aICON: Icons.mic_off_outlined,
    iICON: CupertinoIcons.mic_slash,
  ),
  micOffFilled(
    aICON: Icons.mic_off,
    iICON: CupertinoIcons.mic_slash_fill,
  ),
  moon(
    aICON: Icons.nightlight_outlined,
    iICON: CupertinoIcons.moon,
  ),
  moonFilled(
    aICON: Icons.nightlight,
    iICON: CupertinoIcons.moon_fill,
  ),
  move(
    aICON: Icons.open_with_outlined,
    iICON: CupertinoIcons.move,
  ),
  music(
    aICON: Icons.music_note_outlined,
    iICON: CupertinoIcons.music_note,
  ),
  musicFilled(
    aICON: Icons.music_note,
    iICON: CupertinoIcons.music_note,
  ),
  musicDouble(
    aICON: Icons.music_note_outlined,
    iICON: CupertinoIcons.music_note_2,
  ),
  musicDoubleFilled(
    aICON: Icons.music_note,
    iICON: CupertinoIcons.music_note_2,
  ),
  musicAlbum(
    aICON: Icons.library_music_outlined,
    iICON: CupertinoIcons.music_albums,
  ),
  musicAlbumFilled(
    aICON: Icons.library_music,
    iICON: CupertinoIcons.music_albums_fill,
  ),
  number(
    aICON: Icons.numbers,
    iICON: CupertinoIcons.number,
  ),
  paperclip(
    aICON: Icons.attach_file_outlined,
    iICON: CupertinoIcons.paperclip,
  ),
  paperplane(
    aICON: Icons.send_outlined,
    iICON: CupertinoIcons.paperplane,
  ),
  play(
    aICON: Icons.play_arrow_outlined,
    iICON: CupertinoIcons.play_arrow,
  ),
  playFilled(
    aICON: Icons.play_arrow,
    iICON: CupertinoIcons.play_fill,
  ),
  playCircle(
    aICON: Icons.play_circle_outline,
    iICON: CupertinoIcons.play_circle,
  ),
  playCircleFilled(
    aICON: Icons.play_circle,
    iICON: CupertinoIcons.play_circle_fill,
  ),
  pause(
    aICON: Icons.pause_outlined,
    iICON: CupertinoIcons.pause,
  ),
  pauseFilled(
    aICON: Icons.pause,
    iICON: CupertinoIcons.pause_fill,
  ),
  pauseCircle(
    aICON: Icons.pause_circle_outline,
    iICON: CupertinoIcons.pause_circle,
  ),
  pencil(
    aICON: Icons.edit_outlined,
    iICON: CupertinoIcons.pencil,
  ),
  pencilFilled(
    aICON: Icons.edit,
    iICON: CupertinoIcons.pencil,
  ),
  person(
    aICON: Icons.person_outline,
    iICON: CupertinoIcons.person,
  ),
  personFilled(
    aICON: Icons.person,
    iICON: CupertinoIcons.person_fill,
  ),
  personTwo(
    aICON: Icons.people_outline,
    iICON: CupertinoIcons.person_2,
  ),
  personTwoFilled(
    aICON: Icons.people,
    iICON: CupertinoIcons.person_2_fill,
  ),
  personThree(
    aICON: Icons.groups_outlined,
    iICON: CupertinoIcons.person_3,
  ),
  personThreeFilled(
    aICON: Icons.groups,
    iICON: CupertinoIcons.person_3_fill,
  ),
  personAdd(
    aICON: Icons.person_add_outlined,
    iICON: CupertinoIcons.person_add,
  ),
  personAddFilled(
    aICON: Icons.person_add,
    iICON: CupertinoIcons.person_add_solid,
  ),
  personRemove(
    aICON: Icons.person_remove_outlined,
    iICON: CupertinoIcons.person_badge_minus,
  ),
  personRemoveFilled(
    aICON: Icons.person_remove,
    iICON: CupertinoIcons.person_badge_minus_fill,
  ),
  personCircle(
    aICON: Icons.account_circle_outlined,
    iICON: CupertinoIcons.person_crop_circle,
  ),
  personCircleFilled(
    aICON: Icons.account_circle,
    iICON: CupertinoIcons.person_crop_circle_fill,
  ),
  personSquare(
    aICON: Icons.account_box_outlined,
    iICON: CupertinoIcons.person_crop_square,
  ),
  personSquareFilled(
    aICON: Icons.account_box,
    iICON: CupertinoIcons.person_crop_square_fill,
  ),
  phone(
    aICON: Icons.phone_outlined,
    iICON: CupertinoIcons.phone,
  ),
  phoneFilled(
    aICON: Icons.phone,
    iICON: CupertinoIcons.phone_fill,
  ),
  phoneAdd(
    aICON: Icons.add_ic_call_outlined,
    iICON: CupertinoIcons.phone_badge_plus,
  ),
  phoneAddFilled(
    aICON: Icons.add_ic_call,
    iICON: CupertinoIcons.phone_fill_badge_plus,
  ),
  phoneEnd(
    aICON: Icons.call_end_outlined,
    iICON: CupertinoIcons.phone_down,
  ),
  phoneEndFilled(
    aICON: Icons.call_end,
    iICON: CupertinoIcons.phone_down_fill,
  ),
  photo(
    aICON: Icons.photo_outlined,
    iICON: CupertinoIcons.photo,
  ),
  photoFilled(
    aICON: Icons.photo,
    iICON: CupertinoIcons.photo_fill,
  ),
  photoAlbum(
    aICON: Icons.photo_library_outlined,
    iICON: CupertinoIcons.photo_on_rectangle,
  ),
  photoAlbumFilled(
    aICON: Icons.photo_library,
    iICON: CupertinoIcons.photo_fill_on_rectangle_fill,
  ),
  piano(
    aICON: Icons.piano_outlined,
    iICON: CupertinoIcons.piano,
  ),
  pin(
    aICON: Icons.push_pin_outlined,
    iICON: CupertinoIcons.pin,
  ),
  pinFilled(
    aICON: Icons.push_pin,
    iICON: CupertinoIcons.pin_fill,
  ),
  power(
    aICON: Icons.power_settings_new_outlined,
    iICON: CupertinoIcons.power,
  ),
  printer(
    aICON: Icons.print_outlined,
    iICON: CupertinoIcons.printer,
  ),
  printerFilled(
    aICON: Icons.print,
    iICON: CupertinoIcons.printer_fill,
  ),
  qrcode(
    aICON: Icons.qr_code_outlined,
    iICON: CupertinoIcons.qrcode,
  ),
  rocket(
    aICON: Icons.rocket_launch_outlined,
    iICON: CupertinoIcons.rocket,
  ),
  rocketFilled(
    aICON: Icons.rocket_launch,
    iICON: CupertinoIcons.rocket_fill,
  ),
  rotateLeft(
    aICON: Icons.rotate_left_outlined,
    iICON: CupertinoIcons.rotate_left,
  ),
  rotateLeftFilled(
    aICON: Icons.rotate_left,
    iICON: CupertinoIcons.rotate_left_fill,
  ),
  rotateRight(
    aICON: Icons.rotate_right_outlined,
    iICON: CupertinoIcons.rotate_right,
  ),
  save(
    aICON: Icons.save,
    iICON: Icons.save,
  ),
  scissors(
    aICON: Icons.content_cut,
    iICON: CupertinoIcons.scissors,
  ),
  share(
    aICON: Icons.share_outlined,
    iICON: CupertinoIcons.share,
  ),
  shareFilled(
    aICON: Icons.share,
    iICON: CupertinoIcons.share_solid,
  ),
  shield(
    aICON: Icons.shield_outlined,
    iICON: CupertinoIcons.shield,
  ),
  shieldFilled(
    aICON: Icons.shield,
    iICON: CupertinoIcons.shield_fill,
  ),
  shift(
    aICON: Icons.keyboard_capslock_outlined,
    iICON: CupertinoIcons.shift,
  ),
  shuffle(
    aICON: Icons.shuffle_outlined,
    iICON: CupertinoIcons.shuffle,
  ),
  signature(
    aICON: Icons.draw_outlined,
    iICON: CupertinoIcons.signature,
  ),
  speaker0(
    aICON: Icons.volume_mute_outlined,
    iICON: CupertinoIcons.speaker,
  ),
  speaker0Filled(
    aICON: Icons.volume_mute,
    iICON: CupertinoIcons.speaker_fill,
  ),
  speaker1(
    aICON: Icons.volume_down_outlined,
    iICON: CupertinoIcons.speaker_1,
  ),
  speaker1Filled(
    aICON: Icons.volume_down,
    iICON: CupertinoIcons.speaker_1_fill,
  ),
  speaker2(
    aICON: Icons.volume_up_outlined,
    iICON: CupertinoIcons.speaker_2,
  ),
  speaker2Filled(
    aICON: Icons.volume_up,
    iICON: CupertinoIcons.speaker_2_fill,
  ),
  speakerMute(
    aICON: Icons.volume_off_outlined,
    iICON: CupertinoIcons.speaker_slash,
  ),
  speakerMuteFilled(
    aICON: Icons.volume_off,
    iICON: CupertinoIcons.speaker_slash_fill,
  ),
  star(
    aICON: Icons.star_border_outlined,
    iICON: CupertinoIcons.star,
  ),
  starFilled(
    aICON: Icons.star,
    iICON: CupertinoIcons.star_fill,
  ),
  starHalf(
    aICON: Icons.star_half_outlined,
    iICON: CupertinoIcons.star_lefthalf_fill,
  ),
  starHalfFilled(
    aICON: Icons.star_half,
    iICON: CupertinoIcons.star_lefthalf_fill,
  ),
  stop(
    aICON: Icons.stop_outlined,
    iICON: CupertinoIcons.stop,
  ),
  stopFilled(
    aICON: Icons.stop,
    iICON: CupertinoIcons.stop_fill,
  ),
  table(
    aICON: Icons.table_chart_outlined,
    iICON: CupertinoIcons.table,
  ),
  tableFilled(
    aICON: Icons.table_chart,
    iICON: CupertinoIcons.table_fill,
  ),
  tag(
    aICON: Icons.local_offer_outlined,
    iICON: CupertinoIcons.tag,
  ),
  tagFilled(
    aICON: Icons.local_offer,
    iICON: CupertinoIcons.tag_fill,
  ),
  ticket(
    aICON: Icons.confirmation_number_outlined,
    iICON: CupertinoIcons.ticket,
  ),
  ticketFilled(
    aICON: Icons.confirmation_number,
    iICON: CupertinoIcons.ticket_fill,
  ),
  tv(
    aICON: Icons.tv_outlined,
    iICON: CupertinoIcons.tv,
  ),
  tvFilled(
    aICON: Icons.tv,
    iICON: CupertinoIcons.tv_fill,
  ),
  umbrella(
    aICON: Icons.umbrella_outlined,
    iICON: CupertinoIcons.umbrella,
  ),
  videoCamera(
    aICON: Icons.videocam_outlined,
    iICON: CupertinoIcons.videocam,
  ),
  videoCameraFilled(
    aICON: Icons.videocam,
    iICON: CupertinoIcons.videocam_fill,
  ),
  wand(
    aICON: Icons.auto_fix_normal_outlined,
    iICON: CupertinoIcons.wand_stars,
  ),
  wifi(
    aICON: Icons.wifi_outlined,
    iICON: CupertinoIcons.wifi,
  ),
  rotateRightFilled(
    aICON: Icons.rotate_right,
    iICON: CupertinoIcons.rotate_right_fill,
  ),
  removeFromBag(
    aICON: Icons.remove_shopping_cart_outlined,
    iICON: CupertinoIcons.bag_badge_minus,
  ),
  removeFromBagFilled(
    aICON: Icons.remove_shopping_cart,
    iICON: CupertinoIcons.bag_fill_badge_minus,
  ),
  download(
    aICON: Icons.download,
    iICON: CupertinoIcons.down_arrow,
  ),
  downloadFile(
    aICON: Icons.file_download_outlined,
    iICON: CupertinoIcons.arrow_down_doc,
  ),
  downloadFileFilled(
    aICON: Icons.file_download,
    iICON: CupertinoIcons.arrow_down_doc_fill,
  ),
  uploadFile(
    aICON: Icons.file_upload_outlined,
    iICON: CupertinoIcons.arrow_up_doc,
  ),
  uploadFileFilled(
    aICON: Icons.file_upload,
    iICON: CupertinoIcons.arrow_up_doc_fill,
  ),
  settings(
    aICON: Icons.settings,
    iICON: CupertinoIcons.settings,
  ),
  search(
    aICON: Icons.search,
    iICON: CupertinoIcons.search,
  ),
  verified(
    aICON: Icons.verified_outlined,
    iICON: CupertinoIcons.checkmark_seal,
  ),
  send(
    aICON: Icons.send_outlined,
    iICON: CupertinoIcons.paperplane,
  ),
  back(
    aICON: Icons.arrow_back,
    iICON: CupertinoIcons.back,
  ),
  forward(
    aICON: Icons.arrow_forward,
    iICON: CupertinoIcons.forward,
  ),
  refresh(
    aICON: Icons.refresh,
    iICON: CupertinoIcons.refresh,
  ),
  more(
    aICON: Icons.more_horiz,
    iICON: CupertinoIcons.ellipsis,
  ),
  done(
    aICON: Icons.done,
    iICON: CupertinoIcons.check_mark,
  ),
  zoomIn(
    aICON: Icons.zoom_in_outlined,
    iICON: CupertinoIcons.zoom_in,
  ),
  zoomOut(
    aICON: Icons.zoom_out_outlined,
    iICON: CupertinoIcons.zoom_out,
  );

  final IconData aICON; // android
  final IconData iICON; // iOS

  const AdpIcons({required this.aICON, required this.iICON});
}

extension AdaptiveIconsEx on AdpIcons {
  IconData get platform => adaptiveValue<IconData>(
        iOS: () => iICON,
        android: () => aICON,
      );
}
