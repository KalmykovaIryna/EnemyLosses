//
//  PersonnelLosses.swift
//  EnemyLosses
//
//  Created by Iryna Kalmykova on  14.07.2022.
//

import Foundation

struct PersonnelLosses: Decodable {
    let date: Date?
    let day: Int?
    let personnel: Int?
    let pow: Int?
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case day = "day"
        case personnel = "personnel"
        case pow = "POW"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dateString = try container.decode(String.self, forKey: .date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        date = dateFormatter.date(from: dateString)
        
        if let value = try? container.decode(Int.self, forKey: .day) {
            day = value
        } else if let valueString = try? container.decode(String.self, forKey: .day), let value = Int(valueString) {
            day = value
        } else {
            day = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .personnel) {
            personnel = value
        } else if let valueString = try? container.decode(String.self, forKey: .personnel), let value = Int(valueString) {
            personnel = value
        } else {
            personnel = nil
        }
        if let value = try? container.decode(Int.self, forKey: .pow) {
            pow = value
        } else if let valueString = try? container.decode(String.self, forKey: .pow), let value = Int(valueString) {
            pow = value
        } else {
            pow = nil
        }
    }
    
    static func takeDataFromJson() -> [PersonnelLosses] {
        guard let filePath = Bundle.main.path(forResource: "russia_losses_personnel", ofType: "json") else {
            return []
        }
        guard let jsonString = try? String(contentsOfFile: filePath) else { return [] }
        
        let processedString = jsonString.replacingOccurrences(of: "NaN", with: "\"NaN\"")
        guard let data = processedString.data(using: .utf8) else { return [] }
        
        let decoder = JSONDecoder()
        
        do {
            let array = try decoder.decode([PersonnelLosses].self, from: data)
            return array
        } catch {
            print((error as NSError))
            return []
        }
    }
    
    static func myDateFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        let dateToString = dateFormatter.string(from: date)
        return dateToString
    }
}
