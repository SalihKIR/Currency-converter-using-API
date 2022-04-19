import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currencyConvertimageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Resim entegre işlemi
        currencyConvertimageView.image = UIImage(named: "images")
        //Navigator topitem işlemleri
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(playitem))
        navigationController?.title = "İşlem için lütfen buttona basınız..."
    }
    //Bar item fonksiyon
    @objc func playitem(){
        let vcdetail = DetailvViewContoroller.instantiate(storyboard: .detail)
        navigationController?.pushViewController(vcdetail, animated: true)
    }
}

