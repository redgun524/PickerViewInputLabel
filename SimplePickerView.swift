//
//  SimplePickerViewDelegate.swift
//  managementDoc
//
//  Created by  noldam on 2016. 10. 16..
//  Copyright © 2016년 SOFTCITY. All rights reserved.
//

import UIKit
import Foundation

//'구분'항목에 관한 Delegate
class SimplePickerView:UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var dataList = [String]()
    
    init(dataList: [String]) {
        super.init(frame: CGRect.zero)
        setDataList(dataList: dataList)
    }
    
    //피커뷰에 사용될 데이터 초기화
    func setDataList(dataList: [String]) {
        self.delegate = self
        self.dataSource = self
        self.dataList = dataList
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    //피커뷰 피커 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //피커뷰 피커 내의 row 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    //피커뷰의 크기
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Regular", size: 15)
        label.text = dataList[row]
        label.textAlignment = .center
        
        return label
    }
    
    //현재 선택되어 있는 아이템 반환
    func getSelectedData() -> String {
        return dataList[self.selectedRow(inComponent: 0)]
    }
}
