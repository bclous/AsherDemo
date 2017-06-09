//
//  ExerciseSetControlMasterView.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/9/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class ExerciseSetControlMasterView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var masterScrollView: UIScrollView!
    @IBOutlet weak var leftArrowImage: UIImageView!
    @IBOutlet weak var rightArrowImage: UIImageView!
    var
    
    
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
    }

    @IBAction func leftButtonTapped(_ sender: Any) {
    }
    @IBAction func rightButtonTapped(_ sender: Any) {
    }
    
    

}