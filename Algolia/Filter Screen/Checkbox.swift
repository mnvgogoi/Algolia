//
//  Checkbox.swift
//  Algolia
//
//  Created by Vantage Circle on 26/08/22.
//

import Foundation
import UIKit

class CheckBox: UIButton {
    var checked = false {
        didSet {
            if checked == true {
                self.setImage(#imageLiteral(resourceName: "ButtonClicked"), for: .normal)
            }
            else {
                self.setImage(#imageLiteral(resourceName: "ButtonUnclicked"), for: .normal)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tapped() {
        self.checked = !self.checked
        if checked == true {
            self.setImage(#imageLiteral(resourceName: "ButtonClicked"), for: .normal)
        }
        else {
            self.setImage(#imageLiteral(resourceName: "ButtonUnclicked"), for: .normal)
        }
    }
}
