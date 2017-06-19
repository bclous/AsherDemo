//
//  FeelingsVC.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/6/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

protocol FeelingsVCDelegate : class {
    func tempButtonTapped()
}

class FeelingsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var startWorkoutButton: UIButton!
    @IBOutlet weak var feelingChoicesPickerView: UIPickerView!
    weak var delegate : FeelingsVCDelegate?
    let feelings = ["I feel great!", " A little achey, but I'm ok", "I'm huring, let's take it easy", "In pain, let's skip today"]

    override func viewDidLoad() {
        super.viewDidLoad()
        feelingChoicesPickerView.dataSource = self
        feelingChoicesPickerView.delegate = self
        startWorkoutButton.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tempButtonTapped(_ sender: Any) {
        delegate?.tempButtonTapped()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return feelings[row]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
