import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/common/adaptive.dart';

enum AdpIcons {
  add(
    cupertino: CupertinoIcons.add,
    material: Icons.add,
  ),
  addCircle(
    material: Icons.add_circle_outline,
    cupertino: CupertinoIcons.add_circled,
  ),
  addCircleFilled(
    material: Icons.add_circle,
    cupertino: CupertinoIcons.add_circled_solid,
  ),
  airplane(
    material: Icons.airplanemode_active,
    cupertino: CupertinoIcons.airplane,
  ),
  alarm(
    material: Icons.alarm_outlined,
    cupertino: CupertinoIcons.alarm,
  ),
  alarmFilled(
    material: Icons.alarm,
    cupertino: CupertinoIcons.alarm_fill,
  ),
  app(
    material: Icons.apps,
    cupertino: CupertinoIcons.app,
  ),
  archive(
    material: Icons.archive_outlined,
    cupertino: CupertinoIcons.archivebox,
  ),
  archiveFilled(
    material: Icons.archive,
    cupertino: CupertinoIcons.archivebox_fill,
  ),
  arrowDown(
    material: Icons.arrow_downward,
    cupertino: CupertinoIcons.arrow_down,
  ),
  arrowLeft(
    material: Icons.arrow_back,
    cupertino: CupertinoIcons.arrow_left,
  ),
  arrowRight(
    material: Icons.arrow_forward,
    cupertino: CupertinoIcons.arrow_right,
  ),
  arrowUp(
    material: Icons.arrow_upward,
    cupertino: CupertinoIcons.arrow_up,
  ),
  arrowDownCircle(
    material: Icons.arrow_circle_down_outlined,
    cupertino: CupertinoIcons.arrow_down_circle,
  ),
  arrowLeftCircle(
    material: Icons.arrow_circle_left_outlined,
    cupertino: CupertinoIcons.arrow_left_circle,
  ),
  arrowRightCircle(
    material: Icons.arrow_circle_right_outlined,
    cupertino: CupertinoIcons.arrow_right_circle,
  ),
  arrowUpCircle(
    material: Icons.arrow_circle_up_outlined,
    cupertino: CupertinoIcons.arrow_up_circle,
  ),
  arrowDownCircleFilled(
    material: Icons.arrow_circle_down,
    cupertino: CupertinoIcons.arrow_down_circle_fill,
  ),
  arrowLeftCircleFilled(
    material: Icons.arrow_circle_left,
    cupertino: CupertinoIcons.arrow_left_circle_fill,
  ),
  arrowRightCircleFilled(
    material: Icons.arrow_circle_right,
    cupertino: CupertinoIcons.arrow_right_circle_fill,
  ),
  arrowUpCircleFilled(
    material: Icons.arrow_circle_up,
    cupertino: CupertinoIcons.arrow_up_circle_fill,
  ),
  atMark(
    material: Icons.alternate_email_outlined,
    cupertino: CupertinoIcons.at,
  ),
  bag(
    material: Icons.shopping_bag_outlined,
    cupertino: CupertinoIcons.bag,
  ),
  bagFilled(
    material: Icons.shopping_bag,
    cupertino: CupertinoIcons.bag_fill,
  ),
  addToBag(
    material: Icons.add_shopping_cart_outlined,
    cupertino: CupertinoIcons.bag_badge_plus,
  ),
  addToBagFilled(
    material: Icons.add_shopping_cart,
    cupertino: CupertinoIcons.bag_fill_badge_plus,
  ),
  barcodeScanner(
    material: Icons.barcode_reader,
    cupertino: CupertinoIcons.barcode_viewfinder,
  ),
  battery0(
    material: Icons.battery_0_bar,
    cupertino: CupertinoIcons.battery_0,
  ),
  battery25(
    material: Icons.battery_2_bar,
    cupertino: CupertinoIcons.battery_25,
  ),
  battery75(
    material: Icons.battery_5_bar,
    cupertino: CupertinoIcons.battery_75_percent,
  ),
  battery100(
    material: Icons.battery_full,
    cupertino: CupertinoIcons.battery_full,
  ),
  batteryCharge(
    material: Icons.battery_charging_full,
    cupertino: CupertinoIcons.battery_charging,
  ),
  bed(
    material: Icons.bed_outlined,
    cupertino: CupertinoIcons.bed_double,
  ),
  bedFilled(
    material: Icons.bed,
    cupertino: CupertinoIcons.bed_double_fill,
  ),
  bolt(
    material: Icons.bolt_outlined,
    cupertino: CupertinoIcons.bolt_fill,
  ),
  bluetooth(
    material: Icons.bluetooth_outlined,
    cupertino: CupertinoIcons.bluetooth,
  ),
  bluetoothConnected(
    material: Icons.bluetooth_connected_outlined,
    cupertino: CupertinoIcons.bluetooth,
  ),
  bluetoothDisabled(
    material: Icons.bluetooth_disabled_outlined,
    cupertino: CupertinoIcons.bluetooth,
  ),
  book(
    material: Icons.menu_book_outlined,
    cupertino: CupertinoIcons.book,
  ),
  bookFilled(
    material: Icons.menu_book,
    cupertino: CupertinoIcons.book_fill,
  ),
  bookmark(
    material: Icons.bookmark_outline,
    cupertino: CupertinoIcons.bookmark,
  ),
  bookmarkFilled(
    material: Icons.bookmark,
    cupertino: CupertinoIcons.bookmark_fill,
  ),
  bookmarkAdd(
    material: Icons.bookmark_add_outlined,
    cupertino: CupertinoIcons.bookmark,
  ),
  bookmarkAddFilled(
    material: Icons.bookmark_add,
    cupertino: CupertinoIcons.bookmark_fill,
  ),
  bookmarkRemove(
    material: Icons.bookmark_remove_outlined,
    cupertino: CupertinoIcons.bookmark,
  ),
  briefcase(
    material: Icons.work_outline,
    cupertino: CupertinoIcons.briefcase,
  ),
  calendar(
    material: Icons.calendar_month_outlined,
    cupertino: CupertinoIcons.calendar,
  ),
  calendarFilled(
    material: Icons.calendar_month,
    cupertino: CupertinoIcons.calendar,
  ),
  calendarAdd(
    material: Icons.event_outlined,
    cupertino: CupertinoIcons.calendar_badge_plus,
  ),
  calendarAddFilled(
    material: Icons.event,
    cupertino: CupertinoIcons.calendar_badge_plus,
  ),
  calenderRemove(
    material: Icons.event_busy_outlined,
    cupertino: CupertinoIcons.calendar_badge_minus,
  ),
  camera(
    material: Icons.camera_alt_outlined,
    cupertino: CupertinoIcons.camera,
  ),
  cameraFilled(
    material: Icons.camera_alt,
    cupertino: CupertinoIcons.camera_fill,
  ),
  cameraSwitch(
    material: Icons.switch_camera_outlined,
    cupertino: CupertinoIcons.switch_camera,
  ),
  cameraSwitchFilled(
    material: Icons.switch_camera,
    cupertino: CupertinoIcons.switch_camera,
  ),
  calenderRemoveFilled(
    material: Icons.event_busy,
    cupertino: CupertinoIcons.calendar_badge_minus,
  ),
  capslock(
    material: Icons.keyboard_capslock_outlined,
    cupertino: CupertinoIcons.capslock,
  ),
  capslockFilled(
    material: Icons.keyboard_capslock,
    cupertino: CupertinoIcons.capslock_fill,
  ),
  car(
    material: Icons.directions_car_outlined,
    cupertino: CupertinoIcons.car_detailed,
  ),
  carFilled(
    material: Icons.directions_car,
    cupertino: CupertinoIcons.car_detailed,
  ),
  cart(
    material: Icons.shopping_cart_outlined,
    cupertino: CupertinoIcons.cart,
  ),
  cartFilled(
    material: Icons.shopping_cart,
    cupertino: CupertinoIcons.cart_fill,
  ),
  cartAdd(
    material: Icons.add_shopping_cart_outlined,
    cupertino: CupertinoIcons.cart_badge_plus,
  ),
  cartRemove(
    material: Icons.remove_shopping_cart_outlined,
    cupertino: CupertinoIcons.cart_badge_minus,
  ),
  chartBar(
    material: Icons.bar_chart_outlined,
    cupertino: CupertinoIcons.chart_bar,
  ),
  chartBarFilled(
    material: Icons.bar_chart,
    cupertino: CupertinoIcons.chart_bar_fill,
  ),
  chartPie(
    material: Icons.pie_chart_outline,
    cupertino: CupertinoIcons.chart_pie,
  ),
  chartPieFilled(
    material: Icons.pie_chart,
    cupertino: CupertinoIcons.chart_pie_fill,
  ),
  chartLine(
    material: Icons.ssid_chart,
    cupertino: Icons.ssid_chart,
  ),
  chartBubble(
    material: Icons.bubble_chart_outlined,
    cupertino: Icons.bubble_chart_outlined,
  ),
  bug(
    material: Icons.bug_report_outlined,
    cupertino: CupertinoIcons.ant,
  ),
  bugFilled(
    material: Icons.bug_report,
    cupertino: CupertinoIcons.ant_fill,
  ),
  chatBubble(
    material: Icons.chat_bubble_outline,
    cupertino: CupertinoIcons.chat_bubble,
  ),
  chatBubbleFilled(
    material: Icons.chat_bubble,
    cupertino: CupertinoIcons.chat_bubble_fill,
  ),
  chatBubbleAdd(
    material: Icons.add_comment_outlined,
    cupertino: CupertinoIcons.chat_bubble_text,
  ),
  checkMark(
    material: Icons.check_outlined,
    cupertino: CupertinoIcons.check_mark,
  ),
  checkMarkCircle(
    material: Icons.check_circle_outline,
    cupertino: CupertinoIcons.checkmark_circle,
  ),
  checkMarkCircleFilled(
    material: Icons.check_circle,
    cupertino: CupertinoIcons.checkmark_circle_fill,
  ),
  checkMarkShield(
    material: Icons.verified_user_outlined,
    cupertino: CupertinoIcons.checkmark_shield,
  ),
  checkMarkShieldFilled(
    material: Icons.verified_user,
    cupertino: CupertinoIcons.checkmark_shield_fill,
  ),
  checkBoxEmpty(
    material: Icons.check_box_outline_blank_outlined,
    cupertino: CupertinoIcons.square,
  ),
  checkBoxChecked(
    material: Icons.check_box_outlined,
    cupertino: CupertinoIcons.checkmark_square,
  ),
  checkBoxCheckedFilled(
    material: Icons.check_box,
    cupertino: CupertinoIcons.checkmark_square_fill,
  ),
  checkBoxIndeterminate(
    material: Icons.indeterminate_check_box_outlined,
    cupertino: CupertinoIcons.minus_square,
  ),
  circle(
    material: Icons.circle_outlined,
    cupertino: CupertinoIcons.circle,
  ),
  circleFilled(
    material: Icons.circle,
    cupertino: CupertinoIcons.circle_fill,
  ),
  circleHalf(
    material: Icons.contrast,
    cupertino: CupertinoIcons.circle_lefthalf_fill,
  ),
  clear(
    material: Icons.clear_outlined,
    cupertino: CupertinoIcons.clear,
  ),
  grid(
    material: Icons.grid_view_outlined,
    cupertino: CupertinoIcons.square_grid_2x2,
  ),
  gridFilled(
    material: Icons.grid_view,
    cupertino: CupertinoIcons.square_grid_2x2_fill,
  ),
  clock(
    material: Icons.access_time_outlined,
    cupertino: CupertinoIcons.clock,
  ),
  clockFilled(
    material: Icons.access_time,
    cupertino: CupertinoIcons.clock_fill,
  ),
  cloud(
    material: Icons.cloud_outlined,
    cupertino: CupertinoIcons.cloud,
  ),
  cloudFilled(
    material: Icons.cloud,
    cupertino: CupertinoIcons.cloud_fill,
  ),
  cloudDownload(
    material: Icons.cloud_download_outlined,
    cupertino: CupertinoIcons.cloud_download,
  ),
  cloudDownloadFilled(
    material: Icons.cloud_download,
    cupertino: CupertinoIcons.cloud_download_fill,
  ),
  cloudUpload(
    material: Icons.cloud_upload_outlined,
    cupertino: CupertinoIcons.cloud_upload,
  ),
  cloudUploadFilled(
    material: Icons.cloud_upload,
    cupertino: CupertinoIcons.cloud_upload_fill,
  ),
  cloudSync(
    material: Icons.sync_outlined,
    cupertino: CupertinoIcons.arrow_clockwise_circle,
  ),
  cloudSyncFilled(
    material: Icons.sync,
    cupertino: CupertinoIcons.arrow_clockwise_circle_fill,
  ),
  cloudError(
    material: Icons.cloud_off_outlined,
    cupertino: CupertinoIcons.exclamationmark_circle,
  ),
  cloudErrorFilled(
    material: Icons.cloud_off,
    cupertino: CupertinoIcons.exclamationmark_circle_fill,
  ),
  collection(
    material: Icons.library_add_outlined,
    cupertino: CupertinoIcons.collections,
  ),
  collectionFilled(
    material: Icons.library_add,
    cupertino: CupertinoIcons.collections_solid,
  ),
  compass(
    material: Icons.explore_outlined,
    cupertino: CupertinoIcons.compass,
  ),
  creditCard(
    material: Icons.credit_card_outlined,
    cupertino: CupertinoIcons.creditcard,
  ),
  creditCardFilled(
    material: Icons.credit_card,
    cupertino: CupertinoIcons.creditcard_fill,
  ),
  crop(
    material: Icons.crop_outlined,
    cupertino: CupertinoIcons.crop,
  ),
  delete(
    material: Icons.delete_outline_outlined,
    cupertino: CupertinoIcons.delete,
  ),
  deleteFilled(
    material: Icons.delete_outline,
    cupertino: CupertinoIcons.delete_solid,
  ),
  deviceDesktop(
    material: Icons.desktop_windows_outlined,
    cupertino: CupertinoIcons.desktopcomputer,
  ),
  deviceDesktopFilled(
    material: Icons.personal_video,
    cupertino: CupertinoIcons.desktopcomputer,
  ),
  deviceLaptop(
    material: Icons.laptop_outlined,
    cupertino: CupertinoIcons.device_laptop,
  ),
  deviceLaptopFilled(
    material: Icons.laptop,
    cupertino: CupertinoIcons.device_laptop,
  ),
  deviceMobile(
    material: Icons.smartphone_outlined,
    cupertino: CupertinoIcons.device_phone_portrait,
  ),
  document(
    material: Icons.insert_drive_file_outlined,
    cupertino: CupertinoIcons.doc,
  ),
  documentFilled(
    material: Icons.insert_drive_file,
    cupertino: CupertinoIcons.doc_fill,
  ),
  documentChart(
    material: Icons.description_outlined,
    cupertino: CupertinoIcons.doc_chart,
  ),
  documentChartFilled(
    material: Icons.description,
    cupertino: CupertinoIcons.doc_chart_fill,
  ),
  documentCheck(
    material: Icons.task_outlined,
    cupertino: CupertinoIcons.doc_checkmark,
  ),
  documentCheckFilled(
    material: Icons.task,
    cupertino: CupertinoIcons.doc_checkmark_fill,
  ),
  documentCopy(
    material: Icons.copy_outlined,
    cupertino: CupertinoIcons.doc_on_clipboard,
  ),
  documentCopyFilled(
    material: Icons.copy,
    cupertino: CupertinoIcons.doc_on_clipboard_fill,
  ),
  documentPerson(
    material: Icons.contact_page_outlined,
    cupertino: CupertinoIcons.doc_person,
  ),
  documentPersonFilled(
    material: Icons.contact_page,
    cupertino: CupertinoIcons.doc_person_fill,
  ),
  documentSearch(
    material: Icons.find_in_page_outlined,
    cupertino: CupertinoIcons.doc_text_search,
  ),
  drop(
    material: Icons.water_drop_outlined,
    cupertino: CupertinoIcons.drop,
  ),
  dropFilled(
    material: Icons.water_drop,
    cupertino: CupertinoIcons.drop_fill,
  ),
  edit(
    material: Icons.edit,
    cupertino: Icons.edit,
  ),
  eject(
    material: Icons.eject_outlined,
    cupertino: CupertinoIcons.eject,
  ),
  ejectFilled(
    material: Icons.eject,
    cupertino: CupertinoIcons.eject_fill,
  ),
  ellipsesHoriz(
    material: Icons.more_horiz_outlined,
    cupertino: CupertinoIcons.ellipsis,
  ),
  ellipsesVert(
    material: Icons.more_vert_outlined,
    cupertino: CupertinoIcons.ellipsis_vertical,
  ),
  envelope(
    material: Icons.mail_outline_outlined,
    cupertino: CupertinoIcons.envelope,
  ),
  envelopeFilled(
    material: Icons.mail_outline,
    cupertino: CupertinoIcons.envelope_fill,
  ),
  envelopeOpen(
    material: Icons.drafts_outlined,
    cupertino: CupertinoIcons.envelope_open,
  ),
  envelopeOpenFilled(
    material: Icons.drafts,
    cupertino: CupertinoIcons.envelope_open_fill,
  ),
  envelopeBadge(
    material: Icons.mark_email_unread_outlined,
    cupertino: CupertinoIcons.envelope_badge,
  ),
  eye(
    material: Icons.visibility_outlined,
    cupertino: CupertinoIcons.eye,
  ),
  eyeFilled(
    material: Icons.visibility,
    cupertino: CupertinoIcons.eye_fill,
  ),
  eyeOff(
    material: Icons.visibility_off_outlined,
    cupertino: CupertinoIcons.eye_slash,
  ),
  eyeOffFilled(
    material: Icons.visibility_off,
    cupertino: CupertinoIcons.eye_slash_fill,
  ),
  film(
    material: Icons.movie_outlined,
    cupertino: CupertinoIcons.film,
  ),
  filmFilled(
    material: Icons.movie,
    cupertino: CupertinoIcons.film_fill,
  ),
  flag(
    material: Icons.flag_outlined,
    cupertino: CupertinoIcons.flag,
  ),
  flagFilled(
    material: Icons.flag,
    cupertino: CupertinoIcons.flag_fill,
  ),
  folder(
    material: Icons.folder_outlined,
    cupertino: CupertinoIcons.folder,
  ),
  folderFilled(
    material: Icons.folder,
    cupertino: CupertinoIcons.folder_fill,
  ),
  folderAdd(
    material: Icons.create_new_folder_outlined,
    cupertino: CupertinoIcons.folder_badge_plus,
  ),
  folderAddFilled(
    material: Icons.create_new_folder,
    cupertino: CupertinoIcons.folder_fill_badge_plus,
  ),
  folderPerson(
    material: Icons.folder_shared_outlined,
    cupertino: CupertinoIcons.folder_badge_person_crop,
  ),
  folderPersonFilled(
    material: Icons.folder_shared,
    cupertino: CupertinoIcons.folder_fill_badge_person_crop,
  ),
  folderOpen(
    material: Icons.folder_open_outlined,
    cupertino: CupertinoIcons.folder_open,
  ),
  folderOpenFilled(
    material: Icons.folder_open,
    cupertino: CupertinoIcons.folder_solid,
  ),
  fullScreen(
    material: Icons.fullscreen_outlined,
    cupertino: CupertinoIcons.fullscreen,
  ),
  fullScreenExit(
    material: Icons.fullscreen_exit_outlined,
    cupertino: CupertinoIcons.fullscreen_exit,
  ),
  gauge(
    material: Icons.speed_outlined,
    cupertino: CupertinoIcons.gauge,
  ),
  gaugeFilled(
    material: Icons.speed,
    cupertino: CupertinoIcons.gauge,
  ),
  gamecontroller(
    material: Icons.videogame_asset_outlined,
    cupertino: CupertinoIcons.game_controller,
  ),
  gamecontrollerFilled(
    material: Icons.videogame_asset,
    cupertino: CupertinoIcons.game_controller_solid,
  ),
  gear(
    material: Icons.settings_outlined,
    cupertino: CupertinoIcons.gear,
  ),
  gearFilled(
    material: Icons.settings,
    cupertino: CupertinoIcons.gear_solid,
  ),
  gift(
    material: Icons.card_giftcard_outlined,
    cupertino: CupertinoIcons.gift,
  ),
  giftFilled(
    material: Icons.card_giftcard,
    cupertino: CupertinoIcons.gift_fill,
  ),
  giftCard(
    material: Icons.card_giftcard_outlined,
    cupertino: CupertinoIcons.gift_alt,
  ),
  giftCardFilled(
    material: Icons.card_giftcard,
    cupertino: CupertinoIcons.gift_alt_fill,
  ),
  globe(
    material: Icons.public_outlined,
    cupertino: CupertinoIcons.globe,
  ),
  globeFilled(
    material: Icons.public,
    cupertino: CupertinoIcons.globe,
  ),
  group(
    material: Icons.group_outlined,
    cupertino: CupertinoIcons.group,
  ),
  groupFilled(
    material: Icons.group,
    cupertino: CupertinoIcons.group_solid,
  ),
  guitar(
    material: Icons.dehaze,
    cupertino: CupertinoIcons.guitars,
  ),
  thumbUp(
    material: Icons.thumb_up_outlined,
    cupertino: CupertinoIcons.hand_thumbsup,
  ),
  thumbUpFilled(
    material: Icons.thumb_up,
    cupertino: CupertinoIcons.hand_thumbsup_fill,
  ),
  thumbDown(
    material: Icons.thumb_down_outlined,
    cupertino: CupertinoIcons.hand_thumbsdown,
  ),
  thumbDownFilled(
    material: Icons.thumb_down,
    cupertino: CupertinoIcons.hand_thumbsdown_fill,
  ),
  headPhones(
    material: Icons.headset_outlined,
    cupertino: CupertinoIcons.headphones,
  ),
  headPhonesFilled(
    material: Icons.headset,
    cupertino: CupertinoIcons.headphones,
  ),
  heart(
    material: Icons.favorite_border_outlined,
    cupertino: CupertinoIcons.heart,
  ),
  heartFilled(
    material: Icons.favorite,
    cupertino: CupertinoIcons.heart_fill,
  ),
  heartBroken(
    material: Icons.heart_broken_outlined,
    cupertino: CupertinoIcons.heart_slash,
  ),
  heartBrokenFilled(
    material: Icons.heart_broken,
    cupertino: CupertinoIcons.heart_slash_fill,
  ),
  home(
    material: Icons.home_outlined,
    cupertino: CupertinoIcons.house,
  ),
  homeFilled(
    material: Icons.home,
    cupertino: CupertinoIcons.house_fill,
  ),
  info(
    material: Icons.info_outline,
    cupertino: CupertinoIcons.info_circle,
  ),
  infoFilled(
    material: Icons.info,
    cupertino: CupertinoIcons.info_circle_fill,
  ),
  keyboard(
    material: Icons.keyboard_outlined,
    cupertino: CupertinoIcons.keyboard,
  ),
  keyboardFilled(
    material: Icons.keyboard,
    cupertino: CupertinoIcons.keyboard,
  ),
  lab(
    material: Icons.science_outlined,
    cupertino: CupertinoIcons.lab_flask,
  ),
  labFilled(
    material: Icons.science,
    cupertino: CupertinoIcons.lab_flask,
  ),
  layers(
    material: Icons.layers_outlined,
    cupertino: CupertinoIcons.layers,
  ),
  layersFilled(
    material: Icons.layers,
    cupertino: CupertinoIcons.layers_fill,
  ),
  lightBulb(
    material: Icons.lightbulb_outline,
    cupertino: CupertinoIcons.lightbulb,
  ),
  lightBulbFilled(
    material: Icons.lightbulb,
    cupertino: CupertinoIcons.lightbulb_fill,
  ),
  link(
    material: Icons.link_outlined,
    cupertino: CupertinoIcons.link,
  ),
  locationPin(
    material: Icons.pin_drop_outlined,
    cupertino: CupertinoIcons.map_pin,
  ),
  locationPinFilled(
    material: Icons.pin_drop,
    cupertino: CupertinoIcons.map_pin,
  ),
  locationArrowPin(
    material: Icons.near_me_outlined,
    cupertino: CupertinoIcons.location,
  ),
  locationArrowPinFilled(
    material: Icons.near_me,
    cupertino: CupertinoIcons.location_fill,
  ),
  lock(
    material: Icons.lock_outline,
    cupertino: CupertinoIcons.lock,
  ),
  lockFilled(
    material: Icons.lock,
    cupertino: CupertinoIcons.lock_fill,
  ),
  lockOpen(
    material: Icons.lock_open_outlined,
    cupertino: CupertinoIcons.lock_open,
  ),
  lockOpenFilled(
    material: Icons.lock_open,
    cupertino: CupertinoIcons.lock_open_fill,
  ),
  map(
    material: Icons.map_outlined,
    cupertino: CupertinoIcons.map,
  ),
  mapFilled(
    material: Icons.map,
    cupertino: CupertinoIcons.map_fill,
  ),
  mic(
    material: Icons.mic_none,
    cupertino: CupertinoIcons.mic,
  ),
  micFilled(
    material: Icons.mic,
    cupertino: CupertinoIcons.mic_fill,
  ),
  micOff(
    material: Icons.mic_off_outlined,
    cupertino: CupertinoIcons.mic_slash,
  ),
  micOffFilled(
    material: Icons.mic_off,
    cupertino: CupertinoIcons.mic_slash_fill,
  ),
  moon(
    material: Icons.nightlight_outlined,
    cupertino: CupertinoIcons.moon,
  ),
  moonFilled(
    material: Icons.nightlight,
    cupertino: CupertinoIcons.moon_fill,
  ),
  move(
    material: Icons.open_with_outlined,
    cupertino: CupertinoIcons.move,
  ),
  music(
    material: Icons.music_note_outlined,
    cupertino: CupertinoIcons.music_note,
  ),
  musicFilled(
    material: Icons.music_note,
    cupertino: CupertinoIcons.music_note,
  ),
  musicDouble(
    material: Icons.music_note_outlined,
    cupertino: CupertinoIcons.music_note_2,
  ),
  musicDoubleFilled(
    material: Icons.music_note,
    cupertino: CupertinoIcons.music_note_2,
  ),
  musicAlbum(
    material: Icons.library_music_outlined,
    cupertino: CupertinoIcons.music_albums,
  ),
  musicAlbumFilled(
    material: Icons.library_music,
    cupertino: CupertinoIcons.music_albums_fill,
  ),
  number(
    material: Icons.numbers,
    cupertino: CupertinoIcons.number,
  ),
  paperclip(
    material: Icons.attach_file_outlined,
    cupertino: CupertinoIcons.paperclip,
  ),
  paperplane(
    material: Icons.send_outlined,
    cupertino: CupertinoIcons.paperplane,
  ),
  play(
    material: Icons.play_arrow_outlined,
    cupertino: CupertinoIcons.play_arrow,
  ),
  playFilled(
    material: Icons.play_arrow,
    cupertino: CupertinoIcons.play_fill,
  ),
  playCircle(
    material: Icons.play_circle_outline,
    cupertino: CupertinoIcons.play_circle,
  ),
  playCircleFilled(
    material: Icons.play_circle,
    cupertino: CupertinoIcons.play_circle_fill,
  ),
  pause(
    material: Icons.pause_outlined,
    cupertino: CupertinoIcons.pause,
  ),
  pauseFilled(
    material: Icons.pause,
    cupertino: CupertinoIcons.pause_fill,
  ),
  pauseCircle(
    material: Icons.pause_circle_outline,
    cupertino: CupertinoIcons.pause_circle,
  ),
  pencil(
    material: Icons.edit_outlined,
    cupertino: CupertinoIcons.pencil,
  ),
  pencilFilled(
    material: Icons.edit,
    cupertino: CupertinoIcons.pencil,
  ),
  person(
    material: Icons.person_outline,
    cupertino: CupertinoIcons.person,
  ),
  personFilled(
    material: Icons.person,
    cupertino: CupertinoIcons.person_fill,
  ),
  personTwo(
    material: Icons.people_outline,
    cupertino: CupertinoIcons.person_2,
  ),
  personTwoFilled(
    material: Icons.people,
    cupertino: CupertinoIcons.person_2_fill,
  ),
  personThree(
    material: Icons.groups_outlined,
    cupertino: CupertinoIcons.person_3,
  ),
  personThreeFilled(
    material: Icons.groups,
    cupertino: CupertinoIcons.person_3_fill,
  ),
  personAdd(
    material: Icons.person_add_outlined,
    cupertino: CupertinoIcons.person_add,
  ),
  personAddFilled(
    material: Icons.person_add,
    cupertino: CupertinoIcons.person_add_solid,
  ),
  personRemove(
    material: Icons.person_remove_outlined,
    cupertino: CupertinoIcons.person_badge_minus,
  ),
  personRemoveFilled(
    material: Icons.person_remove,
    cupertino: CupertinoIcons.person_badge_minus_fill,
  ),
  personCircle(
    material: Icons.account_circle_outlined,
    cupertino: CupertinoIcons.person_crop_circle,
  ),
  personCircleFilled(
    material: Icons.account_circle,
    cupertino: CupertinoIcons.person_crop_circle_fill,
  ),
  personSquare(
    material: Icons.account_box_outlined,
    cupertino: CupertinoIcons.person_crop_square,
  ),
  personSquareFilled(
    material: Icons.account_box,
    cupertino: CupertinoIcons.person_crop_square_fill,
  ),
  phone(
    material: Icons.phone_outlined,
    cupertino: CupertinoIcons.phone,
  ),
  phoneFilled(
    material: Icons.phone,
    cupertino: CupertinoIcons.phone_fill,
  ),
  phoneAdd(
    material: Icons.add_ic_call_outlined,
    cupertino: CupertinoIcons.phone_badge_plus,
  ),
  phoneAddFilled(
    material: Icons.add_ic_call,
    cupertino: CupertinoIcons.phone_fill_badge_plus,
  ),
  phoneEnd(
    material: Icons.call_end_outlined,
    cupertino: CupertinoIcons.phone_down,
  ),
  phoneEndFilled(
    material: Icons.call_end,
    cupertino: CupertinoIcons.phone_down_fill,
  ),
  photo(
    material: Icons.photo_outlined,
    cupertino: CupertinoIcons.photo,
  ),
  photoFilled(
    material: Icons.photo,
    cupertino: CupertinoIcons.photo_fill,
  ),
  photoAlbum(
    material: Icons.photo_library_outlined,
    cupertino: CupertinoIcons.photo_on_rectangle,
  ),
  photoAlbumFilled(
    material: Icons.photo_library,
    cupertino: CupertinoIcons.photo_fill_on_rectangle_fill,
  ),
  piano(
    material: Icons.piano_outlined,
    cupertino: CupertinoIcons.piano,
  ),
  pin(
    material: Icons.push_pin_outlined,
    cupertino: CupertinoIcons.pin,
  ),
  pinFilled(
    material: Icons.push_pin,
    cupertino: CupertinoIcons.pin_fill,
  ),
  power(
    material: Icons.power_settings_new_outlined,
    cupertino: CupertinoIcons.power,
  ),
  printer(
    material: Icons.print_outlined,
    cupertino: CupertinoIcons.printer,
  ),
  printerFilled(
    material: Icons.print,
    cupertino: CupertinoIcons.printer_fill,
  ),
  qrcode(
    material: Icons.qr_code_outlined,
    cupertino: CupertinoIcons.qrcode,
  ),
  rocket(
    material: Icons.rocket_launch_outlined,
    cupertino: CupertinoIcons.rocket,
  ),
  rocketFilled(
    material: Icons.rocket_launch,
    cupertino: CupertinoIcons.rocket_fill,
  ),
  rotateLeft(
    material: Icons.rotate_left_outlined,
    cupertino: CupertinoIcons.rotate_left,
  ),
  rotateLeftFilled(
    material: Icons.rotate_left,
    cupertino: CupertinoIcons.rotate_left_fill,
  ),
  rotateRight(
    material: Icons.rotate_right_outlined,
    cupertino: CupertinoIcons.rotate_right,
  ),
  save(
    material: Icons.save,
    cupertino: Icons.save,
  ),
  scissors(
    material: Icons.content_cut,
    cupertino: CupertinoIcons.scissors,
  ),
  share(
    material: Icons.share_outlined,
    cupertino: CupertinoIcons.share,
  ),
  shareFilled(
    material: Icons.share,
    cupertino: CupertinoIcons.share_solid,
  ),
  shield(
    material: Icons.shield_outlined,
    cupertino: CupertinoIcons.shield,
  ),
  shieldFilled(
    material: Icons.shield,
    cupertino: CupertinoIcons.shield_fill,
  ),
  shift(
    material: Icons.keyboard_capslock_outlined,
    cupertino: CupertinoIcons.shift,
  ),
  shuffle(
    material: Icons.shuffle_outlined,
    cupertino: CupertinoIcons.shuffle,
  ),
  signature(
    material: Icons.draw_outlined,
    cupertino: CupertinoIcons.signature,
  ),
  speaker0(
    material: Icons.volume_mute_outlined,
    cupertino: CupertinoIcons.speaker,
  ),
  speaker0Filled(
    material: Icons.volume_mute,
    cupertino: CupertinoIcons.speaker_fill,
  ),
  speaker1(
    material: Icons.volume_down_outlined,
    cupertino: CupertinoIcons.speaker_1,
  ),
  speaker1Filled(
    material: Icons.volume_down,
    cupertino: CupertinoIcons.speaker_1_fill,
  ),
  speaker2(
    material: Icons.volume_up_outlined,
    cupertino: CupertinoIcons.speaker_2,
  ),
  speaker2Filled(
    material: Icons.volume_up,
    cupertino: CupertinoIcons.speaker_2_fill,
  ),
  speakerMute(
    material: Icons.volume_off_outlined,
    cupertino: CupertinoIcons.speaker_slash,
  ),
  speakerMuteFilled(
    material: Icons.volume_off,
    cupertino: CupertinoIcons.speaker_slash_fill,
  ),
  star(
    material: Icons.star_border_outlined,
    cupertino: CupertinoIcons.star,
  ),
  starFilled(
    material: Icons.star,
    cupertino: CupertinoIcons.star_fill,
  ),
  starHalf(
    material: Icons.star_half_outlined,
    cupertino: CupertinoIcons.star_lefthalf_fill,
  ),
  starHalfFilled(
    material: Icons.star_half,
    cupertino: CupertinoIcons.star_lefthalf_fill,
  ),
  stop(
    material: Icons.stop_outlined,
    cupertino: CupertinoIcons.stop,
  ),
  stopFilled(
    material: Icons.stop,
    cupertino: CupertinoIcons.stop_fill,
  ),
  table(
    material: Icons.table_chart_outlined,
    cupertino: CupertinoIcons.table,
  ),
  tableFilled(
    material: Icons.table_chart,
    cupertino: CupertinoIcons.table_fill,
  ),
  tag(
    material: Icons.local_offer_outlined,
    cupertino: CupertinoIcons.tag,
  ),
  tagFilled(
    material: Icons.local_offer,
    cupertino: CupertinoIcons.tag_fill,
  ),
  ticket(
    material: Icons.confirmation_number_outlined,
    cupertino: CupertinoIcons.ticket,
  ),
  ticketFilled(
    material: Icons.confirmation_number,
    cupertino: CupertinoIcons.ticket_fill,
  ),
  tv(
    material: Icons.tv_outlined,
    cupertino: CupertinoIcons.tv,
  ),
  tvFilled(
    material: Icons.tv,
    cupertino: CupertinoIcons.tv_fill,
  ),
  umbrella(
    material: Icons.umbrella_outlined,
    cupertino: CupertinoIcons.umbrella,
  ),
  videoCamera(
    material: Icons.videocam_outlined,
    cupertino: CupertinoIcons.videocam,
  ),
  videoCameraFilled(
    material: Icons.videocam,
    cupertino: CupertinoIcons.videocam_fill,
  ),
  wand(
    material: Icons.auto_fix_normal_outlined,
    cupertino: CupertinoIcons.wand_stars,
  ),
  wifi(
    material: Icons.wifi_outlined,
    cupertino: CupertinoIcons.wifi,
  ),
  rotateRightFilled(
    material: Icons.rotate_right,
    cupertino: CupertinoIcons.rotate_right_fill,
  ),
  removeFromBag(
    material: Icons.remove_shopping_cart_outlined,
    cupertino: CupertinoIcons.bag_badge_minus,
  ),
  removeFromBagFilled(
    material: Icons.remove_shopping_cart,
    cupertino: CupertinoIcons.bag_fill_badge_minus,
  ),
  download(
    material: Icons.download,
    cupertino: CupertinoIcons.down_arrow,
  ),
  downloadFile(
    material: Icons.file_download_outlined,
    cupertino: CupertinoIcons.arrow_down_doc,
  ),
  downloadFileFilled(
    material: Icons.file_download,
    cupertino: CupertinoIcons.arrow_down_doc_fill,
  ),
  uploadFile(
    material: Icons.file_upload_outlined,
    cupertino: CupertinoIcons.arrow_up_doc,
  ),
  uploadFileFilled(
    material: Icons.file_upload,
    cupertino: CupertinoIcons.arrow_up_doc_fill,
  ),
  settings(
    material: Icons.settings,
    cupertino: CupertinoIcons.settings,
  ),
  search(
    material: Icons.search,
    cupertino: CupertinoIcons.search,
  ),
  verified(
    material: Icons.verified_outlined,
    cupertino: CupertinoIcons.checkmark_seal,
  ),
  send(
    material: Icons.send_outlined,
    cupertino: CupertinoIcons.paperplane,
  ),
  back(
    material: Icons.arrow_back,
    cupertino: CupertinoIcons.back,
  ),
  forward(
    material: Icons.arrow_forward,
    cupertino: CupertinoIcons.forward,
  ),
  refresh(
    material: Icons.refresh,
    cupertino: CupertinoIcons.refresh,
  ),
  more(
    material: Icons.more_horiz,
    cupertino: CupertinoIcons.ellipsis,
  ),
  done(
    material: Icons.done,
    cupertino: CupertinoIcons.check_mark,
  ),
  zoomIn(
    material: Icons.zoom_in_outlined,
    cupertino: CupertinoIcons.zoom_in,
  ),
  zoomOut(
    material: Icons.zoom_out_outlined,
    cupertino: CupertinoIcons.zoom_out,
  );

  final IconData material;
  final IconData cupertino;

  const AdpIcons({ required this.material, required this.cupertino });
}

extension AdaptiveIconsEx on AdpIcons {
  IconData get platform {
    return adaptiveValue<IconData>(
      ios: () => cupertino,
      android: () => material,
    );
  }
}
