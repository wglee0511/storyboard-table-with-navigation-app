//
//  ToDoListViewControllerDelegate.swift
//  StoryboardTableViewWithNavigationApp
//
//  Created by racoon on 5/27/24.
//

import UIKit

@objc protocol ToDoListViewControllerDelegate : AnyObject {
    
    func saveToDoList(_ vc: UIViewController, text: String)
    
    @objc optional func cancelToDoList(_ vs: UIViewController)
}
