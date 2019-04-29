//
//  ViewController.swift
//  calculator
//
//  Created by 강병우 on 10/04/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    private var isEdited = false
    @IBAction func touch_num(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if isEdited {
            let currentDisplay = display.text!
            display.text = currentDisplay + digit
        } else {
            display.text = digit
        }
        isEdited = true
    }
    // display 값
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    // 계산
    var cal = Calculate()
    @IBAction private func touch_cal(_ sender: UIButton) {
        if isEdited {
            cal.setOperand(operand: displayValue)
            isEdited = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            cal.performOperand(symbol: mathematicalSymbol)
        }
        displayValue = cal.result 
    }

}
<<<<<<< HEAD

// 브랜치 테스트

// 브랜치 테스트 222
=======
// dd
>>>>>>> test3
