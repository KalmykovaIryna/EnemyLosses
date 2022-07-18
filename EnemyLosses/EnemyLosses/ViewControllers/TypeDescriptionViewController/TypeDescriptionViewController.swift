//
//  TypeDescriptionViewController.swift
//  EnemyLosses
//
//  Created by Iryna Kalmykova on 14.07.2022.
//

import UIKit

class TypeDescriptionViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageOfTheType: UIImageView!
    @IBOutlet weak var descriptionOnUkrainian: UILabel!
    @IBOutlet weak var descriptionOnEnglish: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    var lossesOfEquipments = ArmyEquipmentsLosses.takeDataFromJson()
    var lossesOfPersonels = PersonnelLosses.takeDataFromJson()
    var type: LossesOfEquipmentsAndPersonnels?
    private let idCell = "idCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.cornerRadius = 20
        imageOfTheType.image = type?.equipmentImages
        descriptionOnUkrainian.text = type?.descriptionOnUkranian.uppercased()
        descriptionOnEnglish.text = type?.descriptionOnEnglish.uppercased()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "DescriptionByTypeTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
        tableView.register(UINib(nibName: "HeaderForTypeDescriptionTableView", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
    }
    
    @IBAction func tapBackButton(){
        navigationController?.popViewController(animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension TypeDescriptionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lossesOfEquipments.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as? DescriptionByTypeTableViewCell else { fatalError("Should not be here") }
            cell.selectionStyle = .none
            switch type {
            case .personnel:
                if let date = lossesOfPersonels[indexPath.row].date, let count = lossesOfPersonels[indexPath.row].personnel {
                    cell.dateLabel.text = PersonnelLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .apc:
                if let date = lossesOfEquipments[indexPath.row].date, let count = lossesOfEquipments[indexPath.row].APC {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .mrl:
                if let date = lossesOfEquipments[indexPath.row].date, let count = lossesOfEquipments[indexPath.row].MRL {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .militeryAuto:
                if let date = lossesOfEquipments[indexPath.row].date, let count = lossesOfEquipments[indexPath.row].militaryAuto {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .aircraft:
                if let date = lossesOfEquipments[indexPath.row].date, let count = lossesOfEquipments[indexPath.row].aircraft {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .helicopter:
                if let date = lossesOfEquipments[indexPath.row].date, let count = lossesOfEquipments[indexPath.row].helicopter {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .tank:
                if let date = lossesOfEquipments[indexPath.row].date, let count = lossesOfEquipments[indexPath.row].tank {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .fuelTank:
                if let date = lossesOfEquipments[indexPath.row].date, let count = lossesOfEquipments[indexPath.row].fuelTank {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .drone:
                if let date = lossesOfEquipments[indexPath.row].date, let count = lossesOfEquipments[indexPath.row].drone {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .navalShip:
                if let date = lossesOfEquipments[indexPath.row].date, let count = lossesOfEquipments[indexPath.row].navalShip {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .antiAircraftWarfare:
                if let date = lossesOfEquipments[indexPath.row].date, let count = lossesOfEquipments[indexPath.row].antiAircraftWarfare {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .fieldArtillery:
                if let date = lossesOfEquipments[indexPath.row].date, let count = lossesOfEquipments[indexPath.row].fieldArtillery {
                    cell.dateLabel.text = ArmyEquipmentsLosses.myDateFormat(date: date)
                    cell.countLabel.text = "\(count)"
                }
            case .none:
                fatalError("Should not be here")
            }
            
            return cell
        }
     
    }
    





