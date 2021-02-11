//
//  PostInfoTableViewCell.swift
//  InRatingGroup
//
//  Created by Robert on 09.02.2021.
//

import UIKit
import Foundation

class PostInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoCategoryLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var viewCell: UIView!
    
        
    override func awakeFromNib() {
        super.awakeFromNib()

        let shadowPath = UIBezierPath(rect: viewCell.bounds).cgPath
        viewCell.layer.cornerRadius = 10
        viewCell.layer.shadowOffset = CGSize(width: 2, height: 20)
        viewCell.layer.shadowOpacity = 0.3
        viewCell.layer.masksToBounds = false
        viewCell.layer.shadowPath = shadowPath
        viewCell.layer.shadowRadius = 3
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}






//extension CategoryRow : UICollectionViewDelegateFlowLayout {
//
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let itemsPerRow:CGFloat = 4
//        let hardCodedPadding:CGFloat = 5
//        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
//        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
//        return CGSize(width: itemWidth, height: itemHeight)
//    }
//
//}
