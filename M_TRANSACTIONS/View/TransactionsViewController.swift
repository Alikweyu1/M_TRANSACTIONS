//
//  TransactionsViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 07/04/2023.
//

import UIKit
import Charts
class TransactionsViewController: UIViewController {
    var menu_vc:MenuViewController!
    
    @IBOutlet weak var test: UIBarButtonItem!
    @IBOutlet weak var transactionBtn: UIStackView!
    @IBOutlet weak var expenseIncomeView: UIView!
    @IBOutlet weak var transactionListView: UIView!
    var transaction:Transaction?
    var trans:[Transaction] = []
    @IBOutlet weak var incomelbl: UIButton!
    //@IBOutlet weak var IncomeCHart: PieChartView!
    //@IBOutlet weak var IExpensesCHart: PieChartView!
    @IBOutlet weak var expenseLbl: UIButton!
    //@IBOutlet weak var expenseLbl: UILabel!
    //@IBOutlet weak var incomelbl: UILabel!
    //@IBOutlet weak var incomeTable: UITableView!
    //@IBOutlet weak var income: PieChartView!
    @IBOutlet weak var expenses: PieChartView!
    @IBOutlet weak var income: PieChartView!
    //@IBOutlet weak var expenses: PieChartView!
    @IBOutlet weak var productTableViews: UITableView!
    var totalDeposit = 40000000
    var totalRecieved = 0.0
    var totalSend = 0.0
    var totalWithDraw = 0.0
    var totalIncome: Float = 0.0
    var totalExpenses: Float = 0.0
    var incomeChart: [Transaction] = []
    var expensesChart: [Transaction] = []
    var other: [Transaction] = []
    private var viewModel = UserModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productTableViews.refreshControl = UIRefreshControl()
        self.productTableViews.refreshControl?.addTarget(self, action: #selector(refreshDate), for: .valueChanged)
        menu_vc = storyboard?.instantiateViewController(withIdentifier:"MenuViewController") as? MenuViewController
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.responseGesture))
        rightSwipe .direction = UISwipeGestureRecognizer.Direction.right
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.responseGesture))
        leftSwipe .direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(rightSwipe)
        self.view.addGestureRecognizer(leftSwipe)
        
        
        
        
        
        configurations()
        Charts()
        self.transactionListView.layer.cornerRadius = 30
        self.transactionListView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.transactionListView.layer.shadowColor = UIColor.black.cgColor
        self.transactionListView.layer.shadowRadius = 30
        self.transactionListView.layer.shadowOpacity = 0
        
        
        
        self.expenseIncomeView.layer.cornerRadius = 10
        self.expenseIncomeView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.expenseIncomeView.layer.shadowColor = UIColor.black.cgColor
        self.expenseIncomeView.layer.shadowRadius = 10
        self.expenseIncomeView.layer.shadowOpacity = 0.5
        
        
        self.transactionBtn.layer.cornerRadius = 10
        self.transactionBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.transactionBtn.layer.shadowColor = UIColor.black.cgColor
        self.transactionBtn.layer.shadowRadius = 10
        self.transactionBtn.layer.shadowOpacity = 1
    }
    @objc private func refreshDate(){
        viewModel.fetchTransactions()
    }

    @IBAction func withdraw(_ sender: Any) {
        self.performSegue(withIdentifier:"withdraw", sender: self.view)
    }
    @IBAction func deposit(_ sender: Any) {
        self.performSegue(withIdentifier:"deposit", sender: self.view)
    }
    @IBAction func recieved(_ sender: Any) {
        self.performSegue(withIdentifier:"recieved", sender: self.view)
    }
    @objc func responseGesture(gesture: UISwipeGestureRecognizer){
        switch gesture.direction{
        case UISwipeGestureRecognizer.Direction.right:
            showMenu()
        case UISwipeGestureRecognizer.Direction.left:
            closeMenu()
        default:
            closeMenu()
        }
    }
   
   

   @IBAction func menuOpen(_ sender: Any) {
       if AppDelegate.menu_bool{
           showMenu()
       }else{
           closeMenu()
       }
    }
    @IBAction func Sent(_ sender: UIButton) {
        self.performSegue(withIdentifier:"send", sender: self.view)
    }
}
extension TransactionsViewController{
    
    func showMenu(){
        UIView.animate(withDuration: 0.3,delay: 0){  () -> Void in
            self.menu_vc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            self.menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            self.addChild(self.menu_vc)
            self.view.addSubview(self.menu_vc.view)
            
            
            AppDelegate.menu_bool = false
        }
    }
    func closeMenu(){
        UIView.animate(withDuration: 0.3,delay:0,animations: { () -> Void in
            self.menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.width, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }){(Finished) in
            self.menu_vc.view.removeFromSuperview()
        }
        
        AppDelegate.menu_bool = true
    }
    func configurations(){
        productTableViews.register(UINib(nibName: "TransactionTableViewCell", bundle: nil), forCellReuseIdentifier:"TransactionTableViewCell" )
        //incomeTable.register(UINib(nibName: "IncomeTableViewCell", bundle: nil), forCellReuseIdentifier: "IncomeTableViewCell")
        initModel()
        observeEvents()
    }
    func  initModel(){
        viewModel.fetchTransactions()
    }
    func observeEvents(refreshing:Bool = true){
        viewModel.eventHandler = {[weak self] event in
            switch event{
                
            case .loading:
                print("Product loading....")
                DispatchQueue.main.async { [self] in
                    if refreshing{
                        
                        self?.productTableViews.refreshControl?.beginRefreshing()
                    }
                }
            case .stopLoading:
                print("Stop loading...")
                DispatchQueue.main.async { [self] in
                    if refreshing{
                        self?.productTableViews.refreshControl?.endRefreshing()
                    }
                }
            case .dataLoaded:
                print("Data loaded...")
                DispatchQueue.main.async { [self] in
                    if refreshing{
                        self?.productTableViews.refreshControl?.endRefreshing()
                    }
                }
                DispatchQueue.main.async {
                    //self?.incomeTable.reloadData()
                    
                    self?.productTableViews.reloadData()
                    let currencyFormatter = NumberFormatter()
                    currencyFormatter.numberStyle = .currency
                    currencyFormatter.maximumFractionDigits = 2
                    
                    self?.incomelbl.setTitle("Ksh\(self!.totalDeposit)", for: .normal)
                    self?.incomelbl.setTitleColor(UIColor.black, for: .normal)
                    
                    self?.expenseLbl.setTitle("Ksh\(self!.totalDeposit)", for: .normal)
                }
            case .error(let error):
                print(error)
            
           
            case .newWithdrawAdded(addwithdraw: let addwithdraw):
                print(addwithdraw)
            case .newDepopsitAdded(addDeposit: let addDeposit):
                print(addDeposit)
            }
        }
    }
    func IncomeExpenses(){
        
    }
}
extension TransactionsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell") as? TransactionTableViewCell else{
            return UITableViewCell()
        }
        let transaction = viewModel.transactions[indexPath.row]
        cell.transaction = transaction
        return cell
    }
    
    
}
extension TransactionsViewController{
    
    func Charts(){
        var incomeChartDataEntries = [PieChartDataEntry]()
        var expensesChartDataEntries = [PieChartDataEntry]()
        
    
    }

}
