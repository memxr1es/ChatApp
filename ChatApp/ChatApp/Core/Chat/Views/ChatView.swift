//
//  ChatView.swift
//  ChatApp
//
//  Created by Никита Котов on 27.10.2023.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var vm: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._vm = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            VStack {
                CircularProfileImageView(user: user, size: .xLarge)
                
                VStack(spacing: 4 ) {
                    Text(user.fullname)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("Собеседник")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
            }
            
            ScrollView {
                LazyVStack {
                    ForEach(vm.messages) { message in
                        ChatMessageCell(message: message)
                    }
                }
            }
        }
        
        Spacer()
        
        ZStack(alignment: .trailing) {
            TextField("Сообщение...", text: $vm.messageText, axis: .vertical)
                .padding(12)
                .padding(.trailing, 90)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
                .font(.subheadline)
            
            Button {
                vm.sendMessage()
                vm.messageText = ""
            } label: {
                Text("Отправить")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)

        }
        .padding()
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.MOCK_USR)
}
 
