//
//  Rout.swift
//  ChatApp
//
//  Created by Никита Котов on 31.10.2023.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
