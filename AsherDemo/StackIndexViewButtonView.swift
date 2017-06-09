//
//  ScrollViewIndexButtonView.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/8/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

protocol StackIndexViewButtonViewDelegate: class {
    func indexTapped(index: Int)
}

class StackIndexViewButtonView: UIView {
    
    @IBOutlet var contentView: UIView!
    var index : Int?
    weak var delegate : StackIndexViewButtonViewDelegate?

    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("StackIndexViewButtonView", owner: self, options: nil)
        guard let content = contentView else { return }
        self.addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        content.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        content.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        content.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        if let index = index {
            delegate?.indexTapped(index: index)
        }
    }

}
