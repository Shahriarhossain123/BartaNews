//
//  ShowNews.swift
//  BartaNews
//
//  Created by apple on 2/25/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ShowNews: UIViewController {

    @IBOutlet weak var getPhoto: UIImageView!
    @IBOutlet weak var getTitle: UITextView!
    @IBOutlet weak var getDate: UILabel!
    @IBOutlet weak var getConten: UITextView!
    @IBOutlet weak var GetArticlas: UILabel!
    
    var articless = String()
    var authorss = String()
    var titless = String()
    var descriptionss = String()
    var urlss = String()
    var urlToImagess = String()
    var publishedAtss = String()
    var contentss = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataAtView()
        
        let btnShare = UIBarButtonItem(barButtonSystemItem:.action, target: self, action: #selector(btnShare_clicked))
                self.navigationItem.rightBarButtonItem = btnShare
        //
               self.navigationController?.navigationBar.tintColor = UIColor.lightGray
        //
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
                self.navigationController?.navigationBar.shadowImage = UIImage()
                self.navigationController?.navigationBar.isTranslucent = true
        // Do any additional setup after loading the view.
    }
    

    func setDataAtView() {
        getTitle.text = titless
        getDate.text = publishedAtss
        GetArticlas.text = authorss
        getConten.text = "\(descriptionss) \n \n \(contentss)"
        
        let url = URL(string: urlToImagess)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.getPhoto.image = UIImage(data: data!)
            }
        }
    }
    
    @objc func btnShare_clicked() {
        let items = [URL(string: urlss)!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
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
