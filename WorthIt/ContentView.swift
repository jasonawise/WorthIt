//
//  ContentView.swift
//  WorthIt
//
//  Created by Jason Wise on 7/22/21.
//

import SwiftUI

struct ContentView: View {
    func secondsToHoursMinsSecs(seconds: Double) -> (Double, Double, Double) {
        let (hr,  minf) = modf (seconds / 3600)
        let (min, secf) = modf (60 * minf)
        return (hr, min, 60 * secf)
    }
    func decimalHourToSeconds(hours: Double) -> (Double) {
        return hours * 3600
    }
    @State private var amount = ""
    var worthItAmount:  String {
        let perHourSalary = Double(30.79)
        let costOfProduct = Double(amount) ?? 0
        let decimalHours = costOfProduct / perHourSalary
        let (seconds) = decimalHourToSeconds(hours: decimalHours)
        let (hr, min, _) = secondsToHoursMinsSecs(seconds: seconds)
        return  ("\(Int(hr)) Hours, \(Int(min)) Mins")
    }
    var body: some View {
        Form {
            Section {
                Text("What is the cost of what you want to get?")
                TextField("$ Amount", text: $amount).keyboardType(.decimalPad)
            }
            Section {
                Text("You will need to work")
                Text("\(worthItAmount) hours to get it")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
