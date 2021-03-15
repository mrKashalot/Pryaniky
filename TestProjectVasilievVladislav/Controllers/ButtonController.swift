//
//  ViewController.swift
//  TestProjectVasilievVladislav
//
//  Created by Владислав on 12.03.2021.
//

import UIKit

class ButtonController: UIViewController {
    
    //MARK: - получаем данные в консоль (для своего удобства сохранил полученный в консоли ответ в папку HELP
    @IBAction func buttonGetPress(_ sender: Any) {
        
        guard let url = URL(string: "https://pryaniky.com/static/json/sample.json") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard let response = response, let data = data else { return }
            
            print(response)
            print(data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options:[])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
}

