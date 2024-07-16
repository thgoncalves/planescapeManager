//
//  RootView.swift
//  firebaseTest
//
//  Created by Thiago Pinto on 2024-05-07.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack{
            if !showSignInView {
                NavigationStack{
                    HomeView()
                }
            }
        }
        .onAppear{
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil ? true: false
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack{
                AuthView(showSigninView: $showSignInView)
            }
        })
    }
}

#Preview {
    RootView()
}
