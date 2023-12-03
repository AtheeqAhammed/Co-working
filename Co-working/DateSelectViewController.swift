//
//  DateSelectViewController.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 03/12/23.
//

import UIKit

class DateSelectViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datePicker.date = Date()
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        
    }
    
    @objc func dateSelected(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: datePicker.date)
        dateLabel.text = "Slot:" + date
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let deskViewController = storyboard?.instantiateViewController(withIdentifier: "DeskViewController" ) as! DeskViewController
        
        navigationController?.pushViewController(deskViewController, animated: true)
    }
}
