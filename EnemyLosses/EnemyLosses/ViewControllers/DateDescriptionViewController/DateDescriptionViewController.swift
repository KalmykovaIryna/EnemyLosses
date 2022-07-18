//
//  DateDescriptionViewController.swift
//  EnemyLosses
//
//  Created by Iryna Kalmykova on 14.07.2022.
//

import UIKit

class DateDescriptionViewController: UIViewController {
    @IBOutlet weak var backgroundStackView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dayOfConfrontationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    private let idCell = "idCell"
    private var items: [LossesOfEquipmentsAndPersonnels] = []
    var dayOfConfrontation: Int?
    var date: String?
    var dataOfEquipments: ArmyEquipmentsLosses?
    var dataOfPersonnels: PersonnelLosses?
    var yesterdayEquipmentsLossesData: ArmyEquipmentsLosses?
    var yesterdayPersonnelsLossesData: PersonnelLosses?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundStackView.layer.cornerRadius = 20
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DescriptionByDateTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
        
        items = [
            .personnel,
            .aircraft,
            .helicopter,
            .tank,
            .apc,
            .fieldArtillery,
            .mrl,
            .militeryAuto,
            .fuelTank,
            .drone,
            .navalShip,
            .antiAircraftWarfare
        ]
        
        if let selectedDate = date {
            dateLabel.text = "(24.02.2022 - \(selectedDate))"
        }
        
        if let someDay = dayOfConfrontation {
            dayOfConfrontationLabel.text = "\(someDay)"
        }
      
      
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func tapBackButton(_ sender: AnyObject) {
        navigationController?.popViewController(animated: true)
    }
}

extension DateDescriptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as? DescriptionByDateTableViewCell else { fatalError("Should not be here") }
            cell.descriptionOnUkrainianLabel.text = items[indexPath.row].descriptionOnUkranian.uppercased()
            cell.descriptionOnEnglishLabel.text = items[indexPath.row].descriptionOnEnglish
            cell.imageOftypImageView.image = items[indexPath.row].equipmentImages
        
            switch items[indexPath.row] {
            case .personnel:
                if let count = dataOfPersonnels?.personnel{
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            case .aircraft:
                if let count = dataOfEquipments?.aircraft {
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            case .helicopter:
                if let count = dataOfEquipments?.helicopter {
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            case .tank:
                if let count = dataOfEquipments?.tank {
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            case .apc:
                if let count = dataOfEquipments?.APC {
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            case .fieldArtillery:
                if let count = dataOfEquipments?.fieldArtillery {
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            case .mrl:
                if let count = dataOfEquipments?.MRL {
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            case .militeryAuto:
                if let count = dataOfEquipments?.militaryAuto {
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            case .fuelTank:
                if let count = dataOfEquipments?.fuelTank{
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            case .drone:
                if let count = dataOfEquipments?.drone{
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            case .navalShip:
                if let count = dataOfEquipments?.navalShip{
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            case .antiAircraftWarfare:
                if let count = dataOfEquipments?.antiAircraftWarfare{
                    cell.countOfLossesLabel.text = "\(count)"
                }else {
                    cell.countOfLossesLabel.text = ""
                }
            }
        
            switch items[indexPath.row] {
            case .personnel:
                if let count = dataOfPersonnels?.personnel,
                   let yesterdayPersonnelsLossesData = yesterdayPersonnelsLossesData?.personnel{
                    let difference = count - yesterdayPersonnelsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                }else{
                    cell.addedLosesLabel.text = ""
                }
            case .aircraft:
                if let count = dataOfEquipments?.aircraft,
                   let yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData?.aircraft{
                    let difference = count - yesterdayEquipmentsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                } else {
                    cell.addedLosesLabel.text = ""
                }
            case .helicopter:
                if let count = dataOfEquipments?.helicopter,
                   let yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData?.helicopter{
                    let difference = count - yesterdayEquipmentsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                }else{
                    cell.addedLosesLabel.text = ""
                }
            case .tank:
                if let count = dataOfEquipments?.tank,
                   let yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData?.tank{
                    let difference = count - yesterdayEquipmentsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                }else{
                    cell.addedLosesLabel.text = ""
                }
            case .apc:
                if let count = dataOfEquipments?.APC,
                   let yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData?.APC{
                    let difference = count - yesterdayEquipmentsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                }else{
                    cell.addedLosesLabel.text = ""
                }
            case .mrl:
                if let count = dataOfEquipments?.MRL,
                   let yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData?.MRL{
                    let difference = count - yesterdayEquipmentsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                }else{
                    cell.addedLosesLabel.text = ""
                }
            case .militeryAuto:
                if let count = dataOfEquipments?.militaryAuto,
                   let yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData?.militaryAuto{
                    let difference = count - yesterdayEquipmentsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                }else{
                    cell.addedLosesLabel.text = ""
                }
            case .fuelTank:
                if let count = dataOfEquipments?.fuelTank,
                   let yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData?.fuelTank{
                    let difference = count - yesterdayEquipmentsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                }else{
                    cell.addedLosesLabel.text = ""
                }
            case .drone:
                if let count = yesterdayEquipmentsLossesData?.drone,
                   let yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData?.drone{
                    let difference = count - yesterdayEquipmentsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                }else{
                    cell.addedLosesLabel.text = ""
                }
            case .navalShip:
                if let count = dataOfEquipments?.navalShip,
                   let yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData?.navalShip{
                    let difference = count - yesterdayEquipmentsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                }else{
                    cell.addedLosesLabel.text = ""
                }
            case .antiAircraftWarfare:
                if let count = dataOfEquipments?.antiAircraftWarfare,
                   let yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData?.antiAircraftWarfare{
                    let difference = count - yesterdayEquipmentsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                }else{
                    cell.addedLosesLabel.text = ""
                }
            case .fieldArtillery:
                if let count = dataOfEquipments?.fieldArtillery,
                   let yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData?.fieldArtillery{
                    let difference = count - yesterdayEquipmentsLossesData
                    cell.addedLosesLabel.text = "+\(difference)"
                }else{
                    cell.addedLosesLabel.text = ""
                }
            }
            return cell
        }
    }

