//
//  Date_extension.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 10/23/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import Foundation

extension Date {

    func toString() -> String {

        // prints "March 3, 2015"
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .none

        let dateString = formatter.string(from: self)

        return dateString
    }


    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: date, to: self).weekOfYear ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return "error. try switching order of dates."
    }
    /// Returns a custom time interval description from now, in this format: "5 years, 2 months"
    func toAge() -> String {

        let date = self
        let now: Date = Date()
        let yearsOld = now.years(from: date)
        let totalMonthsOld = now.months(from: date)
        let monthsOldRemainder = (totalMonthsOld)-(yearsOld * 12)

        // single or plural:
        let monthWord = (monthsOldRemainder == 1 ? "month" : "months")
        let yearWord = (yearsOld == 1 ? "year" : "years")

        if totalMonthsOld < 12 {
            return "\((totalMonthsOld)) \(monthWord)"
        }

        return "\(yearsOld) \(yearWord), \((totalMonthsOld)-(yearsOld * 12)) \(monthWord)"

    }


    /// Returns a custom time interval description from now, in a format parents use to describe their young children in USA, e.g., '16 weeks.', '18 months', etc.
    func toBabyAge() -> String {

        // TODO: FIX this, this simply mirrors toAge() above at the moment.

        let date = self
        let now: Date = Date()
        let yearsOld = now.years(from: date)
        let totalMonthsOld = now.months(from: date)
        let monthsOldRemainder = (totalMonthsOld)-(yearsOld * 12)

        // single or plural:
        let monthWord = (monthsOldRemainder == 1 ? "month" : "months")
        let yearWord = (yearsOld == 1 ? "year" : "years")

        if totalMonthsOld < 12 {
            return "\((totalMonthsOld)) \(monthWord)"
        }

        return "\(yearsOld) \(yearWord), \((totalMonthsOld)-(yearsOld * 12)) \(monthWord)"

    }



}
