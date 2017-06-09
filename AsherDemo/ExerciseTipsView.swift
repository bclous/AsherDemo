//
//  ExerciseTipsView.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/9/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class ExerciseTipsView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var tipsLabel: UILabel!
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    @IBOutlet weak var tip4Label: UILabel!
    
    var exercise : Exercise?
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ExerciseTipsView", owner: self, options: nil)
        guard let content = contentView else { return }
        self.addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        content.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        content.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        content.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    public func formatTipViewFor(exercise: Exercise) {
        self.exercise = exercise
        
        tip1Label.text = exercise.tip1
        tip2Label.text = exercise.tip2
        tip3Label.text = exercise.tip3
        tip4Label.text = exercise.tip4
        tipsLabel.text = "TIP TIP TIPS"
        
        
    }
    
    


}
