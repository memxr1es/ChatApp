//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by Никита Котов on 30.10.2023.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messageText: String = ""
    @Published var messages = [Message]()

    let service: ChatService
    
    init(user: User) {
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages() {
        service.observeMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage() {
        service.sendMessage(messageText)
    }
    
}
