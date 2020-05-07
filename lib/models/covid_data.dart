class CovidData {
  int _confirmed;
  int _deaths;
  int _recovered;

  CovidData(this._confirmed, this._recovered, this._deaths);

  factory CovidData.fromJson(Map<String, dynamic> parsedJson) {
    return CovidData(
      parsedJson['Confirmed'],
      parsedJson['Recovered'],
      parsedJson['Deaths'],
    );
  }

  int get confirmed => _confirmed;
  int get deaths => _deaths;
  int get recovered => _recovered;
}
