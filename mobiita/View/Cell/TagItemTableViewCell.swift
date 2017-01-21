//
//  TagItemTableViewCell.swift
//  mobiita
//
//  Created by 三木俊作 on 2017/01/03.
//  Copyright © 2017年 Shunsaku Miki. All rights reserved.
//

import UIKit
import AlamofireImage

class TagItemTableViewCell: UITableViewCell, NibRegistrable {
    
    // MARK: - Methods
    
    /// データ設定
    ///
    /// - Parameter data: データ
    func setData(data: TagItemModel) {
        if let iconUrl = data.iconUrl {
            self.tagImageView.af_setImage(withURL: URL(string: iconUrl)!)
        }
        self.nameLbl.text = data.id
        self.layoutSubviews()
    }

    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - property
    
    /** imageView */
    @IBOutlet weak var tagImageView: UIImageView!
    /** タグ名ラベル */
    @IBOutlet weak var nameLbl: UILabel!
    
}
