//
//  PhotosVC.swift
//  BartaNews
//
//  Created by apple on 2/24/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var PhotoCollection: UICollectionView!
    
    var urlToImages = [String]()
    let getImage = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Photos"
        
        // Do any additional setup after loading the view.
        loadData()
    }
    
    func loadData() {
        let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=7c4fb781cfee433189b23fa66053b8eb")!
        URLSession.shared.dataTask(with: url) {data, _, _ in
            
            if let data = data {
                do {
                    let myData = try? JSONDecoder().decode(Evething.self, from: data)
                    DispatchQueue.main.async {
                        for item in ((myData?.articles)!){
                            self.urlToImages.append(item.urlToImage!)
                        }
                        self.PhotoCollection.reloadData()
                    }
                } catch {
                    // I find it handy to keep track of why the decoding has failed. E.g.:
                    print(error)
                    // Insert error handling here
                }
            }
        }.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urlToImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let show = collectionView.dequeueReusableCell(withReuseIdentifier: "pcell", for: indexPath) as! PhotoViewCell
        
        if let imgUrl = urlToImages[indexPath.row] as? String {
            if let url = URL(string: imgUrl){
                show.ShowPhotos.af_setImage(withURL: url)
            }
        }
        
        return show
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let url = URL(string: urlToImages[indexPath.row])
        let data = try? Data(contentsOf: url!)
        let images = UIImage(data: data!)
        
        let ImageInfo = GSImageInfo(image: images!, imageMode: .aspectFit)
        let TransitionInfo = GSTransitionInfo(fromView: collectionView)
        let imageViewer = GSImageViewerController(imageInfo: ImageInfo, transitionInfo: TransitionInfo)
        
        present(imageViewer, animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
