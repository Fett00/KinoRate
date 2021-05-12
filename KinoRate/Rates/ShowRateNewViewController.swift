//
//  ShowRateNewViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 06.05.2021.
//

import UIKit

class ShowRateNewViewController: UIViewController {
    
    var rate:Comments
    
    init(comment:Comments) {
        rate = comment
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBAction func doneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLable.text = rate.filmID ?? ""
        textView.text = rate.comment ?? ""
        author.text = rate.userID ?? ""
        print(author.contentHuggingPriority(for: .horizontal))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(view.bounds)
    }
    
    deinit {
        print(titleLable.text!,"выбыл.")
    }
}
