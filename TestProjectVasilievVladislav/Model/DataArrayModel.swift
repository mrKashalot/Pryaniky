//
//  AllData2.swift
//  TestProjectVasilievVladislav
//
//  Created by Владислав on 12.03.2021.
//

import Foundation

//MARK: - структуры внутри массива data для парсинга всех данных
struct DataArrayModel: Decodable {
    
    var name: String?
    var data: Data?
}

struct Data: Decodable {
    var text: String?
    var url: String?
    var selectedId: Int?
    var variants: [Variants]?
}

struct Variants: Decodable {
    var id: Int?
    var text: String?
}

