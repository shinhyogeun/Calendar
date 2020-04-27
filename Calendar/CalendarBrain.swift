//
//  CalendarBrain.swift
//  Calendar
//
//  Created by 신효근 on 2020/04/24.
//  Copyright © 2020 신효근. All rights reserved.
//

import Foundation

struct CalenderBrain {

    var monthLenght = [31,29,31,30,31,30,31,31,30,31,30,31]
    var curruntYear = Calendar.current.component(.year, from: Date())
    var curruntMonth = Calendar.current.component(.month, from: Date())
    var cuuruntDay = Calendar.current.component(.day, from: Date())

    func curruntMonthName() -> String {
       return Calendar.current.monthSymbols[curruntMonth - 1]
    }
    func nextMonthName() -> String {
        if curruntMonth == 12 {
         return Calendar.current.monthSymbols[0]
        }else{
         return Calendar.current.monthSymbols[curruntMonth]
        }
    }
    
    func curruntMothLength() -> Int {
        return monthLenght[curruntMonth-1]
    }
    
}
