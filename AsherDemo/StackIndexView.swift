//
//  ScrollViewIndexView.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/8/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

protocol StackIndexViewDelegate: class {
    func indexTapped(_ : Int)
}

class StackIndexView: UIView, StackIndexViewButtonViewDelegate {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var masterStackView: UIStackView!
    weak var delegate : StackIndexViewDelegate?
    var colorActive = UIColor.black
    var colorInactive = UIColor.lightGray

    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("StackIndexView", owner: self, options: nil)
        guard let content = contentView else { return }
        self.addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        content.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        content.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        content.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    public func formatIndexView(numberOfIndices: Int, activeColor: UIColor, inactiveColor: UIColor) {
        
        colorActive = activeColor
        colorInactive = inactiveColor
        
        for index in 1...numberOfIndices {
            let buttonView = StackIndexViewButtonView()
            buttonView.index = index
            buttonView.delegate = self
            buttonView.contentView.backgroundColor = index == 1 ? activeColor : inactiveColor
            masterStackView.addArrangedSubview(buttonView)
        }
    }
    
    public func formatForChosenIndex(_ index: Int, animated: Bool) {
        let duration = animated ? 0.2 : 0
        let buttonViews = masterStackView.arrangedSubviews as! [StackIndexViewButtonView]
        
        UIView.animate(withDuration: duration) { 
            for buttonView in buttonViews {
                buttonView.contentView.backgroundColor = index == buttonView.index ? self.colorActive : self.colorInactive
            }
        }
    }
    
    func indexTapped(index: Int) {
        delegate?.indexTapped(index)
        formatForChosenIndex(index, animated: false)
    }
    
}
