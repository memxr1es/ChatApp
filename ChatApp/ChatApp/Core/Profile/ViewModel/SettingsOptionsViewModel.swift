//
//  SettingsOptionsViewModel.swift
//  ChatApp
//
//  Created by Никита Котов on 27.10.2023.
//

import Foundation
import SwiftUI

enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {
    case darkMode
    case active
    case accessibility
    case privacy
    case notifications
    
    var title: String {
        switch self {
        case .darkMode: return "Темная тема"
        case .active: return "Активность"
        case .accessibility: return "Доступность"
        case .privacy: return "Конфиденциальность"
        case .notifications: return "Уведомления"
        }
    }
    
    var imageName: String {
        switch self {
        case .darkMode: return "moon.circle.fill"
        case .active: return "message.badge.circle.fill"
        case .accessibility: return "person.circle.fill"
        case .privacy: return "lock.circle.fill"
        case .notifications: return "bell.circle.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .darkMode: return Color.primary
        case .active: return Color(.systemGreen)
        case .accessibility: return Color.primary
        case .privacy: return Color(.systemBlue)
        case .notifications: return Color(.systemPurple)
        }
    }
    
    var id: Int { return self.rawValue }
}
