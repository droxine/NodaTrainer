//
//  MusicClassCell.swift
//  NodaTrainer
//
//  Created by sangeles on 8/25/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit

class MusicClassCell: UITableViewCell {

    @IBOutlet weak var lblItem1: UILabel!
    @IBOutlet weak var lblItem2: UILabel!
    @IBOutlet weak var lblItem3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func musicClassInit(item1: String, item2: String, item3: String) {
        self.lblItem1.text = item1
        self.lblItem2.text = item2
        self.lblItem3.text = item3
        
        self.lblItem1.textColor = UIColor.white
        self.lblItem2.textColor = UIColor.white
        self.lblItem3.textColor = UIColor.white
        self.contentView.backgroundColor = UIColor.darkGray
    }
    
}
