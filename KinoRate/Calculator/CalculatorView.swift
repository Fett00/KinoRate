//
//  CalculatorView.swift
//  KinoRate
//
//  Created by Садык Мусаев on 08.02.2021.
//

import UIKit

class CalculatorView:UIView{
    
    var workspaceLabel = UILabel()
    var buttonsWorkspaceArea = UIStackView()
    var buttons = [MyUIButton]()
    var buttonIDs = ["*","/","+","-","1","2","3","4","5","6","7","8","9","0"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        for i in buttonIDs{
            buttons.append(MyUIButton(buttonID: i, frame: .zero))
        }
        confView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confView() {
        addSubview(workspaceLabel)
        addSubview(buttonsWorkspaceArea)
        
        
        buttonsWorkspaceArea.backgroundColor = .blue
        workspaceLabel.backgroundColor = .brown
        workspaceLabel.text = "Hello world"
        
        NSLayoutConstraint.activate([
            workspaceLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            workspaceLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            workspaceLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            workspaceLabel.heightAnchor.constraint(equalToConstant: self.frame.height/3),
            buttonsWorkspaceArea.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            buttonsWorkspaceArea.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            buttonsWorkspaceArea.topAnchor.constraint(equalTo: workspaceLabel.bottomAnchor,constant: 10),
            buttonsWorkspaceArea.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -10)
        ])
        
        workspaceLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonsWorkspaceArea.translatesAutoresizingMaskIntoConstraints = false
        
        for i in buttons{
            i.titleLabel?.text = "Hello"
            buttonsWorkspaceArea.addSubview(i)
        }
    }
}

class MyUIButton: UIButton{
    
    let buttonID:String
    
    init(buttonID:String,frame:CGRect) {
        self.buttonID = buttonID
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
