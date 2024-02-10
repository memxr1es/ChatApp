//
//  Message.swift
//  ChatApp
//
//  Created by Никита Котов on 30.10.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageID: String?
    let fromID: String
    let toID: String
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return messageID ?? NSUUID().uuidString
    }
    
    var charPartnerID: String {
        return fromID == Auth.auth().currentUser?.uid ? toID : fromID
    }
    
    var isFromCurrentUser: Bool {
        return fromID == Auth.auth().currentUser?.uid
    }
    
    var timestampString: String {
        return timestamp.dateValue().timestampString()
    }
}
