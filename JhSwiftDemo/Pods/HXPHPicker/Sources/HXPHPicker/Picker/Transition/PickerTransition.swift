//
//  HXPHPickerTransition.swift
//  HXPHPickerExample
//
//  Created by Silence on 2020/12/9.
//  Copyright © 2020 Silence. All rights reserved.
//

import UIKit
import Photos


extension PickerTransition {
    enum `Type` {
        case push
        case pop
        case present
        case dismiss
    }
}

class PickerTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var type: `Type` = .push
    
    var requestID: PHImageRequestID?
    lazy var pushImageView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    init(type: `Type`) {
        super.init()
        self.type = type
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        if type == .pop || type == .present {
            return 0.5
        }else if type == .dismiss {
            return 0.65
        }
        return 0.45
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if type == .push || type == .pop {
            pushTransition(using: transitionContext)
        }else {
            presentTransition(using: transitionContext)
        }
    }
    
    func pushTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        
        var previewVC: PhotoPreviewViewController?
        var pickerVC: PhotoPickerViewController?
        
        let containerView = transitionContext.containerView
        let contentView = UIView.init(frame: fromVC.view.bounds)
        if type == .push {
            pickerVC = fromVC as? PhotoPickerViewController
            previewVC = toVC as? PhotoPreviewViewController
        }else if type == .pop {
            pickerVC = toVC as? PhotoPickerViewController
            previewVC = fromVC as? PhotoPreviewViewController
        }
        
        let backgroundColor = PhotoManager.isDark ? previewVC?.config.backgroundDarkColor : previewVC?.config.backgroundColor
        
        let photoAsset = previewVC?.previewAssets[previewVC!.currentPreviewIndex]
         
        var fromView: UIView?
        var toView: UIView?
        
        if type == .push {
            containerView.addSubview(fromVC.view)
            containerView.addSubview(toVC.view)
            fromVC.view.insertSubview(contentView, at: 1)
            contentView.backgroundColor = backgroundColor?.withAlphaComponent(0)
            contentView.addSubview(pushImageView)
            
            if let photoAsset = photoAsset, let pickerVC = pickerVC {
                let cell = pickerVC.getCell(for: photoAsset)
                if cell != nil {
                    pushImageView.image = cell?.imageView.image
                    pushImageView.frame = cell?.imageView.convert(cell?.imageView.bounds ?? CGRect.zero, to: containerView) ?? CGRect.zero
                    fromView = cell
                }else {
                    pushImageView.center = CGPoint(x: toVC.view.width * 0.5, y: toVC.view.height * 0.5)
                }
                var reqeustAsset = photoAsset.phAsset != nil
                #if HXPICKER_ENABLE_EDITOR
                if photoAsset.videoEdit != nil || photoAsset.photoEdit != nil {
                    reqeustAsset = false
                }
                #endif
                if let phAsset = photoAsset.phAsset, reqeustAsset {
                    requestAssetImage(for: phAsset)
                }else if pushImageView.image == nil {
                    pushImageView.image = photoAsset.originalImage
                }
            }
            
            previewVC?.collectionView.isHidden = true
            previewVC?.bottomView.alpha = 0
            previewVC?.view.backgroundColor = backgroundColor?.withAlphaComponent(0)
        }else if type == .pop {
            containerView.addSubview(toVC.view)
            containerView.addSubview(fromVC.view)
            toVC.view.insertSubview(contentView, at: 1)
            contentView.backgroundColor = backgroundColor
            
            let cell = previewVC!.getCell(for: previewVC!.currentPreviewIndex)
            fromView = cell?.scrollContentView
            fromView?.frame = cell?.scrollContentView.convert(cell?.scrollContentView.bounds ?? CGRect.zero, to: containerView) ?? CGRect.zero
            contentView.addSubview(fromView!)
            
            if photoAsset != nil && pickerVC != nil {
                toView = pickerVC?.getCell(for: photoAsset!)
                if toView == nil {
                    pickerVC?.scrollToCenter(for: photoAsset!)
                    pickerVC?.reloadCell(for: photoAsset!)
                    toView = pickerVC?.getCell(for: photoAsset!)
                }else {
                    pickerVC?.scrollCellToVisibleArea(toView as! PhotoPickerBaseViewCell)
                }
            }
            
            previewVC?.collectionView.isHidden = true
            previewVC?.view.backgroundColor = UIColor.clear
        }
        
        var rect: CGRect = .zero
        if type == .push {
            if let photoAsset = photoAsset {
                if UIDevice.isPad && photoAsset.mediaType == .video {
                    rect = PhotoTools.transformImageSize(photoAsset.imageSize, toViewSize: toVC.view.size, directions: [.horizontal])
                }else {
                    rect = PhotoTools.transformImageSize(photoAsset.imageSize, to: toVC.view)
                }
            }
            fromView?.isHidden = true
        }else if type == .pop {
            rect = toView?.convert(toView?.bounds ?? CGRect.zero, to: containerView) ?? .zero
            toView?.isHidden = true
            if AssetManager.authorizationStatusIsLimited() && pickerVC?.config.bottomView.showPrompt ?? false {
                pickerVC?.bottomView.alpha = 0
            }
        }
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext) - 0.125) {
            if self.type == .push {
                previewVC?.bottomView.alpha = 1
                if AssetManager.authorizationStatusIsLimited() && pickerVC?.config.bottomView.showPrompt ?? false {
                    pickerVC?.bottomView.alpha = 0
                }
                contentView.backgroundColor = backgroundColor?.withAlphaComponent(1)
            }else if self.type == .pop {
                previewVC?.bottomView.alpha = 0
                if AssetManager.authorizationStatusIsLimited() && pickerVC?.config.bottomView.showPrompt ?? false {
                    pickerVC?.bottomView.alpha = 1
                }
                contentView.backgroundColor = backgroundColor?.withAlphaComponent(0)
            }
        }
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [.layoutSubviews, .curveEaseOut]) {
            if self.type == .push {
                self.pushImageView.frame = rect
            }else if self.type == .pop {
                if rect.isEmpty {
                    fromView?.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
                    fromView?.alpha = 0
                }else {
                    fromView?.frame = rect
                }
            }
        } completion: { (isFinished) in
            if self.type == .push {
                if self.requestID != nil {
                    PHImageManager.default().cancelImageRequest(self.requestID!)
                    self.requestID = nil
                }
                pickerVC?.bottomView.alpha = 1
                fromView?.isHidden = false
                previewVC?.setCurrentCellImage(image: self.pushImageView.image)
                previewVC?.collectionView.isHidden = false
                previewVC?.configColor()
                contentView.removeFromSuperview()
                transitionContext.completeTransition(true)
            }else if self.type == .pop {
                toView?.isHidden = false
                UIView.animate(withDuration: 0.25, delay: 0, options: [.allowUserInteraction]) {
                    fromView?.alpha = 0
                } completion: { (isFinished) in
                    contentView.removeFromSuperview()
                    transitionContext.completeTransition(true)
                }
            }
        }
    }
    func presentTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        
        let containerView = transitionContext.containerView
        let contentView = UIView.init(frame: fromVC.view.bounds)
        
        var pickerController: PhotoPickerController
        if type == .present {
            pickerController = toVC as! PhotoPickerController
        }else {
            pickerController = fromVC as! PhotoPickerController
        }
        let backgroundColor = PhotoManager.isDark ? pickerController.config.previewView.backgroundDarkColor : pickerController.config.previewView.backgroundColor
        var fromView: UIView
        var previewView: UIView?
        var toRect: CGRect = .zero
        let previewViewController = pickerController.previewViewController()
        if type == .present {
            containerView.addSubview(contentView)
            containerView.addSubview(toVC.view)
            contentView.backgroundColor = backgroundColor.withAlphaComponent(0)
            previewViewController?.view.backgroundColor = backgroundColor.withAlphaComponent(0)
            pickerController.view.backgroundColor = nil
            pickerController.navigationBar.alpha = 0
            previewViewController?.bottomView.alpha = 0
            previewViewController?.collectionView.isHidden = true
            fromView = pushImageView
            let currentPreviewIndex = previewViewController?.currentPreviewIndex ?? 0
            if let view = pickerController.pickerDelegate?.pickerController(pickerController, presentPreviewViewForIndexAt: currentPreviewIndex) {
                let rect = view.convert(view.bounds, to: contentView)
                fromView.frame = rect
                if view.layer.cornerRadius > 0 {
                    pushImageView.layer.cornerRadius = view.layer.cornerRadius
                    pushImageView.layer.masksToBounds = true
                }
                previewView = view
            }else if let rect = pickerController.pickerDelegate?.pickerController(pickerController, presentPreviewFrameForIndexAt: currentPreviewIndex), !rect.equalTo(.zero) {
                fromView.frame = rect
            }else {
                fromView.center = CGPoint(x: toVC.view.width * 0.5, y: toVC.view.height * 0.5)
            }
            
            if let image = pickerController.pickerDelegate?.pickerController(pickerController, presentPreviewImageForIndexAt: currentPreviewIndex) {
                pushImageView.image = image
            }
            if !pickerController.selectedAssetArray.isEmpty {
                let photoAsset = pickerController.selectedAssetArray[currentPreviewIndex]
                var reqeustAsset = photoAsset.phAsset != nil
                #if HXPICKER_ENABLE_EDITOR
                if photoAsset.videoEdit != nil || photoAsset.photoEdit != nil {
                    reqeustAsset = false
                }
                #endif
                if let phAsset = photoAsset.phAsset, reqeustAsset {
                    requestAssetImage(for: phAsset)
                }else if pushImageView.image == nil {
                    pushImageView.image = photoAsset.originalImage
                }
                if UIDevice.isPad && photoAsset.mediaType == .video {
                    toRect = PhotoTools.transformImageSize(photoAsset.imageSize, toViewSize: toVC.view.size, directions: [.horizontal])
                }else {
                    toRect = PhotoTools.transformImageSize(photoAsset.imageSize, to: toVC.view)
                }
            }
        }else {
            previewViewController?.view.insertSubview(contentView, at: 0)
            previewViewController?.view.backgroundColor = .clear
            previewViewController?.collectionView.isHidden = true
            pickerController.view.backgroundColor = .clear
            contentView.backgroundColor = backgroundColor
            let currentPreviewIndex = previewViewController?.currentPreviewIndex ?? 0
            var hasCornerRadius = false
            if let view = pickerController.pickerDelegate?.pickerController(pickerController, dismissPreviewViewForIndexAt: currentPreviewIndex) {
                toRect = view.convert(view.bounds, to: containerView)
                previewView = view
                if view.layer.cornerRadius > 0 {
                    hasCornerRadius = true
                }
            }else if let rect = pickerController.pickerDelegate?.pickerController(pickerController, dismissPreviewFrameForIndexAt: currentPreviewIndex), !rect.equalTo(.zero) {
                toRect = rect
            }
            if let previewVC = previewViewController, let cell = previewVC.getCell(for: previewVC.currentPreviewIndex), let cellContentView = cell.scrollContentView {
                cellContentView.hiddenOtherSubview()
                fromView = cellContentView
                fromView.frame = cellContentView.convert(cellContentView.bounds, to: containerView)
            }else {
                fromView = pushImageView
            }
            
            if hasCornerRadius {
                fromView.layer.masksToBounds = true
            }
        }
        previewView?.isHidden = true
        contentView.addSubview(fromView)
        let duration = (self.type == .dismiss && !toRect.isEmpty) ? transitionDuration(using: transitionContext) - 0.2 : transitionDuration(using: transitionContext)
        let colorDuration = duration - 0.15
        let colorDelay = type == .present ? 0.05 : 0
        UIView.animate(withDuration: colorDuration, delay: colorDelay, options: [ .curveLinear]) {
            if self.type == .present {
                previewViewController?.bottomView.alpha = 1
                contentView.backgroundColor = backgroundColor.withAlphaComponent(1)
            }else if self.type == .dismiss {
                previewViewController?.bottomView.alpha = 0
                contentView.backgroundColor = backgroundColor.withAlphaComponent(0)
            }
        } completion: { (isFinished) in
        }
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [.layoutSubviews, .curveEaseOut]) {
            if self.type == .present {
                pickerController.navigationBar.alpha = 1
                if self.pushImageView.layer.cornerRadius > 0 {
                    self.pushImageView.layer.cornerRadius = 0
                }
                self.pushImageView.frame = toRect
            }else if self.type == .dismiss {
                pickerController.navigationBar.alpha = 0
                if let previewView = previewView, previewView.layer.cornerRadius > 0 {
                    fromView.layer.cornerRadius = previewView.layer.cornerRadius
                }
                if toRect.isEmpty {
                    fromView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
                    fromView.alpha = 0
                }else {
                    fromView.frame = toRect
                }
            }
        } completion: { (isFinished) in
            previewView?.isHidden = false
            if self.type == .present {
                if self.requestID != nil {
                    PHImageManager.default().cancelImageRequest(self.requestID!)
                    self.requestID = nil
                }
                let currentPreviewIndex = previewViewController?.currentPreviewIndex ?? 0
                pickerController.pickerDelegate?.pickerController(pickerController, previewPresentComplete: currentPreviewIndex)
                previewViewController?.view.backgroundColor = backgroundColor.withAlphaComponent(1)
                previewViewController?.setCurrentCellImage(image: self.pushImageView.image)
                previewViewController?.collectionView.isHidden = false
                previewViewController?.configColor()
                pickerController.configBackgroundColor()
                contentView.removeFromSuperview()
                transitionContext.completeTransition(true)
            }else {
                let currentPreviewIndex = previewViewController?.currentPreviewIndex ?? 0
                pickerController.pickerDelegate?.pickerController(pickerController, previewDismissComplete: currentPreviewIndex)
                if toRect.isEmpty {
                    contentView.removeFromSuperview()
                    transitionContext.completeTransition(true)
                }else {
                    UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction]) {
                        fromView.alpha = 0
                    } completion: { (isFinished) in
                        contentView.removeFromSuperview()
                        transitionContext.completeTransition(true)
                    }
                }
            }
        }
    }
    
    func requestAssetImage(for asset: PHAsset) {
        let options = PHImageRequestOptions.init()
        options.resizeMode = .fast
        options.isSynchronous = false
        requestID = AssetManager.requestImageData(for: asset, options: options) { (imageData, dataUTI, imageOrientation, info) in
            if imageData != nil {
                var image: UIImage?
                if imageOrientation != .up {
                    image = UIImage.init(data: imageData!)?.normalizedImage()
                }else {
                    image = UIImage.init(data: imageData!)
                }
                DispatchQueue.main.async {
                    self.pushImageView.image = image
                }
            }
            if AssetManager.assetDownloadFinined(for: info) ||
                AssetManager.assetCancelDownload(for: info){
                self.requestID = nil
            }
        }
    }
}
