//
//  EmptyViewController.swift
//  TestProjectVasilievVladislav
//
//  Created by Владислав on 15.03.2021.
//

import UIKit

class EmptyViewController: UIViewController {
    
    //MARK: переменная для передачи заголовка
    var nameTitleFromList: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = nameTitleFromList
    }
}
