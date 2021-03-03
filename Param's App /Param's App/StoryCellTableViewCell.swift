//
//  StoryCellTableViewCell.swift
//  Param's App
//
//  Created by Param Bhavsar on 28/02/21.
//  Copyright © 2021 Param Bhavsar. All rights reserved.
//

import UIKit

class StoryCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var likeBtn: UIButton!
    
    //@IBOutlet weak var shareBtn: UIButton!
    
    @IBOutlet weak var bkmarkBtn: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //collectionView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImageViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageViewReusableCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   @IBAction func likeClicked(_ sender: Any) {
     
     if likeBtn.tag == 0 //empty
     {
     likeBtn.setImage(UIImage(named: "my heart 50"), for: .normal)
     likeBtn.tag = 1
     }
     else{
     
     likeBtn.setImage(UIImage(named: "my red heart 50"), for: .normal)
     likeBtn.tag = 0
     }
     
    }
    
    
    @IBAction func shareClicked(_ sender: Any) {
        
        let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self
        
        //self.presentViewController(activityVC, animated: true, completion: nil)
        UIApplication.shared.inputViewController?.present(activityVC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func bkmarkClicked(_ sender: Any) {
     
        if bkmarkBtn.tag == 1 //empty
        {
            bkmarkBtn.setImage(UIImage(named: "bookmark 50"), for: .normal)
            bkmarkBtn.tag = 0
        }
        else{
            
            bkmarkBtn.setImage(UIImage(named: "blue bookmark"), for: .normal)
            bkmarkBtn.tag = 1
        }
     
    }
    
    
}

extension StoryCellTableViewCell : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellInRow : Int = 1
        let padding : Int = 0
        let collectionCellWidth : CGFloat =  (self.collectionView.frame.size.width/CGFloat(numberOfCellInRow)) - CGFloat(padding)
        return CGSize(width: collectionCellWidth , height: collectionCellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageViewReusableCell", for: indexPath) as! ImageViewCell
        
        backgroundView?.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true // 30 is my added up left and right Inset
        backgroundView?.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView?.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backgroundView?.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundView?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        guard let imageUrl = URL(string: "https://www.summachar.in/wp-content/uploads/2021/02/Cover-Images-5-1024x576.jpg") else {return imageCell}
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                
                imageCell.imageViewCell.image = image
            }
        }
        
        return imageCell
    }
    
    
}
