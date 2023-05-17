//
//  ViewController.swift
//  TodoList
//
//  Created by Jadiê on 15/05/23.
//

import UIKit

class ListViewController: UIViewController {
    
    var listView: ListViewScreen?
    var items = [String]()
    
    override func loadView() {
        listView = ListViewScreen()
        view = listView
        listView?.delegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        listView?.configProtocolosTableView(delegate: self, dataSource: self)
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
        alert.addTextField { field in
            field.placeholder = "Enter item..."
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler:  nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] (_) in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    print(text)
                    DispatchQueue.main.async {
                        self?.items.append(text)
                        self?.listView?.table.reloadData()
                    }
                }
            }
            
        }))
        present(alert, animated: true)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
