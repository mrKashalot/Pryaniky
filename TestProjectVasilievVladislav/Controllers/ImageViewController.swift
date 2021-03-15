//
//  ImageViewController.swift
//  TestProjectVasilievVladislav
//
//  Created by Владислав on 12.03.2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    //MARK: - получаем 1 картинку и выводим на другой контроллер
    @IBOutlet var image: UIImageView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.isHidden = true
        indicator.hidesWhenStopped = true
        
        getImage()
    }
    
    func getImage() {
        
        indicator.isHidden = false
        indicator.startAnimating()
        
        guard let url = URL(string: "https://pryaniky.com/static/img/logo-a-512.png") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if let data = data, let image = UIImage(data: data) {
                
                DispatchQueue.main.async {
                    self.indicator.stopAnimating()
                    self.image.image = image
                }
            }
        } .resume()
    }
}
