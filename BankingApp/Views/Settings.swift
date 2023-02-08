//
//  Settings.swift
//  BankingApp
//
//  Created by Hari krishna on 03/12/22.
//

import SwiftUI
import UserNotifications

struct Settings: View {


    @EnvironmentObject private var userModel: UserModel
    @State private var errorMessage: String = ""
    @State private var isUserLogout = false
    
    var body: some View {
        NavigationView {
            Form {

                    Section {
                        if userModel.token.isEmpty  {
                            NavigationLink(destination: LoginView()) {
                                Text("Login")
                            }
                            
                        } else {
                            VStack() {
                                HStack {
                                    Text("Welcome \(userModel.user.firstName)")
                                    
                                }
                                NavigationLink(destination: UserListView()) {
                                    Text("Get All Users")
                                }
                            }
                            .toolbar() {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button("Log out") {
                                        isUserLogout = true
                                        userModel.logOut()
                                    }
                                }
                            }
                        }


                    } header: {
                        Text("Login Info")
                    }
                    
                
                
                    
                    Section {
                        VStack {
                            Button {
                                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                    if success {
                                        print("request granted")
                                    } else if let error = error {
                                        print(error.localizedDescription)
                                        
                                    }
                                }
                            } label: {
                                Text("Request Permission")
                            }
                            
                            Spacer()
                            
                            Button {
                                let content = UNMutableNotificationContent()
                                content.title = "Notification Title"
                                content.subtitle = "Sending notifications to user"
                                content.sound = UNNotificationSound.default
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                
                                UNUserNotificationCenter.current().add(request)
                                
                            } label: {
                                Text("Schedule notification")
                            }


                        }
                        
                        
                    } header: {
                        Text("Notificaitons")
                    }
                    
                    
                    
                
            }
            .navigationTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
