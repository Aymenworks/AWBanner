//
//  Banner.swift
//  Debt Reminder
//
//  Created by Rebouh Aymen on 11/10/2015.
//  Copyright © 2015 Rebouh Aymen. All rights reserved.
//

import UIKit

// MARK: - Banner Properties -

private var originY: CGFloat = 0.0

private struct AWBannerProperties {
  static let height: CGFloat    = 40.0
  static let width: CGFloat     = UIScreen.mainScreen().bounds.width
}

// MARK: - Banner View -

class AWBannerView: UIView {
  
  var notificationLabel: UILabel!
  
  // MARK: - Lifecycle -
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    self.frame                           = CGRect(x: 0.0, y: originY, width: AWBannerProperties.width, height: 0.0)
    self.notificationLabel               = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: AWBannerProperties.width, height: AWBannerProperties.height))
    self.notificationLabel.font          = notificationLabel.font.fontWithSize(13.0)
    self.notificationLabel.textAlignment = .Left
    self.notificationLabel.text          = " "
    
    self.addSubview(notificationLabel)
    
    let tapGesture = UITapGestureRecognizer(target: self, action: "hide")
    self.addGestureRecognizer(tapGesture)
  }
  
  // MARK: - User Interaction -
  
  func hide() {
    AWBanner.hide()
  }
}

public class AWBanner {
  
  private static let notificationView = AWBannerView()
  
  public static func showWithDuration(duration: NSTimeInterval, delay: NSTimeInterval, message: String, backgroundColor: UIColor, textColor: UIColor, originY y: CGFloat = originY) {
    
    guard let window = UIApplication.sharedApplication().delegate?.window where window != nil else {
      return
    }
    
    originY = y
    
    self.notificationView.notificationLabel.text      = message
    self.notificationView.backgroundColor             = backgroundColor
    self.notificationView.notificationLabel.textColor = textColor
    
    UIView.animateWithDuration(0.5, delay: delay, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .CurveLinear, animations: {
      
      window!.addSubview(self.notificationView)
      self.notificationView.frame = CGRect(x: 0.0, y: originY, width: AWBannerProperties.width, height: AWBannerProperties.height) }, completion: nil)
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(duration * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
      self.hide()
    }
  }
  
  public static func hide() {
    UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .CurveLinear, animations: {
      self.notificationView.notificationLabel.text = " "
      self.notificationView.frame = CGRect(x: 0.0, y: originY, width: AWBannerProperties.width, height: 0.0)
      
      }) { if $0 {
        self.notificationView.removeFromSuperview()
        }
    }
  }
}

