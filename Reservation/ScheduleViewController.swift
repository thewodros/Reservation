//
//  ScheduleViewController.swift
//  Reservation
//
//  Created by Teddy Demilew on 9/19/17.
//  Copyright © 2017 Teddy Demilew. All rights reserved.
//

import UIKit


class ScheduleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var massageDetailsLbl: UILabel!
    @IBOutlet weak var availableDatesCollectionView: UICollectionView!
    @IBOutlet weak var availableTimesCollectionView: UICollectionView!
    @IBOutlet weak var reserveBtn: UIButton!
    
    var availableDates: [AvailableDate] = []
    var availableTimes: [String] = ["09:00 AM", "10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM", "07:00 PM", "08:00 PM"]
    
    
    var selectedDate: Date?
    var selectedDateIndex: Int?
    var selectedTime: String?
    var selectedTimeIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reserveBtn.isUserInteractionEnabled = false
        reserveBtn.alpha = 0.4
        massageDetailsLbl.text = "Hot Stone\nMassage"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        buildAvailableDates()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reserve(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //populate day, date, and time
    func buildAvailableDates() {
        let today = Date()
        let calendar = Calendar.current
        
        let daysInCurrMonth = calendar.dateInterval(of: .month, for: today)!
        let startDate: Date = daysInCurrMonth.start
        let endDate: Date = daysInCurrMonth.end
        
        var nextDate = startDate
        while nextDate < endDate {      //running from first day to last of of the current month
            let dateString = nextDate.dayThreeLetters().uppercased()
            let day = nextDate.dateDD()
            let aDate = AvailableDate(date: nextDate, dateString: dateString, day: day)
            availableDates.append(aDate)
            nextDate = calendar.date(byAdding: .day, value: 1, to: nextDate)!
        }
        availableDatesCollectionView.reloadData()
    }
    
    
    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == availableDatesCollectionView {
            return availableDates.count
        } else if collectionView == availableTimesCollectionView {
            return availableTimes.count
        } else {
            return 0
        }
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.availableDatesCollectionView {
            let cell : AvailableDateCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvailableDateCollectionCell", for: indexPath) as! AvailableDateCollectionViewCell
            let aDate = availableDates[indexPath.row]
            cell.dateLbl.text = aDate.dateString
            cell.dayLbl.text = aDate.day
            if selectedDateIndex == indexPath.row {
                cell.backgroundColor = UIColor.yellow
            } else {
                cell.backgroundColor = UIColor.clear
            }
            return cell
        }
        else  { //if collectionView == self .availableTimesCollectionView
            let cell : AvailableTimeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvailableTimeCollectionCell", for: indexPath) as! AvailableTimeCollectionViewCell
            cell.timeLbl.text = availableTimes[indexPath.row]
            if selectedTimeIndex == indexPath.row {
                cell.backgroundColor = UIColor.yellow
            } else {
                cell.backgroundColor = UIColor.clear
            }
            return cell
        }
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == availableDatesCollectionView {
            let aDate = availableDates[indexPath.row]
            selectedDate = aDate.date
            selectedDateIndex = indexPath.row
            availableDatesCollectionView.reloadData()
        } else if collectionView == availableTimesCollectionView {
            selectedTime = availableTimes[indexPath.row]
            selectedTimeIndex = indexPath.row
            availableTimesCollectionView.reloadData()
        }
        
        //enable reserve button if both selected date and selected time are set
        if let _ = selectedDate, let _ = selectedTime {
            reserveBtn.isUserInteractionEnabled = true
            reserveBtn.alpha = 1.0
        }
    }


}
