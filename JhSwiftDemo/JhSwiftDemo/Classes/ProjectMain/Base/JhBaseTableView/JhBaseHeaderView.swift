//
//  JhBaseHeaderView.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/29.
//

import UIKit
import Foundation

class JhBaseHeaderView: UIView {
    
    @IBOutlet weak var Jh_leftTitleLabel: UILabel!
    @IBOutlet weak var Jh_rightBtn: UIButton!
    @IBOutlet weak var Jh_lineView: UIView!
    @IBOutlet weak var Jh_rightBtnWidth: NSLayoutConstraint!
    
    @IBAction func ClickBtn(_ sender: Any) {
        self.JhHeaderClickRightBtnBlock()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }
    
    /// 左侧标题
    var Jh_leftTitle : String = "" {
        didSet {
            if (Jh_leftTitle.count>0) {
                self.Jh_leftTitleLabel.isHidden = false
                self.Jh_leftTitleLabel.text = Jh_leftTitle
            } else {
                self.Jh_leftTitleLabel.isHidden = true
            }
        }
    }
    
    /// 右侧按钮图片
    var Jh_rightBtnImage : UIImage? {
        didSet {
            self.Jh_rightBtn.setImage(Jh_rightBtnImage, for: .normal)
        }
    }
    /// 右侧按钮文字
    var Jh_rightBtnTitle :String = "" {
        didSet {
            if (Jh_rightBtnTitle.count > 0) {
                self.Jh_rightBtn.isHidden = false
                self.Jh_rightBtn.setTitle(Jh_rightBtnTitle, for: .normal)
            } else {
                self.Jh_rightBtn.isHidden = true
            }
        }
    }
    
    let JhHeaderClickRightBtnBlock: () -> Void = {
        print("点击按钮了！")
    }
    
    func initUI() {

    }
    
}
