//
//  VideosVC.swift
//  BartaNews
//
//  Created by apple on 2/24/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import ARKit

class VideosVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var videoSho: UITableView! 
    
    let shotTableViewCellIdentifier = "ShotTableViewCell"
    let loadingCellTableViewCellCellIdentifier = "LoadingCellTableViewCell"
    var refreshControl: UIRefreshControl!
    let videos = [
        "https://v.pinimg.com/videos/720p/75/40/9a/75409a62e9fb61a10b706d8f0c94de9a.mp4",
        "https://v.pinimg.com/videos/720p/75/40/9a/75409a62e9fb61a10b706d8f0c94de9a.mp4",
        "https://v.pinimg.com/videos/720p/75/40/9a/75409a62e9fb61a10b706d8f0c94de9a.mp4",
        "https://v.pinimg.com/videos/720p/0d/29/18/0d2918323789eabdd7a12cdd658eda04.mp4",
        "https://v.pinimg.com/videos/720p/dd/24/bb/dd24bb9cd68e9e25d1def88cad0a9ea7.mp4",
        "https://v.pinimg.com/videos/720p/d5/15/78/d51578c69d36c93c6e20144e9f887c73.mp4",
        "https://v.pinimg.com/videos/720p/c2/6d/2b/c26d2bacb4a9f6402d2aa0721193e06e.mp4",
        
        "https://v.pinimg.com/videos/720p/62/81/60/628160e025f9d61b826ecc921b9132cd.mp4",
        "https://v.pinimg.com/videos/720p/5f/aa/3d/5faa3d057eb31dd05876f622ea2e7502.mp4",
        "https://v.pinimg.com/videos/720p/65/b0/54/65b05496c385c89f79635738adc3b15d.mp4"
    ]
    
    let videoImages = [
        "https://img.youtube.com/vi/XFG0i1cv2zY/sddefault.jpg",
        "https://img.youtube.com/vi/XFG0i1cv2zY/sddefault.jpg",
        "https://img.youtube.com/vi/XFG0i1cv2zY/sddefault.jpg",
        "https://img.youtube.com/vi/XFG0i1cv2zY/sddefault.jpg",
        "https://img.youtube.com/vi/XFG0i1cv2zY/sddefault.jpg",
        "https://img.youtube.com/vi/XFG0i1cv2zY/sddefault.jpg",
        "https://img.youtube.com/vi/XFG0i1cv2zY/sddefault.jpg",
        "https://img.youtube.com/vi/XFG0i1cv2zY/sddefault.jpg",
        "https://img.youtube.com/vi/XFG0i1cv2zY/sddefault.jpg",
        "https://img.youtube.com/vi/XFG0i1cv2zY/sddefault.jpg"
    ]
    let videoIndexes = [0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoSho.estimatedRowHeight = 100
        videoSho.rowHeight = UITableView.automaticDimension
        var cellNib = UINib(nibName:shotTableViewCellIdentifier, bundle: nil)
        self.videoSho.register(cellNib, forCellReuseIdentifier: shotTableViewCellIdentifier)
        cellNib = UINib(nibName:loadingCellTableViewCellCellIdentifier, bundle: nil)
        videoSho.register(cellNib, forCellReuseIdentifier: loadingCellTableViewCellCellIdentifier)
        videoSho.separatorStyle = .none
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.appEnteredFromBackground),
                                               name: UIApplication.willEnterForegroundNotification, object: nil)
        self.videoSho.rowHeight = 372
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pausePlayeVideos()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: shotTableViewCellIdentifier, for: indexPath) as! ShotTableViewCell
        if let videoIndex = videoIndexes[indexPath.row] {
            cell.configureCell(imageUrl: videoImages[videoIndex], description: "Video", videoUrl: videos[indexPath.row])
        }
        else{
            cell.configureCell(imageUrl: videos[indexPath.row], description: "Image", videoUrl: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let videoCell = cell as? ASAutoPlayVideoLayerContainer, let _ = videoCell.videoURL {
            ASVideoPlayerController.sharedVideoPlayer.removeLayerFor(cell: videoCell)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pausePlayeVideos()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            pausePlayeVideos()
        }
    }
    
    func pausePlayeVideos(){
        ASVideoPlayerController.sharedVideoPlayer.pausePlayeVideosFor(tableView: videoSho)
    }
    
    @objc func appEnteredFromBackground() {
        ASVideoPlayerController.sharedVideoPlayer.pausePlayeVideosFor(tableView: videoSho, appEnteredFromBackground: true)
    }
    
}
