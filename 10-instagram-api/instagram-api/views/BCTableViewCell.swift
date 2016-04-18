//
//  BCTableViewCell.swift
//  instagram-api
//
//  Created by Brian Correa on 4/13/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCTableViewCell: UITableViewCell {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let frame = UIScreen.mainScreen().bounds
        self.textLabel?.font = UIFont.systemFontOfSize(14)
//        self.textLabel?.numberOfLines = 0
//        self.textLabel?.lineBreakMode = .ByWordWrapping
//        self.textLabel?.autoresizingMask = .FlexibleTopMargin
//        self.textLabel?.textColor = UIColor.redColor()

//        self.selectionStyle = .None
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
