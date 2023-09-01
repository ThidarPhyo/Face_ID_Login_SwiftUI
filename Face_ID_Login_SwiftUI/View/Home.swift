//
//  Home.swift
//  Face_ID_Login_SwiftUI
//
//  Created by cmStudent on 2023/09/01.
//

import SwiftUI
import Firebase



struct Home: View {
    @State private var selectedTab = 0 // Add a state variable to track the selected tab
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Tab 1 (Status)
            Text("Status Content")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Status")
                }
                .tag(0) // Set the tag to 0 for Tab 1

            // Tab 2
            Text("Tab 2 Content")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Tab 2")
                }
                .tag(1) // Set the tag to 1 for Tab 2

            // Tab 3
            Text("Tab 3 Content")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Tab 3")
                }
                .tag(2) // Set the tag to 2 for Tab 3

            // Tab 4
            Notifications()
                .tabItem {
                    Image(systemName: "4.circle")
                    Text("Notifications")
                }
                .tag(3) // Set the tag to 0 for Tab 1 // Set the tag to 3 for Tab 4

            // Tab 5 (Profile)
            Profile()
                .tabItem {
                    Image(systemName: "5.circle")
                    Text("Profile")
                }
                .tag(4) // Set the tag to 4 for Tab 5
        }
        .navigationBarHidden(false)
        .preferredColorScheme(.light)
        .onAppear {
            // Set the selected tab to 0 when the view appears (Tab 1 - Status)
            selectedTab = 3
        }
    }
}
