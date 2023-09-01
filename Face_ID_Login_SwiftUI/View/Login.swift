//
//  Login.swift
//  Face_ID_Login_SwiftUI
//
//  Created by cmStudent on 2023/09/01.
//

import SwiftUI
import LocalAuthentication

struct Login: View {
    @StateObject var loginModel = LoginViewModel()
    
    // When the user first logs in via email, store this for future biometric login.
    @AppStorage("stored_User") var storedUser = ""
    @AppStorage("stored_Password") var storedPassword = ""
    
    @AppStorage("status") var logged = false
    
    @State var startAnimate = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer(minLength: 0)
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 35)
                        .padding(.vertical)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Login")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Please sign in to continue")
                                .foregroundColor(Color.white.opacity(0.5))
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.leading, 15)
                    
                    HStack {
                        Image(systemName: "envelope")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(width: 35)
                        
                        TextField("EMAIL", text: $loginModel.email)
                            .autocapitalization(.none)
                    }
                    .padding()
                    .background(Color.white.opacity(loginModel.email == "" ? 0 : 0.12))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "lock")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(width: 35)
                        
                        SecureField("PASSWORD", text: $loginModel.password)
                            .autocapitalization(.none)
                    }
                    .padding()
                    .background(Color.white.opacity(loginModel.password == "" ? 0 : 0.12))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack(spacing: 15) {
                        Button(action: loginModel.verifyUser) {
                            Text("LOGIN")
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 150)
                                .background(Color("pink"))
                                .clipShape(Capsule())
                        }
                        .opacity(loginModel.email != "" && loginModel.password != "" ? 1 : 0.5)
                        .disabled(loginModel.email != "" && loginModel.password != "" ? false : true)
                        .alert(isPresented: $loginModel.alert) {
                            Alert(
                                title: Text("Error"),
                                message: Text(loginModel.alertMsg),
                                dismissButton: .destructive(Text("Ok"))
                            )
                        }
                        
                        if loginModel.getBioMetricStatus() {
                            Button(action: loginModel.authenticateUser) {
                                // Getting biometric type...
                                Image(systemName: LAContext().biometryType == .faceID ? "faceid" : "touchid")
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color("pink"))
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .padding(.top)
                    
                    Button(action: {}) {
                        Text("Forget password?")
                            .foregroundColor(Color("pink"))
                    }
                    .padding(.top, 8)
                    .alert(isPresented: $loginModel.store_Info) {
                        Alert(
                            title: Text("Message"),
                            message: Text("Store Information For Future Login Using BioMetric Authentication ???"),
                            primaryButton: .default(Text("Accept")) {
                                // Storing Info For BioMetric...
                                storedUser = loginModel.email
                                storedPassword = loginModel.password
                                withAnimation {
                                    logged = true
                                }
                            },
                            secondaryButton: .cancel {
                                // Redirecting to Home
                                withAnimation {
                                    logged = true
                                }
                            }
                        )
                    }
                    
                    Spacer(minLength: 0)
                    
                    HStack(spacing: 5) {
                        Text("Don't have an account? ")
                            .foregroundColor(Color.white.opacity(0.6))
                        
                        Button(action: {}) {
                            Text("Signup")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("pink"))
                        }
                    }
                    .padding(.vertical)
                }
                .background(Color("bg").ignoresSafeArea(.all, edges: .all))
                .animation(startAnimate ? .easeOut : .none)
                
                if loginModel.isLoading {
                    Loading_Screen()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.startAnimate.toggle()
                }
            }
            .navigationTitle("Login") // Set the navigation title for Login view
        }
    }
}
