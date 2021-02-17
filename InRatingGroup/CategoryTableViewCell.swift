//
//  CategoryTableViewCell.swift
//  InRatingGroup
//
//  Created by Robert on 12.02.2021.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var infoCategoryLabel: UILabel!
    @IBOutlet weak var usersCollectionView: UICollectionView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    
    let dataSource: PostInfoDataSourceProtocol = PostInfoDataSource()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataSource.loadData { [weak self] in
            self?.usersCollectionView.reloadData()
        }
        
        moreButton.addTarget(self, action: #selector(self.btnRightArrowAction), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    //MARK: - More Button Action
    @objc func btnRightArrowAction(_ sender: UIButton) {
        let collectionBounds = self.usersCollectionView.bounds
        let contentOffset = CGFloat(floor(self.usersCollectionView.contentOffset.x + collectionBounds.size.width))
        self.moveCollectionToFrame(contentOffset: contentOffset)
    }
    func moveCollectionToFrame(contentOffset : CGFloat) {
        let frame: CGRect = CGRect(x : contentOffset ,
                                   y : self.usersCollectionView.contentOffset.y,
                                   width : self.usersCollectionView.frame.width,
                                   height : self.usersCollectionView.frame.height)
        self.usersCollectionView.scrollRectToVisible(frame, animated: true)
    }
}


//MARK: - UICollectionViewDataSource

extension CategoryTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = 0
        switch PostStatsCategories.allCases[collectionView.tag] {
        case .views:
            count = 0
        case .likes:
            count = dataSource.likersData?.data.count ?? 0
        case .comments:
            count = dataSource.commentatorsData?.data.count ?? 0
        case .mentions:
            count = dataSource.mentionsData?.data.count ?? 0
        case .reposts:
            count = dataSource.repostersData?.data.count ?? 0
        case .bookmarks:
            count = 0
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserCollectionViewCell
        
        switch PostStatsCategories.allCases[collectionView.tag] {
        
        case .views:
            cell.nicknameLabel.text = ""
            
        case .likes:
            let url = dataSource.likersData?.data[indexPath.row].avatarImage.urlOrigin
            if url == dataSource.likersData?.data[indexPath.row].avatarImage.urlOrigin {
                cell.avatarImageView.loadImageUsingCacheWithURLString(url!, placeHolder: UIImage(named: "placeholder"))
            }
            cell.avatarImageView.layer.cornerRadius = 10
            cell.nicknameLabel.text = "\((dataSource.likersData?.data[indexPath.row].nickname) ?? "")"
            if moreButton.isSelected {
                self.btnRightArrowAction(moreButton)
            }
        case .comments:
            let url = dataSource.commentatorsData?.data[indexPath.row].avatarImage.urlOrigin
            if url == dataSource.commentatorsData?.data[indexPath.row].avatarImage.urlOrigin {
                cell.avatarImageView.loadImageUsingCacheWithURLString(url!, placeHolder: UIImage(named: "placeholder"))
            }
            cell.avatarImageView.layer.cornerRadius = 10
            cell.nicknameLabel.text = "\((dataSource.commentatorsData?.data[indexPath.row].nickname) ?? "")"
            if moreButton.isSelected {
                self.btnRightArrowAction(moreButton)
            }
            
        case .mentions:
            let url = dataSource.mentionsData?.data[indexPath.row].avatarImage.urlOrigin
            if url == dataSource.mentionsData?.data[indexPath.row].avatarImage.urlOrigin {
                cell.avatarImageView.loadImageUsingCacheWithURLString(url!, placeHolder: UIImage(named: "placeholder"))
            }
            cell.avatarImageView.layer.cornerRadius = 10
            cell.nicknameLabel.text = "\((dataSource.mentionsData?.data[indexPath.row].nickname) ?? "")"
            if moreButton.isSelected {
                self.btnRightArrowAction(moreButton)
            }
            
        case .reposts:
            let url = dataSource.repostersData?.data[indexPath.row].avatarImage.urlOrigin
            if url == dataSource.repostersData?.data[indexPath.row].avatarImage.urlOrigin {
                cell.avatarImageView.loadImageUsingCacheWithURLString(url!, placeHolder: UIImage(named: "placeholder"))
            }
            cell.avatarImageView.layer.cornerRadius = 10
            cell.nicknameLabel.text = "\((dataSource.repostersData?.data[indexPath.row].nickname) ?? "")"
            if moreButton.isSelected {
                self.btnRightArrowAction(moreButton)
            }
            
        case .bookmarks:
            cell.nicknameLabel.text = ""
        }
        
        return cell
    }
}
