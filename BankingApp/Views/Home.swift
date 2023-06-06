//
//  Home.swift
//  BankingApp
//
//  Created by Hari krishna on 03/12/22.
//

import SwiftUI

struct Home: View {
    @State var principleAmount: Double = 0.0
    @State var rateOfInterest: Double = 0.0
    @State var numberOfYears: Double = 0.0
    @State var calculatedAmount: Double = 0.0
    @State var showAlert = false
    var body: some View {
        Form {
            Section {
                TextField("Principle Amount", value: $principleAmount, format: .number)
            } header: {
                Text("Principle Amount")
            }

            
            Section {
                TextField("Enter Rate of Interest", value: $rateOfInterest, format: .number)
            } header: {
                Text("Rate of Interest")
            }
            
            Section {
                
                TextField("Enter number of years", value: $numberOfYears, format: .number)
                
            } header: {
                Text("Number of Years")
            }
            
            Section {
                VStack {
                    
                    Text("Calculated Interest: \(calculatedAmount.formatted(.number.precision(.fractionLength(2))))")
                    
                    Button {
                        
                        if principleAmount == 0.0 ||  rateOfInterest == 0.0 || numberOfYears == 0.0 {
                            showAlert = true
                        } else {
                            calculatedAmount = ((principleAmount) * (rateOfInterest) * (numberOfYears)) / 100
                        }
                        
                        
                    } label: {
                        Text("Calculate")
                    }
                    .alert("Missing fields", isPresented: $showAlert) {
                        Button("Alright") {
                            
                        }
                    } message: {
                        Text("Required fields are missing")
                    }

                    
                }
                

            } header: {
                Text("Results")
            }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
