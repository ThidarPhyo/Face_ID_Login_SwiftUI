//
//  Profile.swift
//  Face_ID_Login_SwiftUI
//
//  Created by cmStudent on 2023/09/01.
//

import SwiftUI
import Firebase

struct Profile: View {
    @AppStorage("status") var logged = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 15) {
                    Image("becky")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 340)
                        .scaledToFit()
                    Spacer()
                    Text("User Logged In As \(Auth.auth().currentUser?.email ?? "")")
                    
                    Text("User UID \(Auth.auth().currentUser?.uid ?? "")")
                    
                    Spacer()
                    
                    Button(action: {
                        try! Auth.auth().signOut()
                        withAnimation {
                            logged = false
                        }
                    }) {
                        Text("LogOut")
                            .fontWeight(.heavy)
                    }
                    .frame(width: UIScreen.main.bounds.width / 2, height: 44)
                    .background(Color("pinkGrey"))
                    .cornerRadius(12)
                    
                    Spacer()
                }
                
                // Circular Image
                Image("becky_1")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 5)
                    .offset(x: 0,y:0) // Adjust the offset as needed
                    
            }
            .navigationBarTitle("Profile", displayMode: .large)
        }
    }
}

