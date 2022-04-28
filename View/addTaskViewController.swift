//
//  addTaskViewController.swift
//  localStorage
//
//  Created by Alisher Aliyev  on 28.04.2022.
//

import UIKit

class addTaskViewController: UIViewController {
    
    @IBOutlet weak var textTaskName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func saveButton(sender : Any){
        
        print("Saving tasks...")
        
        let task = Task(name: textTaskName.text ?? "",
                        time: datePicker.date)
        let vm = ToDoViewModel.sharedInstance
        vm.addTask(task: task){
            self.navigationController?
                .popViewController(animated: true)
        }
    } 

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
