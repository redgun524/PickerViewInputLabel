//
//  PickerInputLabel.swift
//  managementDoc
//
//  Created by  noldam on 2016. 11. 3..
//  Copyright © 2016년 SOFTCITY. All rights reserved.
//

import UIKit

class PickerInputLabel: UILabel {
    
    var pickerView: SimplePickerView!
    var editTemp = UITextField()
    var dataSource = [String]()
    
    //PickerView 초기화
    func initPickerInput(dataSource: [String]) {
        self.dataSource = dataSource
        pickerView = SimplePickerView(dataList: dataSource)
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: pickerView.frame.width, height: 40))
        let btnDone = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(setDataToText(_:)))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([space, btnDone], animated: true)
        toolBar.barTintColor = UIColor(hex: 0xC8CBD3, alpha: 1)
        
        editTemp.inputAccessoryView = toolBar
        editTemp.inputView = pickerView
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(editStart(_:)))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
        superview?.addSubview(editTemp)
        setFirstData()
    }
    
    //PickerView 띄우기
    func editStart(_ sender: AnyObject) {
        editTemp.becomeFirstResponder()
    }
    
    //완료 버튼 클릭 시 Label에 텍스트를 입력
    func setDataToText(_ sender: AnyObject) {
        self.text = dataSource[pickerView.selectedRow(inComponent: 0)]
        editTemp.endEditing(true)
    }
    
    //첫번째 값을 반환합니다.
    func setFirstData() {
        self.text = dataSource[0]
        pickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    //row번째의 값을 반환합니다.
    func setPickerViewRow(row: Int) {
        self.text = dataSource[row]
        pickerView.selectRow(row, inComponent: 0, animated: true)
    }
    
    //PickereViewInputLabel 편집 시작
    func beginEditing() {
        editTemp.becomeFirstResponder()
    }
    
    //현재 선택된 값의 row를 반환합니다.
    func selectedRow() -> Int {
        return pickerView.selectedRow(inComponent: 0)
    }
}
