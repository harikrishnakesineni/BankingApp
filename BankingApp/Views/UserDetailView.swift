//
//  UserDetailView.swift
//  BankingApp
//
//  Created by Hari krishna on 18/01/23.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    @State private var editMode: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text("\(user.firstName) \(user.lastName)")
                    .bold()
                
            }
           
            
            Text(user.email)
            Text(user.phone)
            
            Spacer()
            
            
        }.padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") {
                        editMode = true
                    }
                }
            }
            .sheet(isPresented: $editMode) {
//                    NavigationView {
                    EditUserView(user: user)
             //   }
            }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User.defaultUser())
    }
}
