//
//  ContentView.swift
//  ChatApp
//
//  Created by Никита Котов on 26.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ContentViewModel()
    
    var body: some View {
        Group {
            if vm.userSession != nil {
                InboxView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
