//
//  AuthViewModel.swift
//  firebaseTest
//
//  Created by Thiago Pinto on 2024-05-08.
//

import Foundation

@MainActor
final class AuthenticationViewModel: ObservableObject{
    
    func signInGoogle() async throws{
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        
        let authDataResult = try await AuthenticationManager.shared.sigInWithGoogle(tokens: tokens)
//        let user = DBUser(auth: authDataResult)
//        try await UserManager.shared.createNewUser(user: user)
        
    }
    
    func signInApple() async throws{

    }
    
    func signInAnonymous() async throws{
        let authDataResult = try await AuthenticationManager.shared.signInAnonymous()
//        let user = DBUser(auth: authDataResult)
//        try await UserManager.shared.createNewUser(user: user)

    }
}
