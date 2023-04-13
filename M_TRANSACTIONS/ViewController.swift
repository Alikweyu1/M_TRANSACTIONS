//
//  ViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 04/04/2023.
//

import UIKit
import Charts
class ViewController: UIViewController {

    @IBOutlet weak var nextbtn: UIButton!
    var timer :Timer?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pagecontroller: UIPageControl!
    var slides:[OnbordingSLide] = []
    var currentPage = 0{
        didSet{
            pagecontroller.currentPage = currentPage
            if currentPage == slides.count - 1 {
                    self.nextbtn.setTitle("Preview", for: .normal)
                    
              
            }else{
                
                self.nextbtn.setTitle("Next", for: .normal)
            }
              
            }
        }
   
    @IBOutlet weak var next2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "M-TRANSACTION"
        self.navigationItem.title =  "M-TRANSACTION "
        let ImageGIF = UIImage.gifImageWithName("sad")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        slides = [
            OnbordingSLide(title: "Easy Payment!!!", description: " No need of your wallet or your bank card, Use M_Transaction to pay as you go", images: UIImage.gifImageWithName("imageBorad1")!),
            OnbordingSLide(title: "Security", description: "Your money is more secure,free from a malicious user", images: UIImage.gifImageWithName("secure")!),
            
            OnbordingSLide(title: "Transaction", description: "testing", images: UIImage(named:"transactionlist" )!),
            OnbordingSLide(title: "WithDraw", description: "testing", images: UIImage(named:"withdraw" )!),
            OnbordingSLide(title: "WithDraw", description: "testing", images: UIImage(named:"withdraw" )!),
            OnbordingSLide(title: "WithDraw", description: "testing", images: UIImage(named:"withdraw" )!)
          
            
        ]
        collectionView.delegate = self
        collectionView.dataSource = self
        //timer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(slideTonext), userInfo: nil, repeats: true)
        pagecontroller.numberOfPages = slides.count
    }
    @objc func slideTonext(){
        if currentPage < slides.count - 1{
            currentPage = currentPage + 1
        }
        else{
            currentPage = 0
        }
        pagecontroller.currentPage = currentPage
        collectionView.scrollToItem(at: IndexPath(item: currentPage, section: 0), at: .right, animated: true)
    }
    
    @IBAction func testing2(_ sender: Any) {
        performSegue(withIdentifier: "testing", sender: self.view)
    }
    
    @IBAction func skipped(_ sender: Any) {
        performSegue(withIdentifier: "skip", sender: self)
    }
   
    @IBAction func testintransaction(_ sender: Any) {
        //performSegue(withIdentifier: "testing", sender: self)
        pagecontroller.currentPage = currentPage
        if currentPage < slides.count - 1{
            currentPage = currentPage + 1
            pagecontroller.currentPage = currentPage
        }
        else{
            currentPage = 0
        }
        pagecontroller.currentPage = currentPage
        collectionView.scrollToItem(at: IndexPath(item: currentPage, section: 0), at: .right, animated: true)
    }
}
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setUp(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let with = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/with)
        //currentPage += 1
        
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}

