//
//  ViewController.swift
//  InRatingGroup
//
//  Created by Robert on 09.02.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
            
    @IBOutlet weak var postInfoTableView: UITableView!
    
    let dataSource: PostInfoDataSourceProtocol = PostInfoDataSource()
    
    func newLabel(title: String) -> UILabel {
            let label = UILabel()
            label.text = title
            return label
        }
                
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.loadData { [weak self] in
            self?.postInfoTableView.reloadData()
        }
        
    }
}


//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostStatsCategories.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostInfoTableViewCell

        switch PostStatsCategories.allCases[indexPath.row] {
        
        case .views:
            cell.infoCategoryLabel.text = "Просмотры \(dataSource.postData?.viewsCount ?? 0)"
            cell.iconImage.image = UIImage(named: "views")
            
        case .likes:
            cell.infoCategoryLabel.text = "Лайки \(dataSource.postData?.likesCount ?? 0)"
            cell.iconImage.image = UIImage(named: "heart")

        case .comments:
            cell.infoCategoryLabel.text = "Комментаторы \(dataSource.postData?.commentsCount ?? 0)"
            cell.iconImage.image = UIImage(named: "comment")

        case .mentions:
            cell.infoCategoryLabel.text = "Отметки \(dataSource.mentionsData?.data.count ?? 0)"
            cell.iconImage.image = UIImage(named: "mention")

        case .reposts:
            cell.infoCategoryLabel.text = "Репосты \(dataSource.postData?.repostsCount ?? 0)"
            cell.iconImage.image = UIImage(named: "repost")

        case .bookmarks:
            cell.infoCategoryLabel.text = "Закладки \(dataSource.postData?.bookmarksCount ?? 0)"
            cell.iconImage.image = UIImage(named: "bookmark")
        }
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
