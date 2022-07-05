//
//  HomeContentTableViewCell.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/05/03.
//

import UIKit

class HomeContentTableViewCell: UITableViewCell {

    static let identifier: String = "HomeContentTableViewCell"
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var postUserNameLabel: UILabel!
    @IBOutlet weak var likedCountLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    // MARK: - @IBAction Properties
    @IBAction func likeButtonDidTapped(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
    }
    
    // MARK: - Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }
    
    func setUI() {
        postImageView.contentMode = .scaleAspectFill
        likeButton.setImage(UIImage(named: "icn_unlike"), for: .normal)
        likeButton.setImage(UIImage(named: "icn_like"), for: .selected)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(post : PostModel) {
        userImageView.image = UIImage(named: post.userProfileimageName)
        postImageView.image = UIImage(named: post.postImageName)
        userNameLabel.text = post.userName
        likedCountLabel.text = "좋아요 \(post.likedCount)개"
        postUserNameLabel.text = post.userName
        contentLabel.text = post.content
        commentLabel.text =  "댓글 \(post.commentCount)개 모두 보기"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 11, right: 0))
    }
}
