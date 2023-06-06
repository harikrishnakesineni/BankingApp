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
                Image("lvslogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
            } header: {
                Text("Company Logo")
            }
            
            Section {
                VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "Ocean", withExtension: ".mp4")!))
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
