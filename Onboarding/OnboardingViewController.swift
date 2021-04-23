//
//  OnboardingViewController.swift
//  Onboarding
//
//  Created by Bo LeGrand on 4/23/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .gray
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = false
        return scrollView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.backgroundColor = .systemBackground
        pageControl.currentPageIndicatorTintColor = .cyan
        pageControl.pageIndicatorTintColor = .gray
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        pageControl.gestureRecognizers = nil
        return pageControl
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.frame.size.width = 250
        button.frame.size.height = 50
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    private let pageTitles = [
        "Welcome",
        "Enable Location",
        "Turn on Notifications",
        "Add a Photo",
        "All Set!",
    ]
    
    private let colors: [UIColor] = [
        
        .systemPurple,
        .systemBlue,
        .systemPink,
        .systemGreen,
        .systemTeal
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSubViewsAndFrames()
        configureScrollView()
    }
    
    private func configureScrollView() {
        
        for i in 0..<5 {
            
            let pageView = UIView(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            pageView.backgroundColor = colors[i]
            
            scrollView.addSubview(pageView)
            nextButton.backgroundColor = .gray
            nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
            nextButton.tag = pageControl.currentPage
            nextButton.setTitle("Continue", for: .normal)
            
        }
    }
    
    private func addSubViewsAndFrames() {
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(titleLabel)
        
        titleLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width - 20, height: 120)
        nextButton.frame = CGRect(x: view.frame.size.width/2 - nextButton.frame.size.width/2, y: 600, width: nextButton.frame.width, height: nextButton.frame.height)
        pageControl.frame = CGRect(x: 0, y: view.frame.size.height - 100, width: view.frame.size.width, height: 100)
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 100)
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollView.frame.size.height)
        
        titleLabel.text = pageTitles[0]

    }
    
    @objc private func nextButtonPressed(_ sender: UIButton) {
        
        sender.tag += 1
        print(sender.tag)

        if sender.tag < 5 {
            titleLabel.text = pageTitles[nextButton.tag]
            print(titleLabel.text = pageTitles[nextButton.tag])

            scrollView.setContentOffset(CGPoint(x: CGFloat(sender.tag) * view.frame.size.width, y: 0), animated: true)
        }
        
        if sender.tag == 5 {
            dismiss(animated: true, completion: nil)
        }

        if nextButton.tag == 4 {
            nextButton.setTitle("Login", for: .normal)
        } else {
            nextButton.setTitle("Continue", for: .normal)
        }
        

    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
//        scrollView.setContentOffset(CGPoint(x: CGFloat(sender.currentPage) * view.frame.size.width, y: 0), animated: true)
    }
    
}

extension OnboardingViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
        
    }
}
