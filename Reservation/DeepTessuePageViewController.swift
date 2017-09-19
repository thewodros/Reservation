//
//  DeepTessuePageViewController.swift
//  Reservation
//
//  Created by Teddy Demilew on 9/19/17.
//  Copyright © 2017 Teddy Demilew. All rights reserved.
//

import UIKit

class DeepTessuePageViewController: UIViewController {

    @IBOutlet weak var reserveBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reserveBtn.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func reserve(_ sender: Any) {
        print(#file)
    }
    

}
