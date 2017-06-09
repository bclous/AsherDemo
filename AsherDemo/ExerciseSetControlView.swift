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
    let timer = Timer()
    var counter : Int = 0
    
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
            
            // do stuff here
            
        }

    }
    
    public func saveValuesToExerciseSet() {
        
    }


}
