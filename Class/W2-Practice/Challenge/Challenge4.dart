class Distance {
  final double _meter;
  Distance(this._meter);
  // Name constructor
  const Distance.cms(double cms) : _meter = cms * 0.01;
  const Distance.meter(double meter) : _meter = meter;
  const Distance.kms(double kms) : _meter = kms * 1000;

  Distance operator +(Distance other) {
    return Distance.meter(this._meter + other._meter);
  }

  //getter
  double get toCms {
    return _meter * 100;
  }

  double get toMeter {
    return _meter;
  }

  double get toKms {
    return _meter * 0.001;
  }
}

void main() {
  Distance d1 = Distance.cms(3.4);
  Distance d2 = Distance.meter(1000);
  print(d1.toMeter);
  print((d1 + d2).toKms);
}


