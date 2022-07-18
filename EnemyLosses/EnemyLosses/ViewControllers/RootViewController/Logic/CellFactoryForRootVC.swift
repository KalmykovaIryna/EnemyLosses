//
//  CellFactoryForRootVC.swift
//  EnemyLosses
//
//  Created by Iryna Kalmykova on 14.07.2022.
//

import UIKit
class RootCellFactory {
    
    private let idCellForTypeMode = "typeCell"
    private let idCellForDateMode = "dateCell"
    
    func registerTableViewCell(tableView: UITableView) {
        tableView.register(UINib(nibName: "ByDateModeTableViewCell", bundle: nil), forCellReuseIdentifier: idCellForDateMode)
        tableView.register(UINib(nibName: "RootViewControllerCell", bundle: nil), forCellReuseIdentifier: idCellForTypeMode)
        
    }
    
    func createTableViewCell(tableView: UITableView,
                             type: RootViewController.TableViewMode,
                             indexPath: IndexPath,
                             dataOfEquipmentForTableView: [ArmyEquipmentsLosses],
                             dataOfPersonnelForTableView: [PersonnelLosses],
                             item: [LossesOfEquipmentsAndPersonnels]) -> UITableViewCell {
        switch type {
        case .byDate:
            if let cell = tableView.dequeueReusableCell(withIdentifier: idCellForDateMode, for: indexPath) as? ByDateModeTableViewCell {
                cell.selectionStyle = .none
                if let date = dataOfEquipmentForTableView[indexPath.row].date {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                }
                
                return cell
            }
            
        case .byType:
            if let cell = tableView.dequeueReusableCell(withIdentifier: idCellForTypeMode, for: indexPath) as? RootViewControllerCell {
                cell.selectionStyle = .none
                cell.descriptionOnUkrainianLabel.text = item[indexPath.row].descriptionOnUkranian.uppercased()
                cell.descriptionOnEnglishLabel.text = item[indexPath.row].descriptionOnEnglish.uppercased()
                cell.imageOfTypeImageView.image = item[indexPath.row].equipmentImages
                return cell
                
            }
        }
        fatalError("Should not be here")
    }   
}
