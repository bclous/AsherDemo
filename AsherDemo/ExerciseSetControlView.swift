//
//  ExerciseSetControlView.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/8/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class ExerciseSetControlView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var thisSetLabel: UILabel!
    @IBOutlet weak var thisSetDescriptionLabel: UILabel!
    @IBOutlet weak var timeOrRepsLabel: UILabel!
    @IBOutlet weak var leftOrRightOrTimeOrRepsLabel: UILabel!
    @IBOutlet weak var yourBestAmountLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var yourBestView: UIView!
    @IBOutlet weak var yourBestContainerView: UIView!
    
    let timer = Timer()
    var counter : Int = 0
    var numberOfReps = 0
    
    
    var exerciseSet : ExerciseSet?
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ExerciseSetControlView", owner: self, options: nil)
        guard let content = contentView else { return }
        self.addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        content.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        content.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        content.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    public func formatControlView(exercise: ExerciseSet) {
        
        exerciseSet = exercise
        if let exerciseSet = exerciseSet {
            
            slider.alpha = exerciseSet.isReps ? 1 : 0
            resetButton.alpha = exerciseSet.isReps ? 0 : 1
            startStopButton.alpha = exerciseSet.isReps ? 0 : 1
            thisSetLabel.text = "THIS SET:"
            thisSetDescriptionLabel.text = exerciseSet.userTitleHint
            timeOrRepsLabel.text = exerciseSet.isReps ? "0" : "0:00"
            resetButton.layer.cornerRadius = 5
            startStopButton.layer.cornerRadius = 5
            yourBestContainerView.layer.cornerRadius = 5
            thisSetDescriptionLabel.text = exerciseSet.isReps ? "Do as many as feels right" : "Hold for as long as feels right"
            
            if exerciseSet.isLeftSide {
                leftOrRightOrTimeOrRepsLabel.text = "L:"
            } else if exerciseSet.isRightSide {
                leftOrRightOrTimeOrRepsLabel.text = "R:"
            } else {
                leftOrRightOrTimeOrRepsLabel.text = exerciseSet.isReps ? "REPS:" : "TIME:"
            }
            
            yourBestAmountLabel.text = exerciseSet.isReps ? "15" : "0:15"
            
        }
    }
    
    public func saveValuesToExerciseSet() {
        // save to core data
        
        if let exerciseSet = exerciseSet {
            if exerciseSet.isReps {
                exerciseSet.repsCompleted = Int64(numberOfReps)
            } else {
                exerciseSet.timeCompleted = Int64(counter)
            }
        }
        
        // save context
        
    }

    @IBAction func startStopTapped(_ sender: Any) {
    }

    @IBAction func resetTapped(_ sender: Any) {
    }
}
