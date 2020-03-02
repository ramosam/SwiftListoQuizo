//
//  ViewController.swift
//  SwiftListoQuizo
//
//  Created by Arcaurel on 3/1/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var background: UIView!
    private let CATS = "Cats"
    private let DOGS = "Dogs"
    private let PLANTS = "Plants"
    private let GHOSTS = "Ghosts"
    private let quizChoices = ["Cats", "Dogs", "Plants", "Ghosts"]
    private let COLOR = "color"
    private let PICKER = "picker"
    private let defaultChoice = 0
    private let colorChoices = [UIColor.white, UIColor.gray, UIColor.systemPink, UIColor.purple]
    
    
    @IBOutlet weak var quizPicker: UIPickerView!
    @IBOutlet weak var colorSegmentedButton: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if !UserDefaults.standard.bool(forKey: "defaultsSet") {
            UserDefaults.standard.set(defaultChoice, forKey: COLOR)
            
            UserDefaults.standard.set(true, forKey: "defaultsSet")
        }
        let color = UserDefaults.standard.integer(forKey: COLOR)
        colorSegmentedButton.selectedSegmentIndex = color
        background.backgroundColor = colorChoices[color]
        

        
    }
    

    
    @IBAction func changeColorButton(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            UserDefaults.standard.set(0, forKey: COLOR)
            background.backgroundColor = colorChoices[0]
            
        case 1:
            UserDefaults.standard.set(1, forKey: COLOR)
            background.backgroundColor = colorChoices[1]
            
        case 2:
            UserDefaults.standard.set(2, forKey: COLOR)
            background.backgroundColor = colorChoices[2]
            
        case 3:
            UserDefaults.standard.set(3, forKey: COLOR)
            background.backgroundColor = colorChoices[3]
            
        default:
            UserDefaults.standard.set(0, forKey: COLOR)
            background.backgroundColor = colorChoices[0]
            
        }
        
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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

