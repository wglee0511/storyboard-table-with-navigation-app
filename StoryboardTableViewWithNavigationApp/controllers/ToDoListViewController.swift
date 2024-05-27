//
//  ViewController.swift
//  StoryboardTableViewWithNavigationApp
//
//  Created by racoon on 5/24/24.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    var toDoList : [String] = []
    
    @IBOutlet weak var toDoListTableView: UITableView!
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let viewController = segue.destination.children.first as? AddToDoListViewController {
//            viewController.toDoListDelegate = self
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(NotificationName.addToDoList.rawValue), object: nil, queue: .main) { noti in
            guard let message = noti.userInfo?[NotificationUserInfo.toDo.rawValue] as? String else {
                return
            }
            
            self.toDoList.append(message)
            self.toDoListTableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    


}

//extension ToDoListViewController: ToDoListViewControllerDelegate {
//    func saveToDoList(_ vc: UIViewController, text: String) {
//        toDoList.append(text)
//        toDoListTableView.reloadData()
//    }
//    
//    func cancelToDoList(_ vs: UIViewController) {
//        
//    }
//    
//    
//}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell’s contents.
        cell.textLabel!.text = toDoList[indexPath.row]
            
        return cell
    }
}
