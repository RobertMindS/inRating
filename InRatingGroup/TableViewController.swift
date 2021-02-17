//
//  TableViewController.swift
//  InRatingGroup
//
//  Created by Robert on 12.02.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var postInfoTableView: UITableView!
    let dataSource: PostInfoDataSourceProtocol = PostInfoDataSource()
    var indicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator()
        indicator.startAnimating()
        
        dataSource.loadData { [weak self] in
            self?.postInfoTableView.reloadData()
            self?.indicator.stopAnimating()
            self?.indicator.hidesWhenStopped = true
        }
        
    }
    
    //MARK: - UIActivityIndicatorView
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        indicator.backgroundColor = UIColor.clear
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    
    
    // MARK: - TableView data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return PostStatsCategories.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
        
        cell.usersCollectionView.tag = PostStatsCategories.allCases[indexPath.section].rawValue
        
        if cell.usersCollectionView.isHidden == true {
            self.postInfoTableView.rowHeight = 30
        } else {
            self.postInfoTableView.rowHeight = 115
        }
        
        switch PostStatsCategories.allCases[indexPath.section] {
        
        case .views:
            cell.usersCollectionView.isHidden = true
            cell.moreButton.isHidden = true
            cell.infoCategoryLabel.text = "Просмотры \(dataSource.postData?.viewsCount ?? 0)"
            cell.iconImage.image = UIImage(named: "views")
            
        case .likes:
            cell.infoCategoryLabel.text = "Лайки \(dataSource.likersData?.data.count ?? 0)"
            cell.iconImage.image = UIImage(named: "heart")
            
            if (dataSource.likersData?.data.count ?? 0) > 5 {
                cell.moreButton.isHidden = false
                cell.moreButton.setTitle("ещё \((dataSource.likersData?.data.count ?? 0) - 5) >", for: .normal)
            } else {
                cell.moreButton.isHidden = true
            }
            
            if dataSource.likersData?.data.count == 0 {
                cell.usersCollectionView.isHidden = true
                self.postInfoTableView.rowHeight = 30
            }
            
        case .comments:
            cell.infoCategoryLabel.text = "Комментаторы \(dataSource.commentatorsData?.data.count ?? 0)"
            cell.iconImage.image = UIImage(named: "comment")
            
            if (dataSource.commentatorsData?.data.count ?? 0) > 5 {
                cell.moreButton.isHidden = false
                cell.moreButton.setTitle("ещё \((dataSource.commentatorsData?.data.count ?? 0) - 5) >", for: .normal)
            } else {
                cell.moreButton.isHidden = true
            }
            
            if dataSource.commentatorsData?.data.count == 0 {
                cell.usersCollectionView.isHidden = true
                self.postInfoTableView.rowHeight = 30
            }
            
        case .mentions:
            cell.infoCategoryLabel.text = "Отметки \(dataSource.mentionsData?.data.count ?? 0)"
            cell.iconImage.image = UIImage(named: "mention")
            
            if (dataSource.mentionsData?.data.count ?? 0) > 5 {
                cell.moreButton.isHidden = false
                cell.moreButton.setTitle("ещё \((dataSource.mentionsData?.data.count ?? 0) - 5) >", for: .normal)
            } else {
                cell.moreButton.isHidden = true
            }
            
            if dataSource.mentionsData?.data.count == 0 {
                cell.usersCollectionView.isHidden = true
                self.postInfoTableView.rowHeight = 30
            }
            
        case .reposts:
            cell.infoCategoryLabel.text = "Репосты \(dataSource.repostersData?.data.count ?? 0)"
            cell.iconImage.image = UIImage(named: "repost")
            
            if (dataSource.repostersData?.data.count ?? 0) > 5 {
                cell.moreButton.isHidden = false
                cell.moreButton.setTitle("ещё \((dataSource.repostersData?.data.count ?? 0) - 5) >", for: .normal)
            } else {
                cell.moreButton.isHidden = true
            }
            
            if dataSource.repostersData?.data.count == 0 {
                cell.usersCollectionView.isHidden = true
                self.postInfoTableView.rowHeight = 30
            }
            
        case .bookmarks:
            cell.usersCollectionView.isHidden = true
            cell.moreButton.isHidden = true
            cell.infoCategoryLabel.text = "Закладки \(dataSource.postData?.bookmarksCount ?? 0)"
            cell.iconImage.image = UIImage(named: "bookmark")
        }
        
        return cell
    }
    
}

