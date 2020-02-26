//
//  ViewController.swift
//  BartaNews
//
//  Created by apple on 2/24/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    var modelData = [Evething]()
    
    var articles = [String]()
    var authors = [String]()
    var titles = [String]()
    var descriptions = [String]()
    var urls = [String]()
    var urlToImages = [String]()
    var publishedAts = [String]()
    var contents = [String]()
    
    @IBOutlet weak var newssTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.newssTable.rowHeight = 340
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
                            self.titles.append(item.title!)
                            self.publishedAts.append(item.publishedAt!)
                            self.urlToImages.append(item.urlToImage!)
                            self.contents.append(item.content!)
                            self.authors.append(item.author!)
                            self.descriptions.append(item.description!)
                            self.urls.append(item.url!)
                        }
                        self.newssTable.reloadData()
                    }
                    
                } catch {
                    // I find it handy to keep track of why the decoding has failed. E.g.:
                    print(error)
                    // Insert error handling here
                }
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = tableView.dequeueReusableCell(withIdentifier: "cell") as! NewsCell
        cells.NewsTitle.text = titles[indexPath.row]
        cells.NewsDate.text = publishedAts[indexPath.row]
        
        if let imgUrl = urlToImages[indexPath.row] as? String {
            if let url = URL(string: imgUrl){
                cells.NewsImage.af_setImage(withURL: url)
            }
        }
        return cells
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ShowNews") as! ShowNews
        
        vc.urlToImagess = urlToImages[indexPath.row]
        vc.titless = titles[indexPath.row]
        vc.publishedAtss = publishedAts[indexPath.row]
        vc.descriptionss = descriptions[indexPath.row]
        vc.contentss = contents[indexPath.row]
        vc.urlss = urls[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

