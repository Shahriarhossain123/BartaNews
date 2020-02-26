//
//  VideosCell.swift
//  BartaNews
//
//  Created by apple on 2/25/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class VideosCell: UITableViewCell {
    
    @IBOutlet weak var ShowV: PlayerViewClass!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ShowV.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
