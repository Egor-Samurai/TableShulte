//
//  ViewController.swift
//  TableShulte
//
//  Created by Егор on 11.02.2020.
//  Copyright © 2020 Egor Gurba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var cellsButtons: [UIButton]!
    
    @IBAction func startButton(_ sender: UIButton) {
        addNumbersToButtonText(button: cellsButtons, numbers: numbersOfCells)
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
    @IBAction func touchButtons(_ sender: UIButton) {
        //exercise logic
        if sender.currentTitle! == String(count) {
            count += 1
            countValueLabel += 1
        } else {
            countError += 1
        }
       
    }
    
    
    //Greate array of numbers and shuffle them
    var numbersOfCells = [Int] (1...25).shuffled()
    
    //Set the button title
    func addNumbersToButtonText(button:[UIButton]!, numbers: [Int] ) {
        
        for index in 0..<numbersOfCells.count {
            button[index].setTitle("\(numbers[index])", for: .normal)
        }
        
    }
    
    func shuffleNumbers() {
        numbersOfCells.shuffle()
    }


}

