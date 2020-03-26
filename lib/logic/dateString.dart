class CheckDate {
  final DateTime _timeof;
  int nowd, nowm, nowy, nowh, nowMin, nows, diff;
  String monthsAgo, daysAgo, hoursAgo, minAgo, yearsAgo, monthName;

  CheckDate(this._timeof);
  formMonth() {
    switch (getMonth().toString()) {
      case '1':
        monthName = "Jan";
        break;
      case '2':
        monthName = "Feb";
        break;
      case '3':
        monthName = "Mar";
        break;
      case '4':
        monthName = "April";
        break;
      case '5':
        monthName = "May";
        break;
      case '6':
        monthName = "June";
        break;
      case '7':
        monthName = "July";
        break;
      case '8':
        monthName = "Aug";
        break;
      case '9':
        monthName = "Sep";
        break;
      case '10':
        monthName = "Oct";
        break;
      case '11':
        monthName = "Nov";
        break;
      case '12':
        monthName = "Dec";
        break;
      default:
        monthName = getMonth().toString();
        break;
    }
    return monthName;
  }

  //get all components of the datestimestamp
  getDay() {
    return _timeof.day;
  }

  getWeekDay() {
    return _timeof.weekday;
  }

  getMonth() {
    return _timeof.month;
  }

  getYear() {
    return _timeof.year;
  }

  getHour() {
    return _timeof.hour;
  }

  getMin() {
    return _timeof.minute;
  }

  getSecs() {
    return _timeof.second;
  }

  computeDateString() {
    nowd = DateTime.now().day;
    nowy = DateTime.now().year;
    nowm = DateTime.now().month;

    nowh = DateTime.now().hour;
    nowMin = DateTime.now().minute;
    nows = DateTime.now().second;

    if (nowy == this.getYear()) {
      if (nowm > this.getMonth()) {
        monthsAgo = (nowm - this.getMonth() == 1)
            ? formMonth() + " " + getDay().toString()
            : (nowm - this.getMonth()).toString() + " months Ago";
        return monthsAgo;
      } else {
        if (nowd > this.getDay()) {
          daysAgo = (nowd - this.getDay() == 1)
              ? "Yesterday"
              : (nowd - this.getDay()).toString() + "d";
          return daysAgo;
        } else {
          if (nowh > this.getHour()) {
            hoursAgo = (nowh - this.getHour() == 1)
                ? "1h"
                : (nowh - this.getHour()).toString() + " h";
            return hoursAgo;
          } else {
            if (nowMin > this.getMin()) {
              minAgo = (nowMin - this.getMin() == 1)
                  ? "1m"
                  : (nowMin - this.getMin()).toString() + " m";
              return minAgo;
            } else {
              return "Just Now";
            }
          }
        }
      }
    } else {
      //for nowy
      if (nowy - this.getYear() > 1) {
        yearsAgo = (nowy - this.getYear() == 1)
            ? "Last Year"
            : (nowy - this.getYear()).toString() + " Years Ago";
        return yearsAgo;
      } else {
        diff = nowm + 12 - this.getMonth();
        monthsAgo = (diff == 1)
            ? getDay().toString() +
                " " +
                formMonth() +
                " " +
                getYear().toString()
            : getDay().toString() +
                " " +
                formMonth() +
                " " +
                getYear().toString();
        return monthsAgo;
      }
    }
  }
}
