//
//  RegistrationView.swift
//  ChatApp
//
//  Created by Никита Котов on 26.10.2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var vm = RegistrationViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            
            Spacer()
            
            appLogo
            textAndSecureFields
            signUpButton
            
            Spacer()
            
            Divider()
            
            signInButton
        }
    }
}

#Preview {
    RegistrationView()
}

extension RegistrationView {
    private var appLogo: some View {
        Image("message-app-logo")
            .resizable()
            .clipShape(Circle())
            .scaledToFit()
            .frame(width: 150, height: 150)
            .padding()
            .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
    }
    
    private var textAndSecureFields: some View {
        VStack {
            TextField("Введите Вашу почту", text: $vm.email)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 24)
            
            TextField("Введите Ваше полное имя", text: $vm.fullName)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 24)
            
            SecureField("Введите Ваш пароль", text: $vm.password)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 24)
        }
    }
    
    private var signUpButton: some View {
        Button(action: {
            Task { try await vm.createUser() }
        }, label: {
            Text("Зарегистрироваться")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 360, height: 44)
                .background(Color(.systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        .padding(.vertical)
    }
    
    private var signInButton: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 3) {
                Text("Уже есть аккаунт?")
                
                Text("Войти")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
        }
        .padding(.vertical)
    }
}
