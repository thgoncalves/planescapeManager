//
//  ProfileViewModel.swift
//  Planescape Manager
//
//  Created by Thiago Pinto on 2024-06-15.
//

import SwiftUI


@MainActor
final class ProfileViewModel: ObservableObject{
    @Published private(set) var user: AuthDataResultModel? = nil
    
    func loadCurrentUser() throws{
        self.user = try AuthenticationManager.shared.getAuthenticatedUser()
    }
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
