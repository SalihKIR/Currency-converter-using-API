class ViewController {
    var olusturulanViewModel: ViewModel = ViewModel()
}

class ViewModel {
    var olusturulanModel: KimlikModel = KimlikModel(isim: "Salih", soyad: "KIR")
    
}

struct KimlikModel {
    let isim: String
    let soyad: String
}

let olusturulanViewController = ViewController()

print(olusturulanViewController.olusturulanViewModel.olusturulanModel.isim)



/*
 
 MVC
 
 */


class MVCController {
    
    func getKimlik() -> KimlikModel {
        return KimlikModel(isim: "Furkan", soyad: "Sandal")
    }
}

class MVCView {
    var controller = MVCController()
    
    func  getKimlikDetail() -> KimlikModel {
        return controller.getKimlik()
    }
}

let mvc = MVCView()
print(mvc.getKimlikDetail().isim)
