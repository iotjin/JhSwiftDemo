//
//  DemoCustomTableViewCell6.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/4.
//

import UIKit

class DemoCustomTableViewCell6: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initUI() {
        imgView.image = UIImage(named: "swift")
    }
    
    func configCellData(_ data:DemoCustomModel6) {
        titleLabel.text = data.name2
        contentLabel.text = data.content
    }
    
}
