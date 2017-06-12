//
//  ExerciseVC.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/6/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

protocol ExerciseVCDelegate : class {
    func exerciseFinishedTapped(number: Int)
}

class ExerciseVC: UIViewController, ControlMasterViewDelegate {
    
    var exercise : Exercise?
    var screenWidth : CGFloat = 375
    weak var delegate : ExerciseVCDelegate?
    
    @IBOutlet weak var nextExerciseButton: UIButton!
    @IBOutlet weak var controlView: ExerciseSetControlMasterView!
    @IBOutlet weak var tipsView: ExerciseTipsView!
    var orderInWorkout = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        controlView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func nextExerciseButtonTapped(_ sender: Any) {
        delegate?.exerciseFinishedTapped(number: orderInWorkout)
    }
    
    func isLastSetInExercise(_ lastSet: Bool) {
        nextExerciseButton.isHidden = !lastSet
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let exercise = exercise {
            controlView.formatMasterViewForExercise(exercise, frameWidth: screenWidth)
            tipsView.formatTipViewFor(exercise: exercise)
            orderInWorkout = Int(exercise.orderInWorkout)
        }
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
