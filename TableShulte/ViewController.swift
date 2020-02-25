//
//  ViewController.swift
//  TableShulte
//
//  Created by Егор on 11.02.2020.
//  Copyright © 2020 Egor Gurba. All rights reserved.
//

//MARK: Add
//timer and high score table

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var cellsButtons: [UIButton]!
    
    @IBAction func startButton(_ sender: UIButton) {
        updateTable(buttons: cellsButtons, numbers: numbersOfCells)
        shuffleNumbers()
    }
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var WarningLabel: UILabel!
    
    
    
   private(set)  var countValueLabel = 0 {
        didSet {
            counterLabel.text = "Finded: \(countValueLabel)"
        }
    }
    
     var count = 1 // first value (1...25)
    var countError = 0 {   // counter errors
        didSet {
        WarningLabel.text = "Errors: \(countError)"
        }
    }
    
    
    @IBAction func restartButton(_ sender: UIButton) {
      updateTable(buttons: cellsButtons, numbers: numbersOfCells)

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
    
    func shuffleNumbers() {
        numbersOfCells.shuffle()
    }


}
