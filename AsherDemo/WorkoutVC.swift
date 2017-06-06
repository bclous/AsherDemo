//
//  WorkoutVC.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/6/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class WorkoutVC: UIViewController {

    @IBOutlet weak var masterScrollView: UIScrollView!
    
    @IBOutlet weak var page1Container: UIView!
    @IBOutlet weak var page2Container: UIView!
    @IBOutlet weak var page3Container: UIView!
    @IBOutlet weak var page4Container: UIView!
    @IBOutlet weak var page5Container: UIView!
    @IBOutlet weak var page6Container: UIView!
    
    let feelingsVC : FeelingsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "feelingsVC") as! FeelingsVC
    let exercise1VC : ExerciseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "exerciseVC") as! ExerciseVC
    let exercise2VC : ExerciseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "exerciseVC") as! ExerciseVC
    let exercise3VC : ExerciseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "exerciseVC") as! ExerciseVC
    let exercise4VC : ExerciseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "exerciseVC") as! ExerciseVC
    let workoutFinishedVC : WorkoutFinishedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "workoutFinishedVC") as! WorkoutFinishedVC
    
    var workout : Workout?
    var exercises : [ExerciseSet] = []
    var screenWidth : CGFloat = 375
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let workout = workout {
            formatVC(workout: workout)
            screenWidth = view.frame.width
            formatScrollView()
        }
    }
    
    func formatVC(workout: Workout) {
        getExercises(workout: workout)
        formatExerciseVCs()
        constrainVCs()
    }
    
    func getExercises(workout: Workout) {
        if let workoutExercises = workout.exerciseSets?.allObjects {
            exercises = workoutExercises as! [ExerciseSet]
        }
    }
    
    func formatExerciseVCs() {
        if exercises.count >= 4 {
            exercise1VC.exercise = exercises[0]
            exercise2VC.exercise = exercises[1]
            exercise3VC.exercise = exercises[2]
            exercise4VC.exercise = exercises[3]
            
            exercise1VC.formatExerciseVC()
            exercise2VC.formatExerciseVC()
            exercise3VC.formatExerciseVC()
            exercise4VC.formatExerciseVC()
            
            exercise1VC.delegate = self
            exercise2VC.delegate = self
            exercise3VC.delegate = self
            exercise4VC.delegate = self
        }
    }
    
    func constrainVCs() {
        constrainView(feelingsVC.view, to: page1Container)
        constrainView(exercise1VC.view, to: page2Container)
        constrainView(exercise2VC.view, to: page3Container)
        constrainView(exercise3VC.view, to: page4Container)
        constrainView(exercise4VC.view, to: page5Container)
        constrainView(workoutFinishedVC.view, to: page6Container)
    }
    

    func constrainView(_ view1: UIView, to view2: UIView) {
        view2.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.leftAnchor.constraint(equalTo: view2.leftAnchor).isActive = true
        view1.rightAnchor.constraint(equalTo: view2.rightAnchor).isActive = true
        view1.topAnchor.constraint(equalTo: view2.topAnchor).isActive = true
        view1.bottomAnchor.constraint(equalTo: view2.bottomAnchor).isActive = true
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

extension WorkoutVC : UIScrollViewDelegate, ExerciseVCDelegate {
    
    func formatScrollView() {
        masterScrollView.delegate = self
    }
    
    func moveScrollViewTo(page: Int, animated: Bool) {
        let point = CGPoint(x: screenWidth * CGFloat((page - 1)), y: 0)
        masterScrollView.setContentOffset(point, animated: animated)
    }
    
    func exerciseFinishedTapped(number: Int) {
        moveScrollViewTo(page: number + 1, animated: true)
    }

}
