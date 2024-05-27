//
//  notification.swift
//  StoryboardTableViewWithNavigationApp
//
//  Created by racoon on 5/28/24.
//

import Foundation

extension Notification.Name {
    static let addToDoList = Notification.Name("addToDoList")
}


enum NotificationUserInfo: String {
    case toDo = "toDo"
}
