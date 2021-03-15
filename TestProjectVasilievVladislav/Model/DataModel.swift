//
//  AllData.swift
//  TestProjectVasilievVladislav
//
//  Created by Владислав on 12.03.2021.
//

import Foundation


//MARK: - самая высокоуровневая структура файла json
struct DataModel: Decodable {
    var data: [DataArrayModel]
    var view: [String]
}

