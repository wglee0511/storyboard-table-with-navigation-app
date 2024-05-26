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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination.children.first as? AddToDoListViewController {
            viewController.todoListViewController = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

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
