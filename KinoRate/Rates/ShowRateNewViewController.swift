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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view
        
        titleLable.text = rate.filmID ?? ""
        textView.text = rate.comment ?? ""
        author.text = rate.userID ?? ""
        

    }
}
