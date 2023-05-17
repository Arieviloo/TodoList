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
        addSubview(newTodoButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tappedAddNewTodo() -> UIAction {
        let action = UIAction { _ in
         
            self.delegate?.actionAddNewTodo()
        }
        
        return action
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            newTodoButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            newTodoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
}
