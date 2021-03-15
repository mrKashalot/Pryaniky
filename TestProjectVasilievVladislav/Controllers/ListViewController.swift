//
//  ListViewController.swift
//  TestProjectVasilievVladislav
//
//  Created by Владислав on 12.03.2021.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK: вспомогательная переменная для массива с отображением в таблице
    var viewArrayList = [DataArrayModel]()
    //MARK: перменная для передачи имени из списка в заголовок по нажатию на ячейку
    var titleControllerDataName: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchList()
    }
    
    //MARK: - подгрузки данных
    func fetchList() {
        
        let jsonUrlString = "https://pryaniky.com/static/json/sample.json"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let viewList = try JSONDecoder().decode(DataModel.self, from: data)
                
                //MARK: получили массив всех данных файла json
                self.viewArrayList = viewList.data
                
                //MARK: конфигурируем массив из полученных данных как указано в массиве view (порядок и кол.)
                self.viewArrayList.append(contentsOf: viewList.data)
                self.viewArrayList.remove(at: 1)
                self.viewArrayList.remove(at: 4)
                self.viewArrayList.swapAt(2, 3)
                
                //MARK: делаем обновление таблицы для отображения данных
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                
                print("Error serialization", error)
            }
        }.resume()
    }
    
    // MARK: - конфигурируем ячейку - метод будет вызван в расширениии при назначении данных в ячеки
    private func confCell(cell: TableViewCell, for indexPath: IndexPath) {
        
        let viewListName = viewArrayList[indexPath.row]
        cell.labelListText.text = viewListName.name
    }
    
    // MARK: - метод передачи имени в ячейке на заголовок нового контроллера (подготовленного в расширении ниже)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let emptyControllerVC = segue.destination as! EmptyViewController
        emptyControllerVC.nameTitleFromList = titleControllerDataName
    }
}

// MARK:- Расширения для использования tableView

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        confCell(cell: cell, for: indexPath)
        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    //MARK: сохраняем данные в ячейке по ее нажатии (для передачи имени в ячейки в заголовок на новом контроллере)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nameInsideCell = viewArrayList[indexPath.row]
        
        titleControllerDataName = nameInsideCell.name
        
        performSegue(withIdentifier: "toEmptyController", sender: self)
    }
}

