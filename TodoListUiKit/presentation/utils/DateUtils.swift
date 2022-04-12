//
//  DateUtils.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 11.04.2022.
//

import Foundation

class DateUtils {
    
    static func getDate() -> String {
        let date = Date()
        let calendar = Calendar.current
        let monthNumber = calendar.component(.month, from: date)
        let monthName = DateFormatter().monthSymbols[monthNumber - 1]
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        return "\(monthName) \(day), \(year)"
    }
}
