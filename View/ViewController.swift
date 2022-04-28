//
//  ViewController.swift
//  localStorage
//
//  Created by Alisher Aliyev  on 28.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButton (sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "addTaskViewController") as! addTaskViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    let vm = ToDoViewModel.sharedInstance
    
    var data : [Task] = [
        Task(name: "Task1", time: Date()),
        Task(name: "Task2", time: Date())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.data.removeAll()
        vm.loadTasks {
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return vm.tasks.count
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let data = vm.tasks[indexPath.row]
        cell.textLabel?.text = data.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        let timeString = dateFormatter.string(from: data.time)
        cell.detailTextLabel?.text = timeString
        return cell
    }
}

