//
//  ShotTableViewCell.swift
//  BartaNews
//
//  Created by apple on 2/26/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import AVFoundation
class ShotTableViewCell: UITableViewCell, ASAutoPlayVideoLayerContainer {
    @IBOutlet weak var ConView: UIView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var shotImageView: UIImageView!
    var playerController: ASVideoPlayerController?
    var videoLayer: AVPlayerLayer = AVPlayerLayer()
    var videoURL: String? {
        didSet {
            if let videoURL = videoURL {
                ASVideoPlayerController.sharedVideoPlayer.setupVideoFor(url: videoURL)
            }
            videoLayer.isHidden = videoURL == nil
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ConView.layer.cornerRadius = 10
        ConView.layer.shadowColor = UIColor.black.cgColor
        ConView.layer.shadowOpacity = 1
        ConView.layer.shadowOffset = .zero
        ConView.layer.shadowRadius = 5
        
        shotImageView.layer.cornerRadius = 10
        shotImageView.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
        shotImageView.clipsToBounds = true
        shotImageView.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        shotImageView.layer.borderWidth = 0.5
        
        videoLayer.backgroundColor = UIColor.clear.cgColor
        videoLayer.videoGravity = AVLayerVideoGravity.resize
        
        shotImageView.layer.addSublayer(videoLayer)
        
        selectionStyle = .none
    }
    
    func configureCell(imageUrl: String?,
                       description: String,
                       videoUrl: String?) {
        self.descriptionLabel.text = description
        self.shotImageView.imageURL = imageUrl
        self.videoURL = videoUrl
    }
    
    override func prepareForReuse() {
        shotImageView.imageURL = nil
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let horizontalMargin: CGFloat = 20
        let width: CGFloat = bounds.size.width - horizontalMargin * 2
        let height: CGFloat = (width * 0.9).rounded(.up)
        videoLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    func visibleVideoHeight() -> CGFloat {
        let videoFrameInParentSuperView: CGRect? = self.superview?.superview?.convert(shotImageView.frame, from: shotImageView)
        guard let videoFrame = videoFrameInParentSuperView,
            let superViewFrame = superview?.frame else {
                return 0
        }
        let visibleVideoFrame = videoFrame.intersection(superViewFrame)
        return visibleVideoFrame.size.height
    }
}
