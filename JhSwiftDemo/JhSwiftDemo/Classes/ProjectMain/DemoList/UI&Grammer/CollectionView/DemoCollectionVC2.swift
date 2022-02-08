//
//  DemoCollectionVC2.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit
import SwiftyJSON

private let CellID = "CellID"

class DemoCollectionVC2: JhBaseCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCollectionView()
        
        Jh_modelArr = dataArr
    }
    
    func configCollectionView() {
        Jh_navTitle = "CollectionView封装 - SwiftyJSON"
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical // 方向
        let margin = 10.0   // 设置间距
        let maxCol = 3.0   // 设置列数
        // 设置item尺寸
        let itemW = ((kScreenWidth) - (maxCol + 1) * margin - 1) / maxCol
        let itemH = itemW + 20;
        flowLayout.itemSize = CGSize(width: itemW, height: itemH) // 每个item的大小
        flowLayout.minimumLineSpacing  = margin  // 设置最小行间距
        flowLayout.minimumInteritemSpacing = margin // 最小列间距
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin) // 每组的四周位置间距 ,分别为上、左、下、右
        
        Jh_collectionFlowLayout = flowLayout
        // xib注册cell
        //        Jh_collectionView.register(UINib(nibName: "DemoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CellID)
        Jh_cellName = "DemoCollectionViewCell"
        JhCustumCellBlock = { [weak self] (indexPath,custumCell) ->() in
            let cell:DemoCollectionViewCell = custumCell as! DemoCollectionViewCell
            
            // -------------------- SwiftyJSON --------------------
            let dict = JSON(self?.Jh_modelArr as Any)[indexPath.row]
            //            JhLog("dict : \(dict)")
            //            JhLog("text : \(dict["text"])")
            cell.textLabel.text = String(describing:dict["text"])
            cell.imgView.image = UIImage(named: String(describing:dict["img"]))
        }
        
        JhClickCustumCellBlock = { [weak self] (indexPath) ->() in
            let cell = self?.Jh_collectionView.cellForItem(at: indexPath) as! DemoCollectionViewCell
            JhLog("cell : \(String(describing: cell.textLabel.text))")
            
            JhLog("选中section:\(indexPath.section) ")
            JhLog("选中row:\(indexPath.row) ")
            
            let data = JSON(self?.dataArr as Any)[indexPath.row]
            JhLog("选中cell : \(data)")
        
            JhProgressHUD.showText(String(describing:data["text"]))
        }
        
        // 添加头部
        let headerHeight = 50.0
        let headerView = UIView(frame: .zero)
        headerView.backgroundColor = JhRandomColor()
        headerView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: headerHeight)
        Jh_collectionFlowLayout?.headerReferenceSize = CGSize(width: kScreenWidth, height: headerHeight)
        //        Jh_collectionFlowLayout?.sectionHeadersPinToVisibleBounds = true // 悬停
        JhCustumHeaderViewBlock = { (indexPath, JhHeaderView) ->() in
            JhHeaderView.addSubview(headerView)
        }
        
        // 添加尾部
        let footerHeight = 50.0
        let footerView = UIView(frame: .zero)
        footerView.backgroundColor = JhRandomColor()
        footerView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: footerHeight)
        Jh_collectionFlowLayout?.footerReferenceSize = CGSize(width: kScreenWidth, height: footerHeight)
        //        Jh_collectionFlowLayout?.sectionFootersPinToVisibleBounds = true // 悬停
        JhCustumFooterViewBlock = { (indexPath, JhFooterView) ->() in
            JhFooterView.addSubview(footerView)
        }
    }
    
    lazy var dataArr: NSMutableArray = {
        var tempArr = NSMutableArray()
        for i in 0 ..< 50 {
            let text = "测试数据-\(i)"
            var dict = NSMutableDictionary()
            dict["text"] = text
            dict["img"] = "swift"
            tempArr.add(dict)
        }
        dataArr = tempArr
        return dataArr
    }()
    
}
