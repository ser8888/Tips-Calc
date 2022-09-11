//
//  ContentView.swift
//  Tips Calc
//
//  Created by Sergejs Tiselskis on 11/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var guestNumber = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerGuest: Double {
        let guestNumber = Double(guestNumber + 2 )
        let tipSelection = Double(tipPercentages[tipPercentage])
        let billTotal = Double(checkAmount) ?? 0
        let tipValue = billTotal / 100 * tipSelection
        let grandTotal = billTotal + tipValue
        let amountPerGuest = grandTotal / guestNumber
        
        return amountPerGuest
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .foregroundStyle(.indigo)
                    Picker("Number of guests", selection:
                            $guestNumber) {
                            ForEach(2..<100) {
                            Text("\($0) guests")
                        }
                    }
                }
                Section(header: Text("Tips you want to leave in total?"))
                {
                    Picker("Tip %%", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(totalPerGuest, specifier: "%.2f")")
                        .bold()
                        .font(.largeTitle)
                }
            }
            .navigationTitle("Tips calculation")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
