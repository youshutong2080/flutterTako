import 'dart:math';

humanSize(int bytes) {
  const List MAGS = ['K','M','G','T','P','E','Z','Y'];

  var magnitude = min(log(bytes) / log(1024), MAGS.length - 1);
  var result = bytes / pow(1024, magnitude);
  var suffix = MAGS[magnitude].trim();
  return result.toString() + suffix;
}