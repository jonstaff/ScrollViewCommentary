//
//  ViewController.swift
//  ScrollViewCommentary
//
//  Created by Jonathon Staff on 6/16/16.
//  Copyright © 2016 Nplexity LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  weak var scrollView: UIScrollView!
  weak var boundsLabel: UILabel!
  weak var contentOffsetLabel: UILabel!
  weak var contentInsetLabel: UILabel!
  weak var contentInsetSlider: UISlider!

  override func viewDidLoad() {
    super.viewDidLoad()
    view.translatesAutoresizingMaskIntoConstraints = false

    scrollView = createScrollView()
    boundsLabel = createBoundsLabel()
    contentOffsetLabel = createContentOffsetLabel()
    contentInsetLabel = createContentInsetLabel()
    contentInsetSlider = createContentInsetSlider()

    NSLayoutConstraint(item: contentOffsetLabel,
                       attribute: .Top,
                       relatedBy: .Equal,
                       toItem: boundsLabel,
                       attribute: .Bottom,
                       multiplier: 1.0,
                       constant: 8).active = true
    NSLayoutConstraint(item: contentInsetLabel,
                       attribute: .Bottom,
                       relatedBy: .Equal,
                       toItem: contentInsetSlider,
                       attribute: .Top,
                       multiplier: 1.0,
                       constant: -8).active = true
  }
}

private extension ViewController {
  func createScrollView() -> UIScrollView {
    let scrollView = UIScrollView()
    scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    scrollView.frame = CGRect(origin: .zero, size: view.bounds.size)
    view.addSubview(scrollView)

    let image = UIImage(named: "death-valley")
    let imageView = UIImageView(image: image)
    imageView.center.y = scrollView.center.y

    scrollView.addSubview(imageView)
    scrollView.contentSize.width = CGRectGetWidth(imageView.bounds)
    scrollView.contentInset.left = 50

    scrollView.delegate = self
    return scrollView
  }

  func createBoundsLabel() -> UILabel {
    let label = UILabel()
    label.textColor = .whiteColor()
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)

    NSLayoutConstraint(item: label,
                       attribute: .Leading,
                       relatedBy: .Equal,
                       toItem: view,
                       attribute: .Leading,
                       multiplier: 1.0,
                       constant: 8).active = true
    NSLayoutConstraint(item: label,
                       attribute: .Top,
                       relatedBy: .Equal,
                       toItem: view,
                       attribute: .Top,
                       multiplier: 1.0,
                       constant: 30).active = true

    return label
  }

  func createContentOffsetLabel() -> UILabel {
    let label = UILabel()
    label.textColor = .whiteColor()
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)

    NSLayoutConstraint(item: label,
                       attribute: .Leading,
                       relatedBy: .Equal,
                       toItem: view,
                       attribute: .Leading,
                       multiplier: 1.0,
                       constant: 8).active = true

    return label
  }

  func createContentInsetLabel() -> UILabel {
    let label = UILabel()
    label.textColor = .whiteColor()
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)

    NSLayoutConstraint(item: label,
                       attribute: .Leading,
                       relatedBy: .Equal,
                       toItem: view,
                       attribute: .Leading,
                       multiplier: 1.0,
                       constant: 8).active = true

    return label
  }

  func createContentInsetSlider() -> UISlider {
    let slider = UISlider()
    slider.minimumValue = 0.0
    slider.maximumValue = 100.0
    slider.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(slider)

    NSLayoutConstraint(item: slider,
                       attribute: .Leading,
                       relatedBy: .Equal,
                       toItem: view,
                       attribute: .Leading,
                       multiplier: 1.0,
                       constant: 8).active = true
    NSLayoutConstraint(item: slider,
                       attribute: .Width,
                       relatedBy: .Equal,
                       toItem: .None,
                       attribute: .NotAnAttribute,
                       multiplier: 1.0,
                       constant: 100).active = true
    NSLayoutConstraint(item: slider,
                       attribute: .Bottom,
                       relatedBy: .Equal,
                       toItem: view,
                       attribute: .Bottom,
                       multiplier: 1.0,
                       constant: -8).active = true

    slider.addTarget(self, action: #selector(updateContentInset), forControlEvents: .ValueChanged)
    return slider
  }

  @objc func updateContentInset() {
    let contentInset = CGFloat(contentInsetSlider.value)
    contentInsetLabel.text = String(format: "contentInset.left: %.2f", contentInset)
    scrollView.contentInset.left = contentInset
  }
}

extension ViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(scrollView: UIScrollView) {
    boundsLabel.text = String(format: "origin.x (bounds): %.2f", scrollView.bounds.origin.x)
    contentOffsetLabel.text = String(format: "contentOffset.x: %.2f", scrollView.contentOffset.x)
  }
}
