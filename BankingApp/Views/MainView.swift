//
//  MainView.swift
//  BankingApp
//
//  Created by Hari krishna on 03/12/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            Company()
                .tabItem {
                    Label("Company", systemImage: "chevron.compact.down")
                }
            
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            Settings(loginViewModel: loginViewModel)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(loginViewModel: LoginViewModel())
    }
}
