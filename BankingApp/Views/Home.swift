//
//  Home.swift
//  BankingApp
//
//  Created by Hari krishna on 03/12/22.
//

import SwiftUI

struct Home: View {
    @State var principleAmount = ""
    @State var rateOfInterest = ""
    @State var numberOfYears = ""
    @State var calculatedAmount: Double = 0.0
    @State var showAlert = false
    var body: some View {
        Form {
            Section {
                TextField("Principle Amount", text: $principleAmount)
            } header: {
                Text("Principle Amount")
            }

            
            Section {
                TextField("Enter Rate of Interest", text: $rateOfInterest)
            } header: {
                Text("Rate of Interest")
            }
            
            Section {
                
                TextField("Enter number of years", text: $numberOfYears)
                
            } header: {
                Text("Number of Years")
            }
            
            Section {
                VStack {
                    
                    Text("Calculated Amount \(String(format: "%.2f", calculatedAmount))")
                    
                    Button {
                        
                        if principleAmount.isEmpty ||  rateOfInterest.isEmpty || numberOfYears.isEmpty {
                            showAlert = true
                        } else {
                            calculatedAmount = (Double(principleAmount)! * Double(rateOfInterest)! * Double(numberOfYears)!) / 100
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
