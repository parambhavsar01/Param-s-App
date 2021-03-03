//
//  ViewController.swift
//  Param's App
//
//  Created by Param Bhavsar on 26/02/21.
//  Copyright © 2021 Param Bhavsar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabeView: UITableView!
    
    var stories: [Story] = [
        Story(id: 1, title: "First Post", imgUrl: "https://www.summachar.in/wp-content/uploads/2021/02/Cover-Images-3-1024x576.jpg"),
        Story(id: 2, title: "Second Post", imgUrl: "https://www.summachar.in/wp-content/uploads/2021/02/Cover-Images-7-1024x576.jpg"),
        Story(id: 3, title: "Third Post", imgUrl: "https://www.summachar.in/wp-content/uploads/2021/02/Cover-Images-8-1024x576.jpg"),
        Story(id: 4, title: "Forth Post", imgUrl: "https://www.summachar.in/wp-content/uploads/2021/02/Cover-Images-2021-02-23T172913.609-1024x576.jpg"),
        Story(id: 5, title: "Fifth Post", imgUrl: "https://www.summachar.in/wp-content/uploads/2021/02/Cover-Images-5-1024x576.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabeView.delegate = self
        tabeView.dataSource = self
        tabeView.register(UINib(nibName: "StoryCellTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabeView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! StoryCellTableViewCell

        cell.label.text = stories[indexPath.row].title
        return cell
    }
    
    
    
    
}

