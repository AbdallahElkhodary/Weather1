//
//  ChangeCityVc.swift
//  Weather1
//
//  Created by AMG on 25/06/2023.
//

import UIKit

class ChangeCityVc: UIViewController {
    
    
    
    var cityOfArray = [
        City(name: "الرياض", id: "108410"),
        City(name: "الدمام", id: "110336"),
        City(name: "جده", id: "105343"),
        City(name: "ابها", id: "110690")
    ]
    
    var selectCity: City?
    
   
    
    @IBOutlet var platFormData: UITextField!
    @IBOutlet weak var cityPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityPickerView.dataSource = self
        self.cityPickerView.delegate = self
        
    
        
       
        
        
       
        // Do any additional setup after loading the view.
    }
    
    
   
    
    

    @IBAction func editCity(_ sender: Any) {
        if let city = selectCity {
            NotificationCenter.default.post(name: NSNotification.Name("CityValueChange"), object: nil, userInfo: ["city" : city])
            
            self.dismiss(animated: true, completion: nil)
        }
        
        
        
    }
    
}

extension ChangeCityVc: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityOfArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return cityOfArray[row].name
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        selectCity = cityOfArray[row]
    }
    
    
}


extension ChangeCityVc: UITextFieldDelegate {
     func textFieldDidBeginEditing(_ textField: UITextField) {
       
    }
}














/*
 
 damamm = 110336
 jeda = 105343
 abha = 110690
 
 
 
 
 */
