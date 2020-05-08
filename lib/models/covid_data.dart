class CovidData {
  int _confirmed;
  int _deaths;
  int _recovered;
  String _date;

  CovidData(this._confirmed, this._recovered, this._deaths, this._date);

  factory CovidData.fromJson(Map<String, dynamic> parsedJson) {
    return CovidData(
      parsedJson['Confirmed'],
      parsedJson['Recovered'],
      parsedJson['Deaths'],
      parsedJson['Date'],
    );
  }

  int get confirmed => _confirmed;
  int get deaths => _deaths;
  int get recovered => _recovered;
  String get date {
    DateTime dataDate = DateTime.tryParse(_date);
    return '${_getMonth(dataDate.month)} ${dataDate.day}, ${dataDate.year}';
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
    }
  }
}
