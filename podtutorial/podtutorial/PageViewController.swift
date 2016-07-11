//
//  PageViewController.swift
//  podtutorial
//
//  Created by leonardo fernandes farias on 30/06/16.
//  Copyright © 2016 leonardo fernandes farias. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    var images: [UIImage]!
    var pageview: UIPageViewController!
    var currentIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageview = self.storyboard?.instantiateViewControllerWithIdentifier("Page") as! UIPageViewController
        self.pageview.dataSource = self
        self.pageview.delegate = self
        
        let startVC = self.viewControllerAtIndex(currentIndex) as EdicaoImagemViewController
        let viewControllers = NSArray(objects: startVC) as! [UIViewController]
        
        self.pageview.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
        self.pageview.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 60)
        self.addChildViewController(self.pageview)
        self.view.addSubview(self.pageview.view)
        self.pageview.didMoveToParentViewController(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> EdicaoImagemViewController {
        if ((self.images.count == 0) || (index >= self.images.count)) {
            return EdicaoImagemViewController()
        }
        
        let vc: EdicaoImagemViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! EdicaoImagemViewController
        vc.recebeImagem = images[index]
        vc.pageIndex = index

        return vc
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! EdicaoImagemViewController
        var index = vc.pageIndex as Int
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
        
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! EdicaoImagemViewController
        var index = vc.pageIndex as Int
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        if index == self.images.count {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
            
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.images.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    
}


extension PageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        print("\(self) testando essa variavel: \(pendingViewControllers)")
    }
    
//    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
//        <#code#>
//    }
//    
//    func pageViewControllerSupportedInterfaceOrientations(pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
//        <#code#>
//    }
//
//    func pageViewControllerPreferredInterfaceOrientationForPresentation(pageViewController: UIPageViewController) -> UIInterfaceOrientation {
//        <#code#>
//    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        let viewNova: EdicaoImagemViewController = EdicaoImagemViewController(previousViewControllers) //as! EdicaoImagemViewController
//        print("mais esse aqui: \(viewNova.pageIndex)")
    }
}


