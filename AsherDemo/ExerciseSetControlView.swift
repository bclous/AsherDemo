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
    @IBOutlet weak var leftOrRightOrTimeOrRepsLabel: UILabel!
    @IBOutlet weak var yourBestAmountLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var yourBestView: UIView!
    @IBOutlet weak var yourBestContainerView: UIView!
    @IBOutlet weak var yourBestHeaderView: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    
    var timer = Timer()
    var counter : Int = 0
    var numberOfReps = 0
    var isClockRunning = false
    
    
    var exerciseSet : ExerciseSet?
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func timerFired() {
        counter = counter + 1
        updateLabel()
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
        
        startStopButton.backgroundColor = UIColor.green
        resetButton.backgroundColor = UIColor.lightGray
        yourBestHeaderView.backgroundColor = TTConstants.mainYellowColor
        
       
    }
    
    public func formatControlView(exercise: ExerciseSet) {
        
        exerciseSet = exercise
        if let exerciseSet = exerciseSet {
            
            slider.alpha = exerciseSet.isReps ? 1 : 0
            resetButton.alpha = exerciseSet.isReps ? 0 : 1
            startStopButton.alpha = exerciseSet.isReps ? 0 : 1
            thisSetLabel.text = "THIS SET:"
            thisSetDescriptionLabel.text = exerciseSet.userTitleHint
            resetButton.layer.cornerRadius = 5
            startStopButton.layer.cornerRadius = 5
            yourBestContainerView.layer.cornerRadius = 5
            thisSetDescriptionLabel.text = exerciseSet.isReps ? "Do as many as feels right" : "Hold for as long as feels right"
            repsLabel.isHidden = !exerciseSet.isReps
            minutesLabel.isHidden = exerciseSet.isReps
            secondsLabel.isHidden = exerciseSet.isReps
        
            
            if exerciseSet.isLeftSide {
                leftOrRightOrTimeOrRepsLabel.text = "LEFT:"
            } else if exerciseSet.isRightSide {
                leftOrRightOrTimeOrRepsLabel.text = "RIGHT:"
            } else {
                leftOrRightOrTimeOrRepsLabel.text = exerciseSet.isReps ? "REPS:" : "TIME:"
            }
            startStopButton.backgroundColor = TTConstants.mainYellowColor
            
            yourBestAmountLabel.text = exerciseSet.isReps ? "15" : "0:15"
            
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
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
    @IBAction func sliderMoved(_ sender: Any) {
        repsLabel.text = "\(Int(slider.value))"
    }

    @IBAction func startStopTapped(_ sender: Any) {
        
        if isClockRunning {
            timer.invalidate()
            startStopButton.setTitle("START", for: .normal)
            startStopButton.backgroundColor = TTConstants.mainYellowColor
            isClockRunning = false
        } else {
            startTimer()
            startStopButton.setTitle("STOP", for: .normal)
            startStopButton.backgroundColor = UIColor.red
            isClockRunning = true
        }
        
    }
    
    

    @IBAction func resetTapped(_ sender: Any) {
        
        if !isClockRunning {
            counter = 0
            updateLabel()
        }
    }
    
    func updateLabel() {
        secondsLabel.text = secondsStringFromCounter()
        minutesLabel.text = minutesStringFromCounter()
    }
    
    func secondsStringFromCounter() -> String {
        let seconds = counter % 60
        return seconds < 10 ? "0" + "\(seconds)" : "\(seconds)"
    }
    
    func minutesStringFromCounter() -> String {
        let minutes = counter / 60
        return "\(minutes):"
    }
    
    func timeStringFromCounter() -> String {
        let seconds = counter % 60
        let minutes = counter / 60
        
        let secondsString = seconds < 10 ? "0" + "\(seconds)" : "\(seconds)"
        return "\(minutes)" + ":" + secondsString
    }
    

    

}
