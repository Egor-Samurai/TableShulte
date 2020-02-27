//
//  ViewController.swift
//  TableShulte
//
//  Created by Егор on 11.02.2020.
//  Copyright © 2020 Egor Gurba. All rights reserved.
//

//MARK: Add
// high score table

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: Outlets
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var WarningLabel: UILabel!
    @IBOutlet var cellsButtons: [UIButton]!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.isHidden = true
    }
    
    
    var time = 0
    var minute = 0
    //timer
    var timer = Timer()
    
    //MARK: Actions
    @IBAction func startButton(_ sender: UIButton) {
        updateTable(buttons: cellsButtons, numbers: numbersOfCells)
        sender.isHidden = true
        timerLabel.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func restartButton(_ sender: UIButton) {
        updateTable(buttons: cellsButtons, numbers: numbersOfCells.shuffled())
        time = 0
        timerLabel.text = String("\(minute):\(time)")
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
    
    @objc func action()  {
        time += 1
        
        if time > 60 {
            minute += 1
            time = 0
        }
        
        
        
        timerLabel.text = String("\(minute):\(time)")
    }
    
}
