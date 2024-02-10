//
//  Constants.swift
//  ChatApp
//
//  Created by Никита Котов on 31.10.2023.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let UsersCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}
