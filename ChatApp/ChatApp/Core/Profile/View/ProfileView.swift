//
//  ProfileView.swift
//  ChatApp
//
//  Created by Никита Котов on 27.10.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @StateObject var vm = ProfileViewModel()
    let user: User
    
    var body: some View {
        VStack {
            VStack {
                PhotosPicker(selection: $vm.selectedItem) {
                    if let profileImage = vm.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                    } else {
                        CircularProfileImageView(user: user, size: .xLarge)
                    }
                }
                
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundStyle(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                                .padding(.leading, 5)
                        }
                    }
                }
                
                Section {
                    Button("Выйти") {
                        AuthService.shared.signOut()
                    }
                    
                    Button("Удалить аккаунт") {
                        
                    }
                }
                .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USR)
}
