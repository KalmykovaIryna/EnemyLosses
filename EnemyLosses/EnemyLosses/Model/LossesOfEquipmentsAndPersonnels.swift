//
//  LossesOfEquipmentsAndPersonnels.swift
//  EnemyLosses
//
//  Created by Iryna Kalmykova on 14.07.2022.
//

import UIKit

enum LossesOfEquipmentsAndPersonnels {
    case personnel
    case aircraft
    case helicopter
    case tank
    case apc
    case fieldArtillery
    case mrl
    case militeryAuto
    case fuelTank
    case drone
    case navalShip
    case antiAircraftWarfare
    
    var descriptionOnUkranian: String {
        switch self {
        case .personnel: return "особовий склад"
        case .aircraft: return "літаки"
        case .helicopter: return "гелікоптери"
        case .tank: return "танки"
        case .apc: return "бронетранспортер"
        case .fieldArtillery: return "артилерія"
        case .mrl: return "ракетна установка"
        case .militeryAuto: return "автотехніка"
        case .fuelTank: return "цистерни з пмм"
        case .drone: return "бпла отр"
        case .navalShip: return "кораблі/катери"
        case .antiAircraftWarfare: return "засоби ппо"
        }
    }
    
    var descriptionOnEnglish: String {
        switch self {
        case .personnel: return "personnel"
        case .aircraft: return "aircrafts"
        case .helicopter: return "helicopters"
        case .tank: return "tanks"
        case .apc: return "armored personnel carrier"
        case .fieldArtillery: return "field artilleries"
        case .mrl: return "multiple Rocket Launcher"
        case .militeryAuto: return "militery autoes"
        case .fuelTank: return "fuel tanks"
        case .drone: return "drones"
        case .navalShip: return "naval ship"
        case .antiAircraftWarfare: return "anti-aircraft warfare systems"
        }
    }
    
    var equipmentImages: UIImage? {
        switch self {
        case .personnel: return UIImage(named: "chmonya")
        case .aircraft: return UIImage(named: "aircraft")
        case .helicopter: return UIImage(named: "helicopter")
        case .tank: return UIImage(named: "tank.jpg")
        case .apc: return UIImage(named: "apc")
        case .fieldArtillery: return UIImage(named: "artillery")
        case .mrl: return UIImage(named: "mrl")
        case .militeryAuto: return UIImage(named: "militeryAutoes")
        case .fuelTank: return UIImage(named: "fuel")
        case .drone: return UIImage(named: "drones")
        case .navalShip: return UIImage(named: "ship")
        case .antiAircraftWarfare: return UIImage(named: "warfareSystem")
        }
    }
}
