//
//  PlayerViewClass.swift
//  BartaNews
//
//  Created by apple on 2/25/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayerViewClass: UIView {
    
    override static var layerClass: AnyClass{
        return AVPlayerLayer.self
    }
    
    var playerLayer : AVPlayerLayer{
        return layer as! AVPlayerLayer
    }
    
    var player : AVPlayer?{
        get{
            return playerLayer.player
        }
        
        set{
            playerLayer.player = newValue
        }
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
