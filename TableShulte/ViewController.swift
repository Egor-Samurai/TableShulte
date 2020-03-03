//
//  ViewController.swift
//  TableShulte
//
//  Created by Егор on 11.02.2020.
//  Copyright © 2020 Egor Gurba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: Outlets
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var WarningLabel: UILabel!
    @IBOutlet var cellsButtons: [UIButton]!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    
    //MARK: Counters
    private(set)  var countValueLabel = 0 {
        didSet {
            counterLabel.text = "Found: \(countValueLabel)"
        }
    }
    
    var count = 1 // first value (1...25)
    var countError = 0 {   // counter errors
        didSet {
            WarningLabel.text = "Errors: \(countError)"
        }
    }
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        disableCells()
        timerLabel.isHidden = true
        
        //Gradient
        let colorOne = UIColor(red: 100 / 255, green: 20 / 255, blue: 61 / 255, alpha: 1.0)
        let colorTwo = UIColor(red: 243 / 255, green: 155 / 255, blue: 51 / 255, alpha: 1.0)
        view.setGradientBackgrount(colorOne: colorOne, colorTwo: colorTwo)
        
    }
    
    //MARK: Actions
    @IBAction func startButton(_ sender: UIButton) {
        updateTable(buttons: cellsButtons, numbers: numbersOfCells)
        cellsButtons.map({$0.isEnabled = true})
        timerLabel.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        sender.isEnabled = false
    }
    
    
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        timer.invalidate()
        disableCells()
        
        if startButtonOutlet.isEnabled == false {
            startButtonOutlet.isEnabled = true
        }
    }
    
    
    @IBAction func restartButton(_ sender: UIButton) {
        timer.invalidate()
        disableCells()
        updateTable(buttons: cellsButtons, numbers: numbersOfCells.shuffled())
        minute = 0
        seconds = 0
        timerLabel.text = String("\(minute):\(seconds)")
        for cell in cellsButtons {
            if cell.isHidden {
                cell.isHidden = false
            }
        }
        
        countValueLabel = 0
        countError = 0
        count = 1
    }
    
    @IBAction func touchButtons(_ sender: UIButton) {
        if sender.currentTitle! == String(count) {
            count += 1
            countValueLabel += 1
            sender.isHidden = true // hide the button after clicking
        } else {
            countError += 1
        }
        
    }
    
    //Greate array of numbers and shuffle them
    var numbersOfCells = [Int] (1...25).shuffled()
    
    //Set the button title
    func updateTable(buttons:[UIButton]!, numbers: [Int] ) {
        
        for index in 0..<numbersOfCells.count {
            buttons[index].setTitle("\(numbers[index])", for: .normal)
        }
        
    }
    
    
    //MARK: Timer
    
    var timer = Timer()
    
    var seconds = 0
    var minute = 0
    
    @objc func action()  {
        seconds += 1
        
        if seconds > 59 {
            minute += 1
            seconds = 0
        }
        
        
        
        timerLabel.text = String("\(minute):\(seconds)")
    }
    
    func disableCells() { //disable buttons
        cellsButtons.map({$0.isEnabled = false})
    }
    
    
    
}
