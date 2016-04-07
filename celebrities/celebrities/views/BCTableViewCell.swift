//
//  BCTableViewCell.swift
//  celebrities
//
//  Created by Brian Correa on 4/7/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCTableViewCell: UITableViewCell {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //here is where we customize the cell
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        let frame = UIScreen.mainScreen().bounds
        
        self.selectionStyle = .None
        
        self.textLabel?.textColor = UIColor.redColor()
        self.imageView?.layer.cornerRadius = 37.5
        self.imageView?.layer.masksToBounds = true
        
//        let starIcon_1 = UIImageView(frame: CGRect(x: frame.size.width-28, y:4, width: 24, height: 24))
//        starIcon_1.image = UIImage(named: "star.png")
//        self.contentView.addSubview(starIcon_1)
//        
//        let starIcon_2 = UIImageView(frame: CGRect(x: frame.size.width-56, y:4, width: 24, height: 24))
//        starIcon_2.image = UIImage(named: "star.png")
//        self.contentView.addSubview(starIcon_2)
//        
//        let starIcon_3 = UIImageView(frame: CGRect(x: frame.size.width-84, y:4, width: 24, height: 24))
//        starIcon_3.image = UIImage(named: "star.png")
//        self.contentView.addSubview(starIcon_3)
        
        for var i in 0..<3 {
            let offset = frame.size.width-24*(CGFloat(i)+1)-4
            let starIcon = UIImageView(frame: CGRect(x: offset, y:4, width: 24, height: 24))
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
