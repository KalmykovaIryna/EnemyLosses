//
//  ArmyEquipmentsLosses.swift
//  EnemyLosses
//
//  Created by Iryna Kalmykova on 14.07.2022.
//

import Foundation

struct ArmyEquipmentsLosses: Decodable {
    let date: Date?
    let day: Int?
    let aircraft: Int?
    let helicopter: Int?
    let tank: Int?
    let APC: Int?
    let fieldArtillery: Int?
    let MRL: Int?
    let militaryAuto: Int?
    let fuelTank: Int?
    let drone: Int?
    let navalShip: Int?
    let antiAircraftWarfare: Int?
    let specialEquipment: Int?
    let mobileSRBMSystem: Int?
    let vehiclesAndFuelTanks: Int?
    let cruiseMissiles: Int?
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case day = "day"
        case aircraft = "aircraft"
        case helicopter = "helicopter"
        case tank = "tank"
        case APC = "APC"
        case fieldArtillery = "field artillery"
        case MRL = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone = "drone"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
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
        
        if let value = try? container.decode(Int.self, forKey: .aircraft) {
            aircraft = value
        } else if let valueString = try? container.decode(String.self, forKey: .aircraft), let value = Int(valueString) {
            aircraft = value
        } else {
            aircraft = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .helicopter) {
            helicopter = value
        } else if let valueString = try? container.decode(String.self, forKey: .helicopter), let value = Int(valueString) {
            helicopter = value
        } else {
            helicopter = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .tank) {
            tank = value
        } else if let valueString = try? container.decode(String.self, forKey: .tank), let value = Int(valueString) {
            tank = value
        } else {
            tank = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .APC) {
            APC = value
        } else if let valueString = try? container.decode(String.self, forKey: .APC), let value = Int(valueString) {
            APC = value
        } else {
            APC = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .fieldArtillery) {
            fieldArtillery = value
        } else if let valueString = try? container.decode(String.self, forKey: .fieldArtillery), let value = Int(valueString) {
            fieldArtillery = value
        } else {
            fieldArtillery = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .MRL) {
            MRL = value
        } else if let valueString = try? container.decode(String.self, forKey: .MRL), let value = Int(valueString) {
            MRL = value
        } else {
            MRL = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .militaryAuto) {
            militaryAuto = value
        } else if let valueString = try? container.decode(String.self, forKey: .militaryAuto), let value = Int(valueString) {
            militaryAuto = value
        } else {
            militaryAuto = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .fuelTank) {
            fuelTank = value
        } else if let valueString = try? container.decode(String.self, forKey: .fuelTank), let value = Int(valueString) {
            fuelTank = value
        } else {
            fuelTank = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .drone) {
            drone = value
        } else if let valueString = try? container.decode(String.self, forKey: .drone), let value = Int(valueString) {
            drone = value
        } else {
            drone = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .navalShip) {
            navalShip = value
        } else if let valueString = try? container.decode(String.self, forKey: .navalShip), let value = Int(valueString) {
            navalShip = value
        } else {
            navalShip = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .antiAircraftWarfare) {
            antiAircraftWarfare = value
        } else if let valueString = try? container.decode(String.self, forKey: .antiAircraftWarfare), let value = Int(valueString) {
            antiAircraftWarfare = value
        } else {
            antiAircraftWarfare = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .specialEquipment) {
            specialEquipment = value
        } else if let valueString = try? container.decode(String.self, forKey: .specialEquipment), let value = Int(valueString) {
            specialEquipment = value
        } else {
            specialEquipment = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .mobileSRBMSystem) {
            mobileSRBMSystem = value
        } else if let valueString = try? container.decode(String.self, forKey: .mobileSRBMSystem), let value = Int(valueString) {
            mobileSRBMSystem = value
        } else {
            mobileSRBMSystem = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .vehiclesAndFuelTanks) {
            vehiclesAndFuelTanks = value
        } else if let valueString = try? container.decode(String.self, forKey: .vehiclesAndFuelTanks), let value = Int(valueString) {
            vehiclesAndFuelTanks = value
        } else {
            vehiclesAndFuelTanks = nil
        }
        
        if let value = try? container.decode(Int.self, forKey: .cruiseMissiles) {
            cruiseMissiles = value
        } else if let valueString = try? container.decode(String.self, forKey: .cruiseMissiles), let value = Int(valueString) {
            cruiseMissiles = value
        } else {
            cruiseMissiles = nil
        }
    }
    
    static func takeDataFromJson() -> [ArmyEquipmentsLosses] {
        guard let filePath = Bundle.main.path(forResource: "russia_losses_equipment", ofType: "json") else {
            return []
        }
        guard let jsonString = try? String(contentsOfFile: filePath) else { return [] }
        
        let processedString = jsonString.replacingOccurrences(of: "NaN", with: "\"NaN\"")
        guard let data = processedString.data(using: .utf8) else { return [] }
        
        let decoder = JSONDecoder()
        
        do {
            let array = try decoder.decode([ArmyEquipmentsLosses].self, from: data)
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
