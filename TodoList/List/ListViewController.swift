//
//  ViewController.swift
//  TodoList
//
//  Created by Jadiê on 15/05/23.
//

import UIKit

class ListViewController: UIViewController {
    
    var listView: ListViewScreen? = nil
   
    
    override func loadView() {
        listView = ListViewScreen()
        view = listView
        listView?.delegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .white
        title = "Todo List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}


extension ListViewController: ListViewScreenProtocol {
    func actionAddNewTodo() {
        let alert = UIAlertController(title: "New Item", message: "Enter new to do list item!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:  nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            
        }))
        present(alert, animated: true)
    }
    

}


