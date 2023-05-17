//
//  ListViewScreen.swift
//  TodoList
//
//  Created by Jadiê on 15/05/23.
//

import UIKit

protocol ListViewScreenProtocol:class {
    func actionAddNewTodo()
}

class ListViewScreen: UIView {
    
    private weak var delegate:ListViewScreenProtocol?
    
    func delegate(delegate: ListViewScreenProtocol) {
        self.delegate = delegate
    }
    
   lazy var table: UITableView = {
        let tab = UITableView()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.backgroundColor = .white
        tab.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tab
    }()
    
    lazy var newTodoButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "plus")
        config.cornerStyle = .capsule
        config.buttonSize = .large
        let btn = UIButton(configuration: config, primaryAction: tappedAddNewTodo())
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(table)
        addSubview(newTodoButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocolosTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        table.dataSource = dataSource
        table.delegate = delegate
    }
    
    private func tappedAddNewTodo() -> UIAction {
        let action = UIAction { _ in
            self.delegate?.actionAddNewTodo()
        }
        
        return action
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            newTodoButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            newTodoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
        ])
    }
   
    
}
