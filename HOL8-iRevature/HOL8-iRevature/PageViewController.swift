//
//  UIPageViewController.swift
//  HOL8-iRevature
//
//  Created by Kyle Keck on 2/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit


class PageViewController : UIPageViewController {
    fileprivate lazy var pages: [UIViewController] = {
        return [
          self.getViewController(withIdentifier: "page1"),
          self.getViewController(withIdentifier: "page2"),
          self.getViewController(withIdentifier: "page3"),
          self.getViewController(withIdentifier: "page4"),
          self.getViewController(withIdentifier: "page5"),
          self.getViewController(withIdentifier: "page6"),
          self.getViewController(withIdentifier: "page7")
        ]
      }()
       
      fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
      {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
      }
       
       
      override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate  = self
         
        if let firstVC = pages.first
        {
          setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
         
        // Do any additional setup after loading the view.
      }
       
      /*
      // MARK: - Navigation
      // In a storyboard-based application, you will often want to do a little preparation before navigation
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
      }
      */
    }
    extension PageViewController: UIPageViewControllerDataSource
    {
      func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
         
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
         
        let previousIndex = viewControllerIndex - 1
         
        guard previousIndex >= 0     else { return pages.last }
         
        guard pages.count > previousIndex else { return nil    }
         
        return pages[previousIndex]
      }
       
      func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
      {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
         
        let nextIndex = viewControllerIndex + 1
         
        guard nextIndex < pages.count else { return pages.first }
         
        guard pages.count > nextIndex else { return nil     }
         
        return pages[nextIndex]
      }
    }
    extension PageViewController: UIPageViewControllerDelegate { }









