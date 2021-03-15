//
//  TableViewController.swift
//  TestProjectVasilievVladislav
//
//  Created by Владислав on 12.03.2021.
//

import UIKit

//MARK: - Оставил файл для проверки что могу получить все данные

class AllDatacontroller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    //MARK: - подгрузки данных
    func fetchData() {
        
        let jsonUrlString = "https://pryaniky.com/static/json/sample.json"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let allData = try JSONDecoder().decode(DataModel.self, from: data)
                
                print(allData)
                
            } catch let error {
                
                print("Error serialization", error)
            }
        }.resume()
    }
}

