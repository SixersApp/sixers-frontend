import 'package:logger/logger.dart';

final Logger log = Logger(
  printer: PrettyPrinter(methodCount: 0, errorMethodCount: 8, lineLength: 120, colors: true, printEmojis: true, printTime: false),
);

void logDebug(Object? message) => log.d(message);
void logInfo(Object? message) => log.i(message);
void logWarning(Object? message) => log.w(message);
void logError(Object? message, [StackTrace? stackTrace]) => log.e(message, stackTrace: stackTrace);
