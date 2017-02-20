//
//  ViewController.swift
//  mycalculator
//
//  Created by 毛宇轩 on 17/1/5.
//  Copyright © 2017年 michael's. All rights reserved.
//

import UIKit    //include a  module
//foundation: core severce's thing

//all view controller should inheriate from UIViewController
class ViewController: UIViewController {
    // ! ? both means optional
    @IBOutlet private weak var display: UILabel!
    
    private var userIsTyping=false
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit}
        else{display.text = digit}
        userIsTyping = true
    }
    
    private var displayValue: Double{
        get {
            return Double(display.text!)!
        }
        set{
            display.text=String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton){
        if userIsTyping{
            brain.setOperand(displayValue)
            userIsTyping=false
        }
        if let mathSymbol=sender.currentTitle{
            brain.performOperation(mathSymbol)
        }
        displayValue=brain.result
    }
}

