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
    
    func nextMonthLength() -> Int {
        return monthLenght[curruntMonth]
    }
    
    //    하나의 함수를 만들어서 거기 안에서 0앞에 있는 것들도 만들어주고 그걸 또 array에 넣어서 반화해주는 걸로 만들자.
    func optimaize(month : Int) -> Array<Int?> {
        let calendar = Calendar.current
        let dateComponents = DateComponents(calendar: calendar,year:2020, month: month, day: 1)
        let composedData = calendar.date(from: dateComponents)
        let howManyNilIHavetoPut = calendar.component(Calendar.Component.weekday, from: composedData!) - 1
        var realData : Array<Int?> = []
        
        for _ in 1...howManyNilIHavetoPut {
            realData.append(0)
        }
        
        let nextMonthDateComponents = DateComponents(calendar: calendar,year:2020, month: month + 1, day: 1)
        let nextMonthComposedData = calendar.date(from: nextMonthDateComponents)
        let thisMonthLastDay = Date(timeInterval: -1, since: nextMonthComposedData!)
        let howLongMonthThatYouChoose =  calendar.component(Calendar.Component.day, from: thisMonthLastDay)
        
        for i in 1...howLongMonthThatYouChoose{
            realData.append(i)
        }
        return realData
    }
    
}
