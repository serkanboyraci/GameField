//
//  AddNoteButton.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 21.01.2023.
//

import UIKit

protocol AddNoteButtonViewDelegate: AnyObject {
    func pushViewController()
}

final class AddNoteButton: UIView {
    
    //MARK: - Property
    weak var delegate: AddNoteButtonViewDelegate?
    
    //MARK: - initilize
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let nib = UINib(nibName: "AddNoteButtonView", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            addSubview(view)
            view.frame = self.bounds
        }
    }
    

    

}
