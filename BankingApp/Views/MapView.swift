//
//  Map.swift
//  BankingApp
//
//  Created by Hari krishna on 03/12/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var viewModel = MapViewModel()
    
    var body: some View {
        
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
    }
}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
