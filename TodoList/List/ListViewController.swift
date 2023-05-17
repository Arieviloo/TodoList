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
        print("Clique +")
    }

}


