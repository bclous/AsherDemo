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

class ExerciseVC: UIViewController {
    
    var exercise : Exercise?
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
    
    func formatExerciseVCWithExercise(_ exercise: Exercise) {
        self.exercise = exercise
        controlView.formatMasterViewForExercise(exercise, frameWidth: view.frame.width)
        tipsView.formatTipViewFor(exercise: exercise)
        orderInWorkout = exercise.orderInWorkout

    }
    
    @IBAction func nextExerciseButtonTapped(_ sender: Any) {
        delegate?.exerciseFinishedTapped(orderInWorkout)
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
