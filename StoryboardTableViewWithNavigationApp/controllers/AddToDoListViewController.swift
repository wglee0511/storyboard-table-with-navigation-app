//
//  AddToDoListViewController.swift
//  StoryboardTableViewWithNavigationApp
//
//  Created by racoon on 5/26/24.
//

import UIKit

class AddToDoListViewController: UIViewController {
    
    weak var toDoListDelegate: ToDoListViewControllerDelegate?
    
    @IBOutlet weak var todoListInput: UITextField!
    
    @IBAction func cancelToDoList(_ sender: Any) {
        toDoListDelegate?.cancelToDoList?(self)
        todoListInput.text = ""
        dismiss(animated: true)
    }
    
    @IBAction func saveToDoList(_ sender: Any) {
        saveData()
    }
    

    
    func saveData(){
        guard let text = todoListInput.text else {
            return
        }
        toDoListDelegate?.saveToDoList(self, text:text)
        todoListInput.text = ""
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoListInput.layer.borderColor = UIColor.systemGray.cgColor
        todoListInput.layer.borderWidth = 1
        todoListInput.layer.cornerRadius = 5
        todoListInput.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddToDoListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveData()
        return true
    }
}
