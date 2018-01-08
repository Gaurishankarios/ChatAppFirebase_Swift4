//
//  TVCellChat.swift
//  ChatAppFirebase
//
//  Created by Kushal on 05/01/18.
//  Copyright © 2018 Gaurishankar. All rights reserved.
//

import UIKit

class TVCellChat: UITableViewCell {

    @IBOutlet weak var lbl_UserCell: UILabel!
    
    @IBOutlet weak var txt_chatText: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setChat(chat:Chat)
    {
        lbl_UserCell.text=chat.userName
        txt_chatText.text=chat.text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
