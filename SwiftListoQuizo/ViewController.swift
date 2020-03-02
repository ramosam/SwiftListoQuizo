//
//  ViewController.swift
//  SwiftListoQuizo
//
//  Created by Arcaurel on 3/1/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var quizPicker: UIPickerView!
    private let CATS = "Cats"
    private let DOGS = "Dogs"
    private let PLANTS = "Plants"
    private let GHOSTS = "Ghosts"
    private let quizChoices = ["Cats", "Dogs", "Plants", "Ghosts"]
    private let defaultChoice = 0
    
    @IBOutlet var background: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func changeColorButton(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            background.backgroundColor = UIColor.white
        case 1:
            background.backgroundColor = UIColor.gray
        case 2:
            background.backgroundColor = UIColor.systemPink
        case 3:
            background.backgroundColor = UIColor.purple
        default:
            background.backgroundColor = UIColor.white
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Save history to user defaults
//        UserDefaults.standard.set(history, forKey: "history")
        print("# \(quizPicker.selectedRow(inComponent: 0))")
        let qSet: QuestionSet
        switch quizPicker.selectedRow(inComponent: 0) {
        case 0:
            qSet = QuestionSet(qTheme: CATS)
        case 1:
            qSet = QuestionSet(qTheme: DOGS)
        case 2:
            qSet = QuestionSet(qTheme: PLANTS)
        case 3:
            qSet = QuestionSet(qTheme: GHOSTS)
        default:
            qSet = QuestionSet(qTheme: DOGS)
        }
        if let qVC = segue.destination as? QuestionViewController {
            qVC.set = qSet
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return quizChoices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return quizChoices[row]
    }


}

