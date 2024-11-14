//
//  BookingHistoryViewController.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 05/12/23.
//

import UIKit

class BookingHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var getBookingModel: Booking?
    var getBookings = [GetBookingModel]()
    var getBookingViewModel = GetBookingViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getBookingDetails()
    }
    
    
    func getBookingDetails(){
        getBookingViewModel.getBookingDetails(endpoint: String(format: Constants.getBookingsAPI)) { response in
            switch response{
                
            case .success(let data):
                self.getBookingModel = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (getBookings.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingHistoryCell", for: indexPath) as! BookingHistoryCell
        
        if let deskId = getBookings[indexPath.row].bookings?.first?.workspaceID {
            cell.deskId.text = "desk ID     : \(Int(deskId))"
        }
            
        cell.nameLabel.text = getBookings[indexPath.row].bookings?.first?.workspaceName
        cell.bookedOn.text = getBookings[indexPath.row].bookings?.first?.bookingDate
            
            return cell
    }
}
