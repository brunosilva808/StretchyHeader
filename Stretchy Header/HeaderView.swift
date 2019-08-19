//
//  HeaderView.swift
//  Stretchy Header
//
//  Created by Bruno Silva on 19/08/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // custom code for lauyout
        
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
