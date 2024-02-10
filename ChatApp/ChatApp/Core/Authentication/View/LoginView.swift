//
//  LoginView.swift
//  ChatApp
//
//  Created by Никита Котов on 26.10.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                appLogo
                
                textAndSecureFields
                forgotPasswordButton
                signInButton
                
                separatorLine
                
                signInVK
                
                Spacer()
                Divider()
                
                signUpButton
            }
        }
    }
}

#Preview {
    LoginView()
}

extension LoginView {
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
            
            SecureField("Введите Ваш пароль", text: $vm.password)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 24)
        }
    }
    
    private var forgotPasswordButton: some View {
        Button(action: {
            print("Forgot password")
        }, label: {
            Text("Забыли пароль?")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.trailing, 26)
        })
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private var signInButton: some View {
        Button(action: {
            Task { try await vm.login() }
        }, label: {
            Text("Войти")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 360, height: 44)
                .background(Color(.systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        .padding(.vertical)
    }
    
    private var line: some View {
        Rectangle().frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
    }
    
    private var separatorLine: some View {
        HStack {
            line
            Text("ИЛИ")
                .font(.footnote)
                .fontWeight(.semibold)
            line
        }
        .foregroundStyle(.gray)
    }
    
    private var signInVK: some View {
        HStack {
            Image("message-app-vk-logo")
                .resizable()
                .frame(width: 20, height: 20)
            
            Text("Продолжить через ВКонтакте")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.systemBlue))
        }
        .padding(.top, 8)
    }
    
    private var signUpButton: some View {
        NavigationLink {
            RegistrationView()
                .navigationBarBackButtonHidden()
        } label: {
            HStack(spacing: 3) {
                Text("Нету аккаунта?")
                
                Text("Зарегистрироваться")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
        }
        .padding(.vertical)
    }
}
