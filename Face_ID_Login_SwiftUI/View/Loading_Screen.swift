//
//  Loading_Screen.swift
//  Face_ID_Login_SwiftUI
//
//  Created by cmStudent on 2023/09/01.
//

import SwiftUI

struct Loading_Screen: View {
    @State var animate = false
    var body: some View {
        
        ZStack{
            
            Color.black.opacity(0.3)
                .ignoresSafeArea(.all, edges: .all)
            
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(Color("pink"),lineWidth: 10)
                .frame(width: 60, height: 60)
                .rotationEffect(.init(degrees: animate ? 360 : 0))
                .padding(40)
                .background(Color.white)
                .cornerRadius(15)
        }
        .onAppear(perform: {
            withAnimation(Animation.linear.speed(0.6).repeatForever(autoreverses: false)){
                animate.toggle()
            }
        })
    }
}
