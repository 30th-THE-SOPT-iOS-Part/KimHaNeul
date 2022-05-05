//
//  HomeViewController.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/05/03.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: HomeContentTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HomeContentTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
        
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeContentTableViewCell") as! HomeContentTableViewCell
        cell.setData(post: PostModel.samplePost[indexPath.row])
        cell.selectionStyle = .none
        cell.contentLabel.sizeToFit()
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostModel.samplePost.count
    }
    
}
//extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//}
