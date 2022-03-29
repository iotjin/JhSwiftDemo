//
//  SystemUIViewController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/27.
//

import UIKit


class SystemUIViewController: JhBaseViewController, UITextFieldDelegate, UITextViewDelegate {
    
    lazy var customLabel: UILabel = UILabel.createCustomLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    func initUI() {
        self.Jh_navTitle = "SystemUI"
        
        let frame = CGRect(x: 0, y: 100, width: kScreenWidth, height: 20)
        JhLog("frame: \(frame)")
        
        self.customLabel.text = "这是通过分类创建label"
        self.customLabel.frame = frame
        self.view.addSubview(self.customLabel)
        
        self.view.addSubview(self.mView)
        self.view.addSubview(self.mLabel)
        self.view.addSubview(self.mButton)
        self.view.addSubview(self.mTextField)
        self.view.addSubview(self.pwdTextField)
        self.view.addSubview(self.mImageView)
        self.view.addSubview(self.mTextView)
        self.view.addSubview(self.mSwitch)
        self.view.addSubview(self.mSegment)
    }
    
    lazy var mView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = JhRandomColor()
        view.frame = CGRect(x: 0, y: self.customLabel.frame.maxY+10, width: kScreenWidth, height: 50)
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapClick(tap:)))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    // 手势事件
    @objc func tapClick(tap:UITapGestureRecognizer){
        JhLog("单击一次")
    }
    
    lazy var mLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.frame = CGRect(x: 0, y: self.mView.frame.maxY+10, width: kScreenWidth, height: 20)
        label.text = "这是UILabel"
        label.font = JhFont(16)
        label.textColor = .black
        label.textColor = JhRandomColor()
        return label
    }()
    
    lazy var mButton: UIButton = {
        let title = "这是UIButton"
        let titleColor = JhRandomColor()
        
        let button = UIButton(frame: .zero)
        button.frame = CGRect(x: 0, y: self.mLabel.frame.maxY+10, width: kScreenWidth, height: 50)
        button.titleLabel?.font = JhFont(16)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(titleColor.withAlphaComponent(0.5), for: .highlighted)
        button.setTitleColor(titleColor.withAlphaComponent(0.5), for: .disabled)
        button.layer.cornerRadius = 5;
        button.layer.borderWidth = 1;
        button.layer.borderColor = JhRandomColor().cgColor
        button.backgroundColor = JhRandomColor()
        button.addTarget(self, action: #selector(ClickButton), for: .touchUpInside)
        return button
    }()
    
    @objc func ClickButton() {
        NSLog("点击按钮")
    }
    
    lazy var mTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.frame = CGRect(x: 0, y: self.mButton.frame.maxY+10, width: kScreenWidth, height: 30)
        textField.text = "";
        textField.placeholder = "这是UITextField"
        textField.font = JhFont(15)
        textField.textColor = JhRandomColor()
        textField.backgroundColor = BaseBgColor
        textField.textAlignment = .center
        textField.isEnabled = true
        textField.delegate = self
        return textField
    }()
    
    // MARK: - TextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let text = textField.text!
        JhLog("mTextField 开始编辑 : \(text)")
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = textField.text!
        JhLog("mTextField 文字改变 : \(text)")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text!
        JhLog("mTextField 结束编辑 : \(text)")
    }
    
    lazy var pwdTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.frame = CGRect(x: 0, y: self.mTextField.frame.maxY+10, width: kScreenWidth, height: 30)
        textField.text = "";
        textField.font = JhFont(15)
        textField.textColor = JhRandomColor()
        textField.backgroundColor = BaseBgColor
        textField.textAlignment = .left
        textField.placeholder = "请输入6-16位字母、数字"
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        textField.isEnabled = true
        textField.addTarget(self, action: #selector(JhTextFieldDidBeginEditing(_:)), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(JhTextFieldDidChange(_:)), for: .editingChanged)
        textField.addTarget(self, action: #selector(JhTextFieldDidEndEditing(_:)), for: .editingDidEnd)
        return textField
    }()
    
    @objc private func JhTextFieldDidBeginEditing(_ textField:UITextField) {
        let text = textField.text!
        JhLog("pwdTextField 开始编辑 : \(text)")
    }
    
    @objc private func JhTextFieldDidChange(_ textField:UITextField) {
        let text = textField.text!
        JhLog("pwdTextField 文字改变 : \(text)")
    }
    
    @objc private func JhTextFieldDidEndEditing(_ textField:UITextField) {
        let text = textField.text!
        JhLog("pwdTextField 结束编辑 : \(text)")
    }
    
    lazy var mImageView: UIImageView = {
        let image = UIImage(named: "swift")
        
        let imageView = UIImageView(frame: .zero)
        imageView.frame = CGRect(x: 0, y: self.pwdTextField.frame.maxY+10, width: 50, height: 50)
        imageView.Jh_centerX = self.view.Jh_centerX
        imageView.image = image
        return imageView
    }()
    
    lazy var mTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.frame = CGRect(x: 0, y: self.mImageView.frame.maxY+10, width: kScreenWidth, height: 100)
        textView.text = "这是UITextView"
        textView.font = JhFont(15)
        textView.textColor = JhRandomColor()
        textView.backgroundColor = JhRandomColor();
        textView.textAlignment = .left
        textView.isEditable = true
        textView.delegate = self
        return textView
    }()
    
    // MARK: - TextViewDelegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        let text = textView.text!
        JhLog("textView 开始编辑 : \(text)")
    }
    func textViewDidChange(_ textView: UITextView) {
        let text = textView.text!
        JhLog("textView 文字改变 : \(text)")
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        let text = textView.text!
        JhLog("textView 结束编辑 : \(text)")
    }
    
    lazy var mSwitch: UISwitch = {
        let switchBtn = UISwitch(frame: .zero)
        switchBtn.frame = CGRect(x: 0, y: self.mTextView.frame.maxY+10, width: kScreenWidth, height: 30)
        switchBtn.isOn = true
        switchBtn.onTintColor = JhRandomColor()
        return switchBtn
    }()
    
    lazy var mSegment: UISegmentedControl = {
        let dataArr = ["资料","动态"]
        let segment = UISegmentedControl(items: dataArr)
        segment.frame = CGRect(x: 0, y: self.mSwitch.frame.maxY+10, width: 120, height: 30)
        segment.isMomentary = false
        segment.layer.cornerRadius = 5
        segment.clipsToBounds = true
        segment.tintColor = JhColor(237, 148, 45) // 选中颜色
        segment.backgroundColor = JhGrayColor(254)
        if #available(iOS 13.0, *) {
            // 文字默认颜色
            segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
            // 文字选中颜色
            segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.yellow], for: .selected)
            // 选中item背景颜色
            segment.selectedSegmentTintColor = JhColor(237, 148, 45)
        }
        segment.selectedSegmentIndex = 0 // 选中第几个segment 一般用于初始化时选中
        segment.Jh_centerX = self.view.Jh_centerX
        segment.addTarget(self, action: #selector(SegmentChanged(segment:)), for: .valueChanged)
        segment.autoresizingMask = [.flexibleTopMargin, .flexibleRightMargin, .flexibleBottomMargin, .flexibleLeftMargin]
        return segment
    }()
    
    @objc func SegmentChanged(segment:UISegmentedControl) {
        let selectedIndex = segment.selectedSegmentIndex
        JhLog("selectedIndex : \(selectedIndex)")
    }
}

extension UILabel {
    static func createCustomLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }
}



