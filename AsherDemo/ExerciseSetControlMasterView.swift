//
//  ExerciseSetControlMasterView.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/9/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

protocol ControlMasterViewDelegate : class {
    func isLastSetInExercise(_: Bool)
}

class ExerciseSetControlMasterView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var masterScrollView: UIScrollView!
    @IBOutlet weak var leftArrowImage: UIImageView!
    @IBOutlet weak var rightArrowImage: UIImageView!
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var exercise : Exercise?
    var frameWidth : CGFloat = 375
    var numberOfSets = 1
    let mainStackView = UIStackView()
    var currentPage = 1
    var controlViews : [ExerciseSetControlView] = []
    
    weak var delegate :
    
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ExerciseSetControlMasterView", owner: self, options: nil)
        guard let content = contentView else { return }
        self.addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        content.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        content.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        content.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        formatScrollView()
    }

    @IBAction func leftButtonTapped(_ sender: Any) {
        let currentView = controlViews[currentPage - 1]
        currentView.saveValuesToExerciseSet()
        adjustScrollView(toPage: currentPage - 1, animated: true)
        
        
    }
    @IBAction func rightButtonTapped(_ sender: Any) {
        let currentView = controlViews[currentPage - 1]
        currentView.saveValuesToExerciseSet()
        adjustScrollView(toPage: currentPage + 1, animated: true)
    }
    
    public func formatMasterViewForExercise(_ exercise: Exercise, frameWidth: CGFloat) {
        self.frameWidth = frameWidth
        
        if let sets = exercise.sets {
            let exerciseSets = sets.allObjects as! [ExerciseSet]
            formatForSets(exerciseSets)
            createStackView()
            
            for set in exerciseSets {
                createControlViewForExerciseSet(set)
            }
        }
        
        adjustLeftAndRightButtons()

    }
    
    private func formatForSets(_ sets: [ExerciseSet]) {
        let multipleSets = sets.count > 1
        numberOfSets = sets.count
        adjustView(multipleSets: multipleSets)
    }
    
    private func adjustView(multipleSets: Bool) {
        rightConstraint.constant = multipleSets ? 20 : 0
        leftConstraint.constant = multipleSets ? 20 : 0
        leftArrowImage.alpha = multipleSets ? 1 : 0
        rightArrowImage.alpha = multipleSets ? 1 : 0
        leftButton.isEnabled = multipleSets
        rightButton.isEnabled = multipleSets
    }
    
    private func createStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.distribution = .fillEqually
        masterScrollView.addSubview(mainStackView)
        mainStackView.leftAnchor.constraint(equalTo: masterScrollView.leftAnchor)
        mainStackView.rightAnchor.constraint(equalTo: masterScrollView.rightAnchor)
        mainStackView.topAnchor.constraint(equalTo: masterScrollView.topAnchor)
        mainStackView.bottomAnchor.constraint(equalTo: masterScrollView.bottomAnchor)
        mainStackView.heightAnchor.constraint(equalTo: masterScrollView.heightAnchor)
        mainStackView.widthAnchor.constraint(equalTo: masterScrollView.widthAnchor, multiplier: CGFloat(numberOfSets))
    }
    
    private func createControlViewForExerciseSet(_ set: ExerciseSet) {
        let controlView = ExerciseSetControlView()
        controlView.formatControlView(exercise: set)
        mainStackView.addArrangedSubview(controlView)
        controlViews.append(controlView)
    }

}

extension ExerciseSetControlMasterView : UIScrollViewDelegate {
    
    func formatScrollView() {
        masterScrollView.delegate = self
    }
    
    func adjustScrollView(toPage page: Int, animated: Bool) {
        let offset = CGFloat(page - 1) * frameWidth
        let point = CGPoint(x: offset, y: 0)
        masterScrollView.setContentOffset(point, animated: animated)
        currentPage = page
        adjustLeftAndRightButtons()
    }
    
    func adjustLeftAndRightButtons() {
        let lastSet = currentPage >= numberOfSets
        let firstSet = currentPage == 1
        
        leftButton.isEnabled = !firstSet
        rightButton.isEnabled = !lastSet
        leftArrowImage.alpha = firstSet ? 0.3 : 1
        rightArrowImage.alpha = lastSet ? 0.3 : 1
        
    }
}
