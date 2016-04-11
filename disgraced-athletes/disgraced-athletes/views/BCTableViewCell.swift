//
//  BCTableViewCell.swift
//  disgraced-athletes
//
//  Created by Brian Correa on 4/8/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    var icon: UIImageView!
    var commentText: UILabel!
    var timeStamplabel: UILabel!
    
    //MARK: My Functions

    func resizeCell(height: CGFloat){
        
        var commentTextFrame = self.commentText.frame
        commentTextFrame.size.height = height
        self.commentText.frame = commentTextFrame
        
        self.timeStamplabel = UILabel(frame: CGRect(x: commentText.frame.origin.x, y: commentText.frame.origin.y+commentText.frame.height, width: frame.size.width-100, height: 20))
        
        self.timeStamplabel.font = UIFont.systemFontOfSize(14)
        self.timeStamplabel.textColor = UIColor.blueColor()
        self.contentView.addSubview(timeStamplabel)
        
    }
    
    //MARK: Lifecycle Methods
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //customizing the cell
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let frame = UIScreen.mainScreen().bounds

        self.commentText = UILabel(frame: CGRect(x: 120, y: 30, width: frame.size.width-100, height: 20))
//        self.commentText.autoresizingMask = .FlexibleTopMargin
        
        self.commentText.font = UIFont.systemFontOfSize(14)
        self.commentText.numberOfLines = 0
        self.commentText.lineBreakMode = .ByWordWrapping
        self.commentText.textColor = UIColor.redColor()
        self.contentView.addSubview(self.commentText)
//        self.contentView.backgroundColor = UIColor.lightGrayColor()
        

        
        self.selectionStyle = .None
        
        self.icon = UIImageView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        self.icon?.layer.cornerRadius = 50
        self.icon?.layer.masksToBounds = true
        self.contentView.addSubview(icon)

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
