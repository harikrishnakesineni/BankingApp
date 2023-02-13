//
//  Company.swift
//  BankingApp
//
//  Created by Hari krishna on 03/12/22.
//

import SwiftUI
import AVKit

struct Company: View {
    let urlString = "https://bit.ly/swswift"
    var body: some View {
        Form {
            Section {
                Label("Welcome Hari Krishna", systemImage: "person.fill")
            } header: {
                Text("UserInfo")
            }
            
            Section {
                Image("Gus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
            } header: {
                Text("Company Logo")
            }
            
            Section {
                VideoPlayer(player: AVPlayer(url:  URL(string: urlString)!))
                    .frame(width: 400, height: 300)
            } header: {
                Text("More Info")
            }

        }
    }
            
        }
    


struct Company_Previews: PreviewProvider {
    static var previews: some View {
        Company()
    }
}
