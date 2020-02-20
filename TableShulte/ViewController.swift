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
    
    @IBAction func touchButtons(_ sender: UIButton) {
        
    }
    
    //Greate array of numbers and shuffle them
    
    var numbersOfCells = [Int] (1...25).shuffled()
    
    
    func addNumbersToButtonText(button:[UIButton]!, numbers: [Int] ) {
        
        for index in 0..<numbersOfCells.count {
            button[index].setTitle("\(numbers[index])", for: .normal)
        }
        
    }
    
    func shuffleNumbers() {
        numbersOfCells.shuffle()
    }
    
    
}

