import UIKit


let calendar = Calendar.current
let rightnow = Date()
let dateComponents = DateComponents(calendar: calendar,year:2020, month: 4, day: 1)
let composedData = calendar.date(from: dateComponents)

let dateFormatter = DateFormatter()
dateFormatter.setLocalizedDateFormatFromTemplate("d")
var b = dateFormatter.string(from: Date())
dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
dateFormatter.date(from:)
var monthLenght = [31,29,31,30,31,30,31,31,30,31,30,31]

dateFormatter.string(from: composedData!)

var real = Date(timeInterval: -1, since: composedData!)
dateFormatter.setLocalizedDateFormatFromTemplate("d")
dateFormatter.string(from: real)


func cal(a : Int) -> String {
    var sum = 0
    for i in 0...a-1 {
        sum = sum + monthLenght[i]
    }
    sum  = sum + Int(b)! - 1
    return dateFormatter.string(from: Date(timeIntervalSinceNow: TimeInterval(sum * -86400)))
}

cal(a: 4)
