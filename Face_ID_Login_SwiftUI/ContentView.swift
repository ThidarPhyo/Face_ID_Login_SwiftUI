//
//  ContentView.swift
//  Face_ID_Login_SwiftUI
//
//  Created by cmStudent on 2023/09/01.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @AppStorage("status") var logged = false
    var body: some View {

        NavigationView{
            
            if logged{
                
                Home()
                    .navigationBarHidden(false)
                    .preferredColorScheme(.light)
            }
            else{
                
                Login()
                    .navigationBarHidden(true)
                    .preferredColorScheme(.dark)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
