//
//  JhBaseCollectionViewController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit

private let CellID = "CellID"
private let HeaderViewID = "HeaderViewID"
private let FooterViewID = "FooterViewID"

class JhBaseCollectionViewController: JhBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCollectionView()
    }
    
    private func configCollectionView() {
        self.view.addSubview(self.Jh_collectionView)
    }
    
    /// 自定义Cell Block
    var JhCustumCellBlock: ((_ indexPath : IndexPath, _ custumCell : Any ) ->())?
    /// 点击Cell Block
    var JhClickCustumCellBlock: ((_ indexPath : IndexPath) ->())?
    /// 头部 Block
    var JhCustumHeaderViewBlock: ((_ indexPath : IndexPath, _ JhHeaderView : UIView ) ->())?
    /// 尾部 Block
    var JhCustumFooterViewBlock: ((_ indexPath : IndexPath, _ JhFooterView : UIView ) ->())?
    
    /// 自定义的CellName
    var Jh_cellName: String? {
        didSet {
            // Nib注册Cell
            Jh_collectionView.register(UINib(nibName: Jh_cellName ?? "JhBaseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CellID)
        }
    }
    
    /// FlowLayout
    var Jh_collectionFlowLayout: UICollectionViewFlowLayout? {
        didSet {
            Jh_collectionView.collectionViewLayout = Jh_collectionFlowLayout ?? UICollectionViewFlowLayout()
        }
    }
    
    /// 数据源
    var Jh_modelArr: NSMutableArray {
        get {
            return dataArr
        }
        set(newValue) {
            dataArr = newValue
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    // MARK: - 多少组
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK: - 每组多少个
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    // MARK: - 每个显示什么
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath)
        JhCustumCellBlock?(indexPath,cell)
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    // MARK: - 返回这个UICollectionView是否可以被选择
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - 点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let cell = collectionView.cellForItem(at: indexPath)
        JhClickCustumCellBlock?(indexPath)
    }
    
    // MARK: - 设置sectionHeader | sectionFooter
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 设置头部
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderViewID, for: indexPath)
            view.backgroundColor = .red
            JhCustumHeaderViewBlock?(indexPath,view)
            return view
        } else if kind == UICollectionView.elementKindSectionFooter {
            // 设置尾部
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterViewID, for: indexPath)
            view.backgroundColor = .yellow
            JhCustumFooterViewBlock?(indexPath,view)
            return view
        } else {
            return UICollectionReusableView()
        }
    }
    
    lazy var Jh_collectionView: JhBaseCollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        //        flowLayout.scrollDirection = .vertical // 方向
        //        let margin = 10.0   // 设置间距
        //        let maxCol = 3.0   // 设置列数
        //        // 设置item尺寸
        //        let itemW = ((kScreenWidth) - (maxCol + 1) * margin - 1) / maxCol
        //        let itemH = itemW + 20;
        //
        //        flowLayout.itemSize = CGSize(width: itemW, height: itemH) // 每个item的大小
        //        flowLayout.minimumLineSpacing  = margin;  // 设置最小行间距
        //        flowLayout.minimumInteritemSpacing = margin; // 最小列间距
        //        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin) // 每组的四周位置间距 ,分别为上、左、下、右
        //        flowLayout.footerReferenceSize = CGSize(width: kScreenWidth, height: 50)
        //        flowLayout.headerReferenceSize = CGSize(width: kScreenWidth, height: 50)
        //        flowLayout.sectionHeadersPinToVisibleBounds = true // 悬停
        //        flowLayout.sectionFootersPinToVisibleBounds = true // 悬停
        
        let collectionView = JhBaseCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.frame = kTableViewFrame
        collectionView.backgroundColor = BaseBgColor
        collectionView.delegate = self
        collectionView.dataSource = self
        //        // 这句话的意思是为了 不管集合视图里面的值 多不多  都可以滚动 解决了值少了 集合视图不能滚动的问题
        //        collectionView.alwaysBounceVertical = true
        //        // 设置上左下右距离
        //        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0,right: 0)
        // header注册
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderViewID)
        // footer注册
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind:  UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterViewID)
        return collectionView
    }()
    
    private lazy var dataArr: NSMutableArray = {
        var tempArr = NSMutableArray()
        return tempArr
    }()
}
