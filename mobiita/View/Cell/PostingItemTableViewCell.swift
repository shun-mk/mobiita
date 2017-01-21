//
//  PostingItemTableViewCell.swift
//  mobiita
//
//  Created by 三木俊作 on 2016/12/20.
//  Copyright © 2016年 Shunsaku Miki. All rights reserved.
//

import UIKit

class PostingItemTableViewCell: UITableViewCell, NibRegistrable {
    
    // MARK: - Method
    
    func setData(data: PostingItemModel) {
        self.titleLbl.text = data.title
        self.layoutSubviews()
    }
    
    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.preferredMaxLayoutWidth = self.contentView.frame.size.width
    }
    
    @IBOutlet weak var titleLbl: UILabel!
}
