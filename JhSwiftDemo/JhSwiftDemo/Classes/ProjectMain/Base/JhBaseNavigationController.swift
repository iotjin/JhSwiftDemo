//
//  JhBaseNavigationController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/27.
//

import UIKit

class JhBaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置半透明毛玻璃导航条（白底黑字）
        //        Jh_setHalfTransparentNav()
        //        Jh_setNavColor(UIColor.white, BaseThemeColor, false)
        
        Jh_setNavColor(BaseNavTitleColor2, BaseNavBgColor2, false) // 主题色白字
        Jh_setNavColor(BaseNavTitleColor, BaseNavBgColor, false) // 白底黑字
        
        addFullScreenPan() //全屏侧滑返回
        self.interactivePopGestureRecognizer?.delegate = self //侧滑返回
    }
    
    
    // MARK: - <UIGestureRecognizerDelegate>
    // 什么时候调用：每次触发手势之前都会询问下代理，是否触发。
    // 作用：拦截手势触发,手势识别器对象会调用这个代理方法来决定手势是否有效
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
    
    /// 重写push方法的目的 : 拦截所有push进来的子控制器
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if (self.children.count > 0 ) {
            let backItem = UIBarButtonItem.Jh_backItem(imageName: "ic_dynamic_nav_back", target: self, action: #selector(ClickBackBtn))
            viewController.navigationItem.leftBarButtonItem = backItem
            // 隐藏底部的工具条
            viewController.hidesBottomBarWhenPushed = true
        }
        // 所有设置搞定后, 再push控制器
        super.pushViewController(viewController, animated: animated)
    }
    @objc func ClickBackBtn() {
        self.popViewController(animated: true)
    }
    
    // MARK: - 全屏侧滑返回
    func addFullScreenPan() {
        guard let targets  = interactivePopGestureRecognizer?.value(forKey: "_targets") as? [NSObject] else {return}
        let targetObjc = targets[0]
        let target = targetObjc.value(forKey: "target")
        let action = Selector(("handleNavigationTransition:"))
        
        let panges = UIPanGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(panges)
    }
}

// MARK: - 设置半透明毛玻璃导航条（白底黑字）
func Jh_setHalfTransparentNav() {
    // 设置标题字体颜色
    var titleTextAttributes = Dictionary<NSAttributedString.Key,Any>()
    titleTextAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 18)
    titleTextAttributes[NSAttributedString.Key.foregroundColor] = UIColor.black
    UINavigationBar.appearance().titleTextAttributes = titleTextAttributes
    if #available(iOS 15.0, *) {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithDefaultBackground(); //使用默认背景和阴影值配置条形外观对象。
        //        appearance.configureWithTransparentBackground(); //配置具有透明背景且无阴影的条形外观对象。
        //        appearance.configureWithOpaqueBackground(); //使用一组适合当前主题的不透明颜色配置栏外观对象。
        
        appearance.titleTextAttributes = titleTextAttributes;
        // standardAppearance：常规状态, 标准外观，iOS15之后不设置的时候，导航栏背景透明
        UINavigationBar.appearance().standardAppearance = appearance
        // scrollEdgeAppearance：被scrollview向下拉的状态, 滚动时外观，不设置的时候，使用标准外观
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

// MARK: - 设置透明导航条,白字
func Jh_setTransparentNav() {
    Jh_setNavColor(UIColor.white, UIColor.clear, true)
}

// MARK: - 设置导航条背景颜色和标题颜色， iOS15是否透明
func Jh_setNavColor(_ titleColor:UIColor,_ navBgColor:UIColor,_ isTransparent:Bool) {
    // 设置标题字体颜色
    var titleTextAttributes = Dictionary<NSAttributedString.Key,Any>()
    titleTextAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 18)
    titleTextAttributes[NSAttributedString.Key.foregroundColor] = titleColor
    UINavigationBar.appearance().titleTextAttributes = titleTextAttributes
    
    // 设置导航栏背景色
    UINavigationBar.appearance().barTintColor = navBgColor
    
    // iOS15适配
    if #available(iOS 15.0, *) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = navBgColor
        appearance.titleTextAttributes = titleTextAttributes
        if (isTransparent) {
            // 设置透明
            appearance.backgroundColor = UIColor.clear; //透明背景色
            appearance.backgroundEffect = nil; // 不使用毛玻璃效果
            appearance.shadowColor = nil; // 隐藏底部分隔线
        }
        // standardAppearance：常规状态, 标准外观，iOS15之后不设置的时候，导航栏背景透明
        UINavigationBar.appearance().standardAppearance = appearance
        // scrollEdgeAppearance：被scrollview向下拉的状态, 滚动时外观，不设置的时候，使用标准外观
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
