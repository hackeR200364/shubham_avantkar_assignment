int daysUntilEndOfMonth() {
  // Get today's date
  DateTime today = DateTime.now();

  // Get the last day of the current month
  DateTime lastDayOfMonth = DateTime(today.year, today.month + 1, 0);

  // If it's December, make sure the next month is January of the next year
  if (today.month == 12) {
    lastDayOfMonth = DateTime(today.year + 1, 1, 0); // Last day of December
  }

  // Calculate the difference in days
  return lastDayOfMonth.difference(today).inDays + 1;
}
