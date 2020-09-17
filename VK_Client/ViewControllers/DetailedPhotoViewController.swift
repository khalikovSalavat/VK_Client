//
//  DetailedPhotoViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 04.08.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage

class DetailedPhotoViewController: UIViewController, UIGestureRecognizerDelegate {
//    var images: [UIImage] {
//        var images = [UIImage]()
//        guard let photoItems = photoItems else { return images }
//        for photo in photoItems {
//            let url = URL(string: photo.sizes.last!.url)
//            SDWebImageManager.shared.loadImage(with: url, options: SDWebImageOptions(rawValue: 0), progress: nil) { (image, _, _, _, _, _) in
//                if let image = image {
//                    images.append(image)
//                }
//            }
//        }
//        return images
//    }
    
    var images = [UIImage]()
    var sourceIndex: Int = 0
    var currentIndex: Int = 0 {
        didSet {
            currentIndex = currentIndex < 0 ? images.count - 1 : currentIndex
            currentIndex = currentIndex > images.count - 1 ? 0 : currentIndex
        }
    }
    let realmManager = RealmManager.shared
    var photoItems: Results<PhotoItem>? //{
//        guard let photos: Results<PhotoItem>? = realmManager?.getObjects() else { return nil }
//        return photos
//    }
    
    private var currentSign = 0
    private var percent: CGFloat = 0
    private var interactiveAnimator: UIViewPropertyAnimator?
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let backgrounImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let photoItems = photoItems { images = loadPhotos(photos: photoItems)}
        view.backgroundColor = .white
        currentIndex = sourceIndex
        layout(imgView: backgrounImageView)
        layout(imgView: imageView)
        setImages()
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        gesture.delegate = self
        imageView.addGestureRecognizer(gesture)
    }
    
    private func layout(imgView: UIImageView) {
        view.addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imgView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            imgView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func setImages() {
        let firstImage = images[currentIndex]
        var nextIndex = currentIndex + 1 //{

        var backgroundImage: UIImage?
        
        if currentSign > 0 {
            nextIndex = currentIndex - 1
        }
        
        if nextIndex < images.count - 1, nextIndex >= 0 {
            backgroundImage = images[nextIndex]
        } else if nextIndex == -1 {
            backgroundImage = images[images.count - 1]
        } else if nextIndex == images.count {
            backgroundImage = images[0]
        }
        
        imageView.image = firstImage
        backgrounImageView.image = backgroundImage
    }
    
    private func initAnimator() {
        backgrounImageView.alpha = 0.0
        backgrounImageView.transform = .init(scaleX: 0.8, y: 0.8)
        interactiveAnimator?.stopAnimation(true)
        interactiveAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            let width = CGFloat(self.currentSign) * self.view.frame.width
            let translationTranform = CGAffineTransform(translationX: width, y: 0)
            let angle = CGFloat(self.currentSign) * 0.8
            
//            let angleTransform = CGAffineTransform(rotationAngle: angle)
            
//            self.imageView.transform = angleTransform.concatenating(translationTranform)
            self.imageView.transform = translationTranform
            
            self.backgrounImageView.alpha = 1.0
            self.backgrounImageView.transform = .identity
        })
        
        interactiveAnimator?.startAnimation()
        interactiveAnimator?.pauseAnimation()
    }
    
    private func resetImageView() {
        backgrounImageView.alpha = 0.0
        backgrounImageView.transform = .init(scaleX: 0.8, y: 0.8)
        imageView.transform = .identity
        
        setImages()
        view.layoutIfNeeded()
        currentSign = 0
        interactiveAnimator = nil
    }
    
    @objc private func onPan(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let translation = gesture.translation(in: view)
            percent = abs(translation.x) / view.frame.width
            let translationX = Int(translation.x)
            let sign = translationX == 0 ? 1 : translationX / abs(translationX)
            
            if interactiveAnimator == nil || sign != currentSign {
                interactiveAnimator?.stopAnimation(true)
                resetImageView()
                interactiveAnimator = nil
                
//                if ( sign > 0 && currentIndex > 0 || ( sign < 0 && currentIndex < images.count - 1 ) ) {
                    currentSign = sign
                    setImages()
                    initAnimator()
//                }
            }
            
            interactiveAnimator?.fractionComplete = abs(translation.x) / (self.view.frame.width / 2)
            
        case .ended:
            interactiveAnimator?.addCompletion({ (position) in
                self.resetImageView()
            })
            
            if percent < 0.33 {
                interactiveAnimator?.stopAnimation(true)
                UIView.animate(withDuration: 0.3) {
                    self.resetImageView()
                }
            }
            else {
                currentIndex += currentSign * -1
                interactiveAnimator?.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            }
        default:
            break
        }
    }
    
    func loadPhotos( photos: Results<PhotoItem>) -> [UIImage] {
        var images = [UIImage]()
        for photo in photos {
            guard let urlString = photo.sizes.last?.url else { continue }
            let url = URL(string: urlString)
            SDWebImageManager.shared.loadImage(with: url, options: SDWebImageOptions(rawValue: 0), progress: nil) { (image, _, _, _, _, _) in
                if let image = image { images.append(image) }
            }
        }
        return images
    }
}
