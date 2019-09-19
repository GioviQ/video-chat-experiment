import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message('Video Chat Experiment',
        name: 'title', desc: 'The application title');
  }

  String get start {
    return Intl.message('Start',
        name: 'start', desc: 'The button title to connect');
  }

  String get insertNickname {
    return Intl.message('Insert your nickname',
        name: 'insertNickname');
  }

  String get nobodyConnected {
    return Intl.message('No one is currently connected',
        name: 'nobodyConnected');
  }

  String get free {
    return Intl.message('Free',
        name: 'free');
  }

  String get busy {
    return Intl.message('Busy',
        name: 'busy');
  }

  String get serviceNotAvailable {
    return Intl.message('Service not available.\nPlease try later.',
        name: 'serviceNotAvailable');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'it'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}