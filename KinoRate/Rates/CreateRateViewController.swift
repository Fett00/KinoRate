//
//  CreateRateViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 18.02.2021.
//

import UIKit

class CreateRateViewController: UIViewController {
    
    let rateDBOperations = RatesDB()
    
    let parentContainer = UIStackView()
    
    let containerText = UIStackView()
    
    let filmPickerView = UITextField()
    let authorTextView = UITextField()
    let starsValueTextView = UITextField()
    let commentTextView = UITextField()
    
    let containerLable = UIStackView()
    
    let filmNameLable = UILabel()
    let authorLable = UILabel()
    let starsValueLable = UILabel()
    let commentLable = UILabel()
    
    let pickerForStarsValue = UIPickerView()
    let pickerForFilmPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.rightBarButtonItem = .init(title:"Add", style: .plain, target: self, action: #selector(confirmRate))
        
        confView()
    }
    
    //Настройка view
    func confView(){
        
        view.addSubview(parentContainer)
        
        parentContainer.addArrangedSubview(containerLable)
        parentContainer.addArrangedSubview(containerText)
        
        parentContainer.axis = .horizontal
        parentContainer.alignment = .fill
        parentContainer.distribution = .fillEqually
        parentContainer.spacing = 10
    
        containerText.addArrangedSubview(filmPickerView)
        containerText.addArrangedSubview(authorTextView)
        containerText.addArrangedSubview(starsValueTextView)
        containerText.addArrangedSubview(commentTextView)
        
        containerLable.addArrangedSubview(filmNameLable)
        containerLable.addArrangedSubview(authorLable)
        containerLable.addArrangedSubview(starsValueLable)
        containerLable.addArrangedSubview(commentLable)
        
        authorLable.text = "Автор"
        commentLable.text = "Коментарий"
        filmNameLable.text = "Название фильма"
        starsValueLable.text = "Кол-во звезд"

        authorTextView.borderStyle = .roundedRect
        filmPickerView.borderStyle = .roundedRect
        starsValueTextView.borderStyle = .roundedRect
        commentTextView.borderStyle = .roundedRect
        
        
        pickerForFilmPickerView.dataSource = self
        pickerForFilmPickerView.delegate = self
        filmPickerView.inputView = pickerForFilmPickerView
        
        pickerForStarsValue.dataSource = self
        pickerForStarsValue.delegate = self
        starsValueTextView.inputView = pickerForStarsValue
        
        
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
            
            parentContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            parentContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            parentContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        parentContainer.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //Создание нового коментария в БД
    @objc func confirmRate(){
        
        rateDBOperations.create {
            
            let newComment = Comments(context: rateDBOperations.context)
            newComment.comment = commentTextView.text
            newComment.filmID = filmPickerView.text
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
}

extension CreateRateViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case pickerForFilmPickerView:
            return filmsSource.count
        case pickerForStarsValue:
            return 6
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case pickerForFilmPickerView:
            return filmsSource[row].filmName
        case pickerForStarsValue:
            return String(row)
        default:
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView {
        case pickerForFilmPickerView:
            filmPickerView.text = filmsSource[row].filmName
        case pickerForStarsValue:
            starsValueTextView.text = String(row)
        default:
            break
        }
    }
}
