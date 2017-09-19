//
//  MyReservationsTableViewController.swift
//  Reservation
//
//  Created by Teddy Demilew on 9/19/17.
//  Copyright © 2017 Teddy Demilew. All rights reserved.
//

import UIKit
import CoreData

class MyReservationsTableViewController: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var reservations : [Dictionary] = Array<Dictionary<String, Any>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //user only arrow for nav back button
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        //hide empty cells
        //self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];     //hide empty cells below the last static cell
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchReserations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func addNewReservation(_ sender: Any) {
        
    }
    
    
    //fetches reservations from core data and relaod the table
    func fetchReserations() {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Event")
        request.returnsObjectsAsFaults = false
        
        do {
            let events = try context.fetch(request)
            for event in events as! [NSManagedObject] {
                let desc = event.value(forKey: "desc") as? String
                let length = event.value(forKey: "length") as? String
                let time = event.value(forKey: "time") as? String
                let partySize = event.value(forKey: "partySize") as? Int16
                let type = event.value(forKey: "type") as? String
                let date = event.value(forKey: "date") as? Date
                
                let reservation = ["desc" : desc ?? "", "length" : length ?? "", "time" : time ?? "", "partySize" : partySize ?? 1, "type" : type ?? "", "date" : date ?? Date()] as [String : Any]
                reservations.append(reservation)
            }
            
        } catch {
            
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reservations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MyReservationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyReservationsCell", for: indexPath) as! MyReservationTableViewCell
        let reservation = reservations[indexPath.row]
        let date = reservation["date"] as? Date
        if let partySize = reservation["partySize"] as? Int16 {
            cell.partySizeLbl.text = "PARTY SIZE - \(partySize)"
        } else {
            cell.partySizeLbl.text = "PARTY SIZE - \(1)"
        }
        
        cell.dateLbl.text =  date?.dateDispaly()
        cell.timeLbl.text = reservation["time"] as? String
        cell.massageTypeLbl.text = reservation["type"] as? String
        cell.serviceDescLbl.text = reservation["desc"] as? String
        return cell
    }
 
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let c : MyReservationTableViewCell = cell as! MyReservationTableViewCell
        c.rescheduleBtn.layer.cornerRadius = 5.0
        c.cancelBtn.layer.cornerRadius = 5.0
    }
}
