//
//  RootViewController.swift
//  EnemyLosses
//
//  Created by Iryna Kalmykova on 14.07.2022.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    enum TableViewMode {
        case byDate
        case byType
    }
    
    let dataOfEquipmentsForTableView = ArmyEquipmentsLosses.takeDataFromJson()
    let dataOfPersonnelsForTableView = PersonnelLosses.takeDataFromJson()
    let factory = RootCellFactory()
    var items: [LossesOfEquipmentsAndPersonnels] = []
    
    private var tableViewMode: TableViewMode = .byType
    
    func goToTypeViewController(type: LossesOfEquipmentsAndPersonnels) {
        guard let typeDescriptionVC = storyboard!.instantiateViewController(withIdentifier: "TypeDescriptionVC") as? TypeDescriptionViewController else { return }
        typeDescriptionVC.type = type
        navigationController?.pushViewController(typeDescriptionVC, animated: true)
    }
    
    func goToDateViewController(equipmentsLossesData: ArmyEquipmentsLosses,
                                yesterdayEquipmentsLossesData: ArmyEquipmentsLosses,
                                personnelsLossesData: PersonnelLosses,
                                yesterdayPersonnelsLossesData: PersonnelLosses,
                                date: Date?,
                                dayOfConfrontation: Int?) {
        
        guard let dateDescriptionVC = storyboard!.instantiateViewController(withIdentifier: "DateDescriptionVC") as? DateDescriptionViewController else {return}
        dateDescriptionVC.dayOfConfrontation = dayOfConfrontation ?? 0
        dateDescriptionVC.dataOfEquipments = equipmentsLossesData
        dateDescriptionVC.dataOfPersonnels = personnelsLossesData
        dateDescriptionVC.yesterdayEquipmentsLossesData = yesterdayEquipmentsLossesData
        dateDescriptionVC.yesterdayPersonnelsLossesData = yesterdayPersonnelsLossesData
        
        if let someDate = date {
            dateDescriptionVC.date = ArmyEquipmentsLosses.myDateFormat(date: someDate)
        }
        
        navigationController?.pushViewController(dateDescriptionVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        factory.registerTableViewCell(tableView: tableView)
        
    }
    
    @IBAction private func handleSegmentChange() {
        switch segmentedControl.selectedSegmentIndex {
        case 0: tableViewMode = .byType
        case 1: tableViewMode = .byDate
        default: fatalError("Invalid index")
        }
        tableView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableViewMode {
        case .byType: return items.count
        case .byDate: return dataOfEquipmentsForTableView.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return factory.createTableViewCell(tableView: tableView,
                                           type: self.tableViewMode,
                                           indexPath: indexPath,
                                           dataOfEquipmentForTableView: dataOfEquipmentsForTableView,
                                           dataOfPersonnelForTableView: dataOfPersonnelsForTableView,
                                           item: items)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var yesterdayPersonnelsLossesData: PersonnelLosses
        var yesterdayEquipmentsLossesData: ArmyEquipmentsLosses
        let equipmentsLossesData  = dataOfEquipmentsForTableView[indexPath.row]
        let personnelsLossesData = dataOfPersonnelsForTableView[indexPath.row]
        let date = dataOfEquipmentsForTableView[indexPath.row].date
        let dayOfConfrontation = dataOfEquipmentsForTableView[indexPath.row].day
        
        
        if indexPath.row != 0 {
            yesterdayEquipmentsLossesData = dataOfEquipmentsForTableView[(indexPath.row) - 1]
            yesterdayPersonnelsLossesData = dataOfPersonnelsForTableView[(indexPath.row) - 1]
        }else{
            yesterdayEquipmentsLossesData = dataOfEquipmentsForTableView[indexPath.row]
            yesterdayPersonnelsLossesData = dataOfPersonnelsForTableView[indexPath.row]
            
        }
        switch tableViewMode{
        case .byDate:
            goToDateViewController(equipmentsLossesData: equipmentsLossesData,
                                   yesterdayEquipmentsLossesData: yesterdayEquipmentsLossesData,
                                   personnelsLossesData: personnelsLossesData,
                                   yesterdayPersonnelsLossesData: yesterdayPersonnelsLossesData,
                                   date: date,
                                   dayOfConfrontation: dayOfConfrontation)
            
            
        case .byType:
            goToTypeViewController(type: items[indexPath.row])
            
        }
    }
}
