import 'package:json_annotation/json_annotation.dart';

// -----------------------------------------------------------------------------
// 1. TIMESTAMP CONVERTER (For 'created_at')
// -----------------------------------------------------------------------------
// Used for fields that ALWAYS exist and contain full time info (ISO 8601).
// Example input: "2025-12-01T07:17:39.100Z"

class PostgresTimestampConverter implements JsonConverter<DateTime, String> {
  const PostgresTimestampConverter();

  @override
  DateTime fromJson(String json) {
    // Parse the ISO string and convert to local time for UI display
    return DateTime.parse(json).toLocal();
  }

  @override
  String toJson(DateTime object) {
    // Convert back to UTC ISO string for API compatibility
    return object.toUtc().toIso8601String();
  }
}

// -----------------------------------------------------------------------------
// 2. DATE CONVERTER (For 'dob')
// -----------------------------------------------------------------------------
// Used for fields that might be NULL or "YYYY-MM-DD".
// Returns DateTime(1900, 1, 1) if the JSON value is null.

class PostgresDateConverter implements JsonConverter<DateTime, String?> {
  const PostgresDateConverter();

  @override
  DateTime fromJson(String? json) {
    // If null, return the "Default" date (Jan 1, 1900)
    if (json == null) {
      return DateTime(1900, 1, 1);
    }
    // Otherwise, parse the date string
    return DateTime.parse(json);
  }

  @override
  String? toJson(DateTime object) {
    // If it matches our "Default" date, send null back to the API
    if (object.year == 1900 && object.month == 1 && object.day == 1) {
      return null;
    }

    // Otherwise, format as YYYY-MM-DD
    final year = object.year.toString().padLeft(4, '0');
    final month = object.month.toString().padLeft(2, '0');
    final day = object.day.toString().padLeft(2, '0');
    return "$year-$month-$day";
  }
}