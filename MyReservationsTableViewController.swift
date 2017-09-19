//
//  MyReservationsTableViewController.swift
//  Reservation
//
//  Created by Teddy Demilew on 9/19/17.
//  Copyright © 2017 Teddy Demilew. All rights reserved.
//

import UIKit

class MyReservationsTableViewController: UITableViewController {

    let reservations: [String] = ["R1", "R2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //user only arrow for nav back button
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func addNewReservation(_ sender: Any) {
        
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
        cell.dateLbl.text = "Monday, March 26, 2016"
        cell.timeLbl.text = "2:00 PM"
        cell.massageTypeLbl.text = "Hot Store"
        cell.partySizeLbl.text = "PARTY SIZE - \(1)"
        cell.serviceDescLbl.text = "Massage focused on the deepest layer of muscles to target knots and release chronic muscle tension."
        cell.rescheduleBtn.layer.cornerRadius = 5.0
        cell.cancelBtn.layer.cornerRadius = 5.0
        return cell
    }
 
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let c : MyReservationTableViewCell = cell as! MyReservationTableViewCell
        c.rescheduleBtn.layer.cornerRadius = 5.0
        c.cancelBtn.layer.cornerRadius = 5.0
    }
}
