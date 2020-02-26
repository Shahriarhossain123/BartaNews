//
//  NewsCell.swift
//  BartaNews
//
//  Created by apple on 2/25/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var ContentAllView: UIView!
    @IBOutlet weak var NewsImage: UIImageView!
    @IBOutlet weak var NewsTitle: UITextView!
    @IBOutlet weak var NewsDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ContentAllView.layer.cornerRadius = 10
        NewsImage.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
