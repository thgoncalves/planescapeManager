//
//  AuthView.swift
//  firebaseTest
//
//  Created by Thiago Pinto on 2024-05-07.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices

struct SignInWithAppleButtonViewRepresentable: UIViewRepresentable{
    
    let type: ASAuthorizationAppleIDButton.ButtonType
    let style: ASAuthorizationAppleIDButton.Style
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        ASAuthorizationAppleIDButton(authorizationButtonType: type, authorizationButtonStyle: style)
    }
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}

struct AuthView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var showSigninView: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 10) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                
                Button(action: {
                    Task{
                        do{
                            try await viewModel.signInAnonymous()
                            showSigninView = false
                        }catch{
                            print(error)
                        }
                    }
                }) {
                    Text("LOGIN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                Button(action: {
                    Task{
                        do{
                            try await viewModel.signInAnonymous()
                            showSigninView = false
                        }catch{
                            print(error)
                        }
                    }
                }, label: {
                    Text("Sign In Anonymously")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.red)
                        .cornerRadius(10)
                })
                GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .icon, state: .normal)){
                    Task{
                        do{
                            try await viewModel.signInGoogle()
                            showSigninView = false
                        }catch{
                            print(error)
                        }
                    }
                    
                }
                .padding()
            }
            
            HStack {
                VStack { Divider().background(Color.gray) }.frame(height: 1)
                Text("OR")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                VStack { Divider().background(Color.gray) }.frame(height: 1)
            }
            HStack {
                Text("Don't have an account?")
                Button(action: {
                    // Handle sign up action
                }) {
                    Text("Sign up")
                        .foregroundColor(.orange)
                }
            }
            
            Button(action: {
                // Handle forgot password action
            }) {
                Text("Forgot?")
                    .foregroundColor(.gray)
            }
            
        }
        .padding()
    }}


#Preview {
    NavigationStack{
        AuthView(showSigninView: .constant(true))
    }
}
