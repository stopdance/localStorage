//
//  ToDoViewModel.swift
//  localStorage
//
//  Created by Alisher Aliyev  on 28.04.2022.
//

import Foundation
import RealmSwift

class ToDoViewModel: NSObject{
    
    static var sharedInstance = ToDoViewModel()
    
    var tasks = [Task]()
    
    typealias completionHandler = () -> Void
    
    let realm  = try! Realm()
    func addTask(task: Task, completion : completionHandler) {
        
        self.realm.beginWrite()
        
        self.realm.add(task)
        
        try! self.realm.commitWrite()
        
        print("Task Listed!")
        
        completion()
    }
    func loadTasks( completion: completionHandler){
       
        
        self.realm.beginWrite()
        let savedTasks = self.realm.objects(Task.self)
        self.tasks.removeAll()
        self.tasks.append(contentsOf: savedTasks)
        
        try! self.realm.commitWrite()
        
        completion()
    }
}
