//
//  MenuViewCell.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 09/04/2023.
//

import UIKit


class MenuViewCell: UITableViewCell {

    @IBOutlet weak var arror: UIImageView!
    @IBOutlet weak var menutitels: UILabel!
    //@IBOutlet weak var menutitels: UIButton!
    var title_array:Menu?{
        didSet{
            config()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    func config(){
        guard let title_array else{
            print("no data")
            return
            
        }
        print(title_array)
        DispatchQueue.main.async {
           
        }
    }
    
}
