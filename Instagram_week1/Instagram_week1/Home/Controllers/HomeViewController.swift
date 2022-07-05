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

        setUI()
    }
    func setUI() {

        let tableViewLib = UINib(nibName: HomeContentTableViewCell.identifier, bundle: nil)
        tableView.register(tableViewLib, forCellReuseIdentifier: "HomeContentTableViewCell")
        
        let collectionViewLib = UINib(nibName: HomeStoryCollectionViewCell.identifier, bundle: nil)
        collectionView.register(collectionViewLib, forCellWithReuseIdentifier: "HomeStoryCollectionViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 0)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 4
        layout.estimatedItemSize = CGSize(width: 58.0, height: 72)
        
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeContentTableViewCell") as! HomeContentTableViewCell
        cell.setData(post: PostModel.samplePost[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostModel.samplePost.count
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeStoryCollectionViewCell", for: indexPath) as! HomeStoryCollectionViewCell
        cell.setData(story: StoryModel.sampleStory[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoryModel.sampleStory.count
    }
}
