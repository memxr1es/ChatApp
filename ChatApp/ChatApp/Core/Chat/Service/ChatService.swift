//
//  ChatService.swift
//  ChatApp
//
//  Created by Никита Котов on 31.10.2023.
//

import Foundation
import Firebase

struct ChatService {
       
    let chatPartner: User
    
    func sendMessage(_ messageText: String) {
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        let chatPartnerID = chatPartner.id
        
        let currentUserRef = FirestoreConstants.MessagesCollection.document(currentUID).collection(chatPartnerID).document()
        let chatPartnerRef = FirestoreConstants.MessagesCollection.document(chatPartnerID).collection(currentUID)
        
        let recentCurrentUserRef = FirestoreConstants.MessagesCollection.document(currentUID).collection("recent-messages").document(chatPartnerID)
        let recentPartnerRef = FirestoreConstants.MessagesCollection.document(chatPartnerID).collection("recent-messages").document(chatPartnerID)
        
        let messageID = currentUserRef.documentID
        
        let message = Message(
            messageID: messageID,
            fromID: currentUID,
            toID: chatPartnerID,
            messageText: messageText,
            timestamp: Timestamp()
        )
        
        print("Message text: \(messageText)")
        print("Message model: \(message)")
        
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageID).setData(messageData)
        
        recentCurrentUserRef.setData(messageData)
        recentPartnerRef.setData(messageData)
    }
    
    func observeMessages(completion: @escaping([Message]) -> Void) {
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        let chatPartnerID = chatPartner.id
        
        let query = FirestoreConstants.MessagesCollection.document(currentUID).collection(chatPartnerID).order(by: "timestamp", descending: false)
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap({ try? $0.document.data(as: Message.self )})
            
            for (index, message) in messages.enumerated() where message.fromID != currentUID {
                messages[index].user = chatPartner
            }
            
            completion(messages)
        }
    }
    
}
