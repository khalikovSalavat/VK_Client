//
//  Repost.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 20.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit


class RepostControl: PostCellControl {
    
    override func awakeFromNib() {
        
        imageName = "arrowshape.turn.up.right"
        super.awakeFromNib()
        countLabel.text = ""
    }
}
