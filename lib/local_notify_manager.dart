import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class LocalNotifyManager{
  //////////////////INITILALISASI NOTIFIKASI////////////////
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var initSetting;
  BehaviorSubject<ReceivedNotification> get didReceiveLocalNotificationSubject =>
   BehaviorSubject<ReceivedNotification>();

  final BehaviorSubject<String> selectNotificationSubject =
  BehaviorSubject<String>();

  MethodChannel platform =
  MethodChannel('dexterx.dev/flutter_local_notifications_example');

  LocalNotifyManager.init() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS){
      requestIOSPermission();
    }
    initializePlatform();

  }
  requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  initializePlatform() {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification:
            (int id, String title, String body, String payload) async {
          didReceiveLocalNotificationSubject.add(ReceivedNotification(
              id: id, title: title, body: body, payload: payload));
        });
    initSetting = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initSetting,
        onSelectNotification: (String payload) async {
          if (payload != null) {
            debugPrint('notification payload: $payload');
          }
          selectNotificationSubject.add(payload);
        });
  }

  Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    // final String timeZoneName = await platform.invokeMethod('getTimeZoneName');
    tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));
  }
  //////////////////////////////////////////////////////////////////////////
  ////////////////////////////DAFTAR NOTIFIKASI////////////////////////////
  Future<void> scheduleDailyNotificationOf06() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        'Waktu Makan',
        'Waktu Makan',
        _nextInstance(06),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description',
              styleInformation: BigTextStyleInformation(
                ' Ayo mengonsumsi roti atau oatmeal!!',
                htmlFormatBigText: true,
                contentTitle: 'Ayo!! <b>Waktunya Makan</b>',
                htmlFormatContentTitle: true,
                summaryText: 'Jaga kesehatan <i>dengan makan rutin</i>',
                htmlFormatSummaryText: true,
              ),
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker'
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> scheduleDailyNotificationOf12() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        'Waktu Makan',
        'Waktu Makan',
        _nextInstance(12),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description',
              styleInformation: BigTextStyleInformation(
                ' Ayo mengonsumsi nasi tapi dengan\n porsi normal disertai sayuran Dan protein seperti ikan atau telor!!',
                htmlFormatBigText: true,
                contentTitle: 'Ayo!! <b>Waktunya Makan</b>',
                htmlFormatContentTitle: true,
                summaryText: 'Jaga kesehatan <i>dengan makan rutin</i>',
                htmlFormatSummaryText: true,
              ),
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker'
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> scheduleDailyNotificationOf18() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        3,
        'Waktu Makan',
        'Waktu Makan',
        _nextInstance(18),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description',
              styleInformation: BigTextStyleInformation(
                ' Kurangi kadar gula seperti mengurangi porsi nasi atau menggantinya dengan buah!!',
                htmlFormatBigText: true,
                contentTitle: 'Ayo!! <b>Waktunya Makan</b>',
                htmlFormatContentTitle: true,
                summaryText: 'Jaga kesehatan <i>dengan makan rutin</i>',
                htmlFormatSummaryText: true,
              ),
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker'
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> scheduleWeeklyMondayNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        4,
        'Olahraga',
        'Olahraga',
        _nextInstanceOfMonday(05),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'weekly notification channel id',
              'weekly notification channel name',
              'weekly notificationdescription',
              styleInformation: BigTextStyleInformation(
                ' Ayo olahraga untuk menjaga jantung sehat',
                htmlFormatBigText: true,
                contentTitle: 'Ayo!! <b>Olahraga</b>',
                htmlFormatContentTitle: true,
                summaryText: 'Jaga kesehatan <i>dengan olahraga rutin</i>',
                htmlFormatSummaryText: true,
              ),
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker'
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
  }
//////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////PENGATURAN WAKTU NOTIFIKASI////////////////
  tz.TZDateTime _nextInstance(time) {
    final tz.TZDateTime now =  tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, time);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  tz.TZDateTime _nextInstanceOfMonday(time) {
    tz.TZDateTime scheduledDate = _nextInstance(time);
    while (scheduledDate.weekday != DateTime.monday) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
//////////////////////////////////////////////////////////////////////////////////
  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

}
////////////////VARIABEL NOTIFIKASI MANAJER////////////////////////////////////
LocalNotifyManager localNotifyManager = LocalNotifyManager.init();
/////////////////////////////OBJEK NOTIFIKASI MANAJER////////////////////////////////
class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;
  ReceivedNotification({ @required this.id, @required this.title, @required this.body, @required this.payload});
}