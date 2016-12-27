//
//  DatePickerInputLabel.swift
//  noldam
//
//  Created by  noldam on 2016. 11. 3..
//  Copyright © 2016년 Noldam. All rights reserved.
//

import UIKit

class DatePickerInputLabel: UILabel {
    
    var dateFormat = "yyyy-MM-dd"
    let dateFormatter = DateFormatter()
    var datePicker = UIDatePicker()
    var editTemp = UITextField()
    
    func initPickerInput(dateFormat: String?) {
        if dateFormat != nil {
            self.dateFormat = dateFormat!
        }
        datePicker.datePickerMode = UIDatePickerMode.date
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        dateFormatter.dateFormat = self.dateFormat
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: datePicker.frame.width, height: 40))
        let btnDone = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(setDateText(_:)))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([space, btnDone], animated: true)
        toolBar.barTintColor = UIColor(hex: 0xC8CBD3, alpha: 1)
        
        editTemp.inputAccessoryView = toolBar
        editTemp.inputView = datePicker
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(editStart(_:)))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
        superview?.addSubview(editTemp)
        setTextInDate()
    }
    
    func setDateText(_ sender: UIBarButtonItem) {
        setTextInDate()
    }
    
    func editStart(_ sender: AnyObject) {
        editTemp.becomeFirstResponder()
    }
    
    func setTextInDate() {
        self.text = dateFormatter.string(from: datePicker.date)
        editTemp.endEditing(true)
    }
    
    var currentDate: Date {
        get {
            return datePicker.date
        }
        set(date) {
            datePicker.date = date
            setTextInDate()
        }
    }
    
    //DatePickerInputLabel 편집 시작
    func beginEditing() {
        editTemp.becomeFirstResponder()
    }
}

