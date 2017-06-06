//
//  IndividiualWorkoutVC.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/6/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class IndividiualWorkoutVC: UIViewController {

    var workout : Workout?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let workout = workout {
            formatVC(workout: workout)
        }
    }

    func formatVC(workout: Workout) {
        // do stuff!
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
