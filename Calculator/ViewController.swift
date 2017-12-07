//
//  ViewController.swift
//  Calculator
//
//  Created by 贺宁宇 on 06/12/2017.
//  Copyright © 2017 贺宁宇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // the number to be showed on screen
    var showResult = "0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateShowView()
        switchButtonsValidState(buttons: [btnA, btnB, btnC, btnD, btnE, btnF, btnAND, btnOR, btnXOR, btnNOR, btnDot])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var showView: UILabel!
    
    func updateShowView() {
        // TODO: how to avoid appear with '...'
        showView.numberOfLines = 1
        showView.minimumScaleFactor = 0.5
        showView.adjustsFontSizeToFitWidth = true
        showView.text = showResult
    }
    
    // Alphabic button outlet
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnD: UIButton!
    @IBOutlet weak var btnE: UIButton!
    @IBOutlet weak var btnF: UIButton!
    @IBOutlet weak var btnAND: UIButton!
    @IBOutlet weak var btnOR: UIButton!
    @IBOutlet weak var btnNOR: UIButton!
    @IBOutlet weak var btnXOR: UIButton!
    @IBOutlet weak var btnDot: UIButton!

    func buttonPressed(sender: UIButton) {
        hasDesignatedOp()
        showResult.append("\(sender.titleLabel!.text!)")
        erasePrefix()
        updateShowView()
    }
    
    // for each button pressed
    @IBAction func button1Pressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func button2Pressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func button3Pressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func button4Pressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func button5Pressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func button6Pressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func button7Pressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func button8Pressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func button9Pressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func button0Pressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func buttonAPressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func buttonBPressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func buttonCPressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func buttonDPressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func buttonEPressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func buttonFPressed(sender: UIButton) {
        buttonPressed(sender: sender)
    }
    
    @IBAction func buttonDotPressed() {
        hasDesignatedOp()
        if showResult.contains(Character(".")) {
            return
        }
        showResult.append(".")
        updateShowView()
    }
    
    var op1: Double = 0
    var op2: Double = 0
    enum operatorCase {
        case add
        case minus
        case multiply
        case divide
        case and
        case xor
        case or
        case nor
        case none
    }
    var operatorPressed = operatorCase.none

    // if has pressed any of the operator, turn it to true
    var hasDesignatedOpFlag = false
    
    func hasDesignatedOp() {
        if hasDesignatedOpFlag == true {
            if decOrHexFlag == 0 {
                showResult = "0"
            } else {
                showResult = "0x"
            }
            hasDesignatedOpFlag = false
        } else {
            return
        }
    }
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet var operatorLabel: UILabel!
    
    func buttonOperatorPressed() {
        if decOrHexFlag == 0 {
            op1 = Double(showResult)!
        } else {
            showResult.removeFirst(2)
            op1 = Double(Int(showResult, radix: 16)!)
        }
        hasDesignatedOpFlag = true
    }
    
    @IBAction func buttonAddPressed() {
        buttonOperatorPressed()
        operatorPressed = operatorCase.add
        setColorToHighlight(btn: btnAdd)
    }
    
    @IBAction func buttonMinusPressed() {
        buttonOperatorPressed()
        operatorPressed = operatorCase.minus
        setColorToHighlight(btn: btnMinus)
    }
    
    @IBAction func buttonMultiplyPressed() {
        buttonOperatorPressed()
        operatorPressed = operatorCase.multiply
        setColorToHighlight(btn: btnMultiply)
    }
    
    @IBAction func buttonDividePressed() {
        buttonOperatorPressed()
        operatorPressed = operatorCase.divide
        setColorToHighlight(btn: btnDivide)
    }
    
    @IBAction func buttonOrPressed() {
        buttonOperatorPressed()
        operatorPressed = operatorCase.or
        operatorLabel.text = "|"
    }
    
    @IBAction func buttonXorPressed() {
        buttonOperatorPressed()
        operatorPressed = operatorCase.xor
        operatorLabel.text = "^"
    }
    
    @IBAction func buttonNorPressed() {
        buttonOperatorPressed()
        operatorPressed = operatorCase.nor
        operatorLabel.text = "~|"
    }
    
    @IBAction func buttonAndPressed() {
        buttonOperatorPressed()
        operatorPressed = operatorCase.and
        operatorLabel.text = "&"
    }
    
    @IBAction func buttonEqualPressed() {
        eraseOperatorHighlight()
        if decOrHexFlag == 0 {
            op2 = Double(showResult)!
        } else {
            showResult.removeFirst(2)
            op2 = Double(Int(showResult, radix: 16)!)
        }
        var result: Double = 0
        switch operatorPressed {
        case .add:
            result = op1 + op2
        case .minus:
            result = op1 - op2
        case .multiply:
            result = op1 * op2
        case .divide:
            result = op1 / op2
        case .and:
            result = Double(Int(op1) & Int(op2))
        case .xor:
            result = Double(Int(op1) ^ Int(op2))
        case .or:
            result = Double(Int(op1) | Int(op2))
        case .nor:
            result = Double(~(Int(op1) | Int(op2)))
        case .none:
            result = op2
        }
        if decOrHexFlag == 0 {
            if result.isInfinite {
                showResult = String(round(result*100000000)/100000000)
            } else if String(result).last! == Character("0"){
                // result is finite
                // I should judge the suffix 0 whether can be erased
                showResult = String(Int(result))
            } else {
                showResult = "\(result)"
            }
        } else {
            showResult = String(Int(result), radix: 16).uppercased()
            insertPrefix()
        }
        updateShowView()
        hasDesignatedOpFlag = false
        operatorPressed = .none
        operatorLabel.text = ""
    }
    
    @IBAction func buttonClearPressed() {
        if operatorPressed != .none {
            if decOrHexFlag == 0 {
                showResult = "0"
            } else {
                showResult = "0x0"
            }
            updateShowView()
        } else {
            return
        }
    }
    
    @IBAction func buttonAllClearPressed() {
        eraseOperatorHighlight()
        operatorLabel.text = ""
        if decOrHexFlag == 0 {
            showResult = "0"
        } else {
            showResult = "0x0"
        }
        updateShowView()
        hasDesignatedOpFlag = false
        operatorPressed = .none
    }
    
    // TODO: special case for button "00"

    
    // 0 means decimal now, 1 means hex now
    // 0 is default
    var decOrHexFlag = 0

    // hex control
    @IBAction func segmentedControlChange(sender: UISegmentedControl) {
        switchButtonsValidState(buttons: [btnA, btnB, btnC, btnD, btnE, btnF, btnAND, btnOR, btnXOR, btnNOR, btnDot])
        if sender.selectedSegmentIndex == 0 {
            decOrHexFlag = 0
        } else {
            decOrHexFlag = 1
        }
        changeNumberHex()
    }
    
    
    func erasePrefix() {
        if showResult.contains(Character(".")) {
            return
        } else if decOrHexFlag == 1 {
            if showResult[showResult.index(showResult.startIndex, offsetBy: +2)] == Character("0") {
                showResult.remove(at: showResult.index(showResult.startIndex, offsetBy: +2))
            }
            return
        } else if showResult.first == "0" {
            showResult.removeFirst()
        }
    }
    
    var validColor = UIColor.black
    var invalidColor = UIColor.init(red: 125.0/255, green: 119.0/255, blue: 121.0/255, alpha: 1.0)
    
    // when segmentedContorl value changed and viewDidLoad
    func switchButtonsValidState(buttons: [UIButton]) {
        for btn in buttons {
            if btn.isEnabled == false {
                btn.setTitleColor(validColor, for: .normal)
                btn.isEnabled = true
            } else {
                btn.setTitleColor(invalidColor, for: .normal)
                btn.isEnabled = false
            }
        }
    }
    
    func changeNumberHex() {
        // 16 to 10
        if decOrHexFlag == 0 {
            showResult.removeFirst(2)
            let dec = Int(showResult, radix: 16)!
            showResult = String(dec)
        } else if decOrHexFlag == 1 { // 10 to 16
            let dec = Int(Double(showResult)!)
            showResult = String(dec, radix: 16).uppercased()
            insertPrefix()
        }
        updateShowView()
    }
    
    func setColorToHighlight(btn: UIButton) {
        btn.backgroundColor = UIColor.white
        btn.setTitleColor(UIColor.init(red: 240.0/255, green: 152.0/255, blue: 55.0/255, alpha: 1.0), for: .normal)
        switch operatorPressed {
        case .add:
            operatorLabel.text = "+"
        case .minus:
            operatorLabel.text = "-"
        case .multiply:
            operatorLabel.text = "×"
        case .divide:
            operatorLabel.text = "÷"
        default:
            operatorLabel.text = ""
        }
    }
    
    func eraseOperatorHighlight() {
        switch operatorPressed {
        case .add:
            btnAdd.setTitleColor(UIColor.white, for: .normal)
            btnAdd.backgroundColor = UIColor.init(red: 255.0/255, green: 147.0/255, blue: 0.0, alpha: 1.0)
        case .minus:
            btnMinus.setTitleColor(UIColor.white, for: .normal)
            btnMinus.backgroundColor = UIColor.init(red: 255.0/255, green: 147.0/255, blue: 0.0, alpha: 1.0)
        case .multiply:
            btnMultiply.setTitleColor(UIColor.white, for: .normal)
            btnMultiply.backgroundColor = UIColor.init(red: 255.0/255, green: 147.0/255, blue: 0.0, alpha: 1.0)
        case .divide:
            btnDivide.setTitleColor(UIColor.white, for: .normal)
            btnDivide.backgroundColor = UIColor.init(red: 255.0/255, green: 147.0/255, blue: 0.0, alpha: 1.0)
        default:
            return
        }
    }
    
    func insertPrefix() {
        showResult.insert("x", at: showResult.index(showResult.startIndex, offsetBy: 0))
        showResult.insert("0", at: showResult.index(showResult.startIndex, offsetBy: 0))
    }
    
}
