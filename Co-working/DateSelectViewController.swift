//
//  DateSelectViewController.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 03/12/23.
//

import UIKit

class DateSelectViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource {
    
    var getSlotModel: GetSlotModel?
    var slotModel = [GetSlotModel]()
    var getSlotViewModel = GetSlotViewModel()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate   = self
        collectionView.dataSource = self
        getSlots()
        
        datePicker.date = Date()
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        
    }
    
    @objc func dateSelected(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: datePicker.date)
        dateLabel.text = "Slot: " + date
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let deskViewController = storyboard?.instantiateViewController(withIdentifier: "DeskViewController" ) as! DeskViewController
        navigationController?.pushViewController(deskViewController, animated: true)
    }
    
    
    func getSlots(){
        getSlotViewModel.getSlots(endpoint: String(format: Constants.getSlotsAPI)) { response in
            switch response {
                
            case .success(let data):
                self.getSlotModel = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slotModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlotCollectionCell", for: indexPath) as! SlotCollectionCell
        cell.slotNameLabel.text = self.getSlotModel?.slots.first?.slotName
        return cell
    }
    
}
