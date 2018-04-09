//
//  ViewController.swift
//  Dicee
//
//  Created by Sudheendra Ayalasomayajula on 4/9/18.
//  Copyright © 2018 Sudheendra Ayalasomayajula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomDiceIndexLeft : Int = 0
    var randomDiceIndexRight : Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var diceImageViewRight: UIImageView!
    @IBOutlet weak var diceImageViewLeft: UIImageView!
    
    fileprivate func getRandomNumber() -> Int {
        return Int(arc4random_uniform(6))
    }
    
    fileprivate func updateImages() {
        diceImageViewLeft.image = UIImage(named: diceArray[randomDiceIndexLeft])
        diceImageViewRight.image = UIImage(named: diceArray[randomDiceIndexRight])
    }
    
    fileprivate func shakeDice() {
        randomDiceIndexLeft = getRandomNumber()
        randomDiceIndexRight = getRandomNumber()
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        shakeDice()
        updateImages()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shakeDice()
        updateImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        shakeDice()
        updateImages()
    }

}

