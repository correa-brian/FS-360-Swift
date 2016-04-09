//
//  BCTableViewCell.swift
//  disgraced-athletes
//
//  Created by Brian Correa on 4/8/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCTableViewCell: UITableViewCell {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //customizing the cell
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
        let frame = UIScreen.mainScreen().bounds
        self.textLabel?.font = UIFont.systemFontOfSize(14)
        self.textLabel?.numberOfLines = 0
        self.textLabel?.lineBreakMode = .ByWordWrapping
        
        self.selectionStyle = .None
        
        self.textLabel?.textColor = UIColor.blueColor()
        self.imageView?.layer.cornerRadius = 100
        self.imageView?.layer.masksToBounds = true
        
        for var i in 0..<3 {
            let offset = frame.size.width-24*(CGFloat(i)+1)-4
            let starIcon = UIImageView(frame: CGRect(x: offset, y: 4, width: 24, height: 24))
            starIcon.image = UIImage(named: "star.png")
            self.contentView.addSubview(starIcon)
        }
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
