import UIKit

class DetailvViewContoroller: UIViewController {
    @IBOutlet weak var toolBarLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var replayButtons: UIButton!
    let rates = [String: Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
//Button edit
        replayButtons.titleLabel?.text = "Refres"
        replayButtons.layer.cornerRadius = 20
//Lable edit
        toolBarLabel.text = "CURRENCY CONVERT"
        cadLabel.text = "CAD"
        chfLabel.text = "CHF"
        gbpLabel.text = "GBP"
        jpyLabel.text = "JPY"
        usdLabel.text = "USD"
        tryLabel.text = "TÜRK LİRASI"
    }
    
    @IBAction func replayButton(_ sender: Any) {
        // 1-) Request & Session
        // 2-) Response & Data
        // 3-) Parsing & JSON - Serialization

        // 1-)
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=5c44a00de4b7024ae4236fc7a833e49d")
        let sesions = URLSession.shared
        
        //Closure
        let task = sesions.dataTask(with: url!) { data, response, error in
            if error != nil {
                //Alert mesage begin
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton =  UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                //mesage final
                
            }else{
                // 2-)
                if data != nil {
                    
                    do{
                        let jsonReponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //ASYNC
                        DispatchQueue.main.async { [self] in
                                //print(jsonReponse)
                            //print(jsonReponse["rates"])//Optinal olarak veri girişi
                            
                            
//                            if let rates = jsonReponse["CAD"] as? [String: Any]{
//                                print(rates)
//
//                            }
                            //getvval(value: "USD")
                            if let rates = jsonReponse["rates"] as? [String: Any]{
                                if let cad = rates["CAD"] as? Double{
                                    print(cad)
                                    cadLabel.text = "CAD : \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    print(chf)
                                    chfLabel.text = "CHF : \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double{
                                    print(gbp)
                                    gbpLabel.text = "GBP : \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double{
                                    print(jpy)
                                    jpyLabel.text = "JPY : \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double{
                                    print(usd)
                                    usdLabel.text = "USD : \(usd)"
                                }
                                if let tl = rates["TRY"] as? Double{
                                    print(tl)
                                    tryLabel.text = "TRY : \(tl)"
                                }
                                //getvval(value: "CAD")
                            }
                            
                        }
                        
                    }catch{
                        print("Error")
                    }
                }
            }
        }
        task.resume()
    }
    
//    func getvval(value: String ){
//            if let scope = rates[value] as? Double{
//                print(scope)
//            }
//    }


}
