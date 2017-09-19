//
//  MyReservationTableViewCell.swift
//  Reservation
//
//  Created by Teddy Demilew on 9/19/17.
//  Copyright © 2017 Teddy Demilew. All rights reserved.
//

import UIKit

class MyReservationTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var massageTypeLbl: UILabel!
    @IBOutlet weak var partySizeLbl: UILabel!
    @IBOutlet weak var serviceDescLbl: UILabel!
    @IBOutlet weak var rescheduleBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
