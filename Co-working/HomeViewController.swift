//
//  HomeViewController.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 03/12/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func bookingHistoryTapped(_ sender: UIButton) {
        
        let bookingHistoryController = storyboard?.instantiateViewController(identifier: "BookingHistoryController") as! BookingHistoryController
        self.navigationController?.pushViewController(bookingHistoryController, animated: true)
    }
    
    @IBAction func bookWorkStationTapped(_ sender: UIButton) {
        let calenderController = storyboard?.instantiateViewController(identifier: "DateSelectViewController") as! DateSelectViewController
        self.navigationController?.pushViewController(calenderController, animated: true)

    }
    
    @IBAction func meetingRoomTapped(_ sender: UIButton) {
    }
}
