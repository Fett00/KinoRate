//
//  CreateRateViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 18.02.2021.
//

import UIKit

class CreateRateViewController: UIViewController {
    
    let rateDBOperations = RatesDB()
    
    
    let containerText = UIStackView()
    
    let authorTextView = UITextField()
    let commentTextView = UITextView()
    let filmNameTextView = UITextField()
    let starsValueTextView = UITextField()
    
    let containerLable = UIStackView()
    
    let authorLable = UILabel()
    let commentLable = UILabel()
    let filmNameLable = UILabel()
    let starsValueLable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.rightBarButtonItem = .init(title:"Add", style: .plain, target: self, action: #selector(confirmRate))
        
        confView()
    }
    
    @objc func confirmRate(){
        
        rateDBOperations.create {
            
            let newComment = Comments(context: rateDBOperations.context)
            newComment.comment = commentTextView.text
            newComment.filmID = filmNameTextView.text
            newComment.userID = authorTextView.text
            newComment.id = "1"
            
            if let stars = Int32(starsValueTextView.text ?? ""){
                if stars < 0 {
                    newComment.rating = 0
                }
                else if stars > 5{
                    newComment.rating = 5
                }
                else{
                    newComment.rating = stars
                }
            }
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    func confView(){
        
        view.addSubview(containerText)
        containerText.addArrangedSubview(authorTextView)
        containerText.addArrangedSubview(filmNameTextView)
        containerText.addArrangedSubview(starsValueTextView)
        containerText.addArrangedSubview(commentTextView)
        
        view.addSubview(containerLable)
        containerLable.addArrangedSubview(authorLable)
        containerLable.addArrangedSubview(filmNameLable)
        containerLable.addArrangedSubview(starsValueLable)
        containerLable.addArrangedSubview(commentLable)
        
        authorLable.text = "Автор"
        commentLable.text = "Коментарий"
        filmNameLable.text = "Название фильма"
        starsValueLable.text = "Кол-во звезд"
        
        authorTextView.borderStyle = .roundedRect
        filmNameTextView.borderStyle = .roundedRect
        starsValueTextView.borderStyle = .roundedRect
        
        commentTextView.textContainer.maximumNumberOfLines = 5
        //commentTextView.isScrollEnabled = false
        starsValueTextView.keyboardType = .numberPad
        
        containerText.axis = .vertical
        containerText.distribution = .fillEqually
        containerText.alignment = .fill
        containerText.spacing = 10
        containerText.contentMode = .scaleAspectFit
        
        containerLable.axis = .vertical
        containerLable.distribution = .fillEqually
        containerLable.alignment = .fill
        containerLable.spacing = .leastNormalMagnitude
        containerLable.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            
            containerLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            //containerLable.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
            //containerLable.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.centerXAnchor),
            containerLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            
            containerText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            //containerText.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
            containerText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            containerText.leadingAnchor.constraint(equalTo: containerLable.trailingAnchor,constant: 10),
            containerText.widthAnchor.constraint(equalTo: authorTextView.widthAnchor),
            
            containerLable.bottomAnchor.constraint(equalTo: containerText.bottomAnchor)
        ])
        
        containerText.translatesAutoresizingMaskIntoConstraints = false
        containerLable.translatesAutoresizingMaskIntoConstraints = false
    }
}
