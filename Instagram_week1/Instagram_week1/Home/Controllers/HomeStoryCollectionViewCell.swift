//
//  HomeStoryCollectionViewCell.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/05/05.
//

import UIKit

class HomeStoryCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "HomeStoryCollectionViewCell"
    
    @IBOutlet weak var imaegView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(story : StoryModel) {
        imaegView.image = UIImage(named: story.userProfileimageName)
        userNameLabel.text = story.userName
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 4))
    }
    
}
