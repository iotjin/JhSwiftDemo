//
//  DemoCustomTableViewCell.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/4.
//

import UIKit

class DemoCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var leftImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func initUI() {
        titleLabel.text = ""
        if #available(iOS 13.0, *) {
            imgView.image = UIImage(systemName: "chevron.right")
        }
    }
    
    func configCellData(_ data:DemoCustomModel) {
        titleLabel.text = data.text
        leftImgView.image = UIImage(named: data.img)
    }
    
}




