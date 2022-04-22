//
//  DetallesViewController.swift
//  8AppAPIBasica
//
//  Created by djdenielb on 22/04/22.
//

import UIKit

class DetallesViewController: UIViewController {

//    Variables graficas
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelBody: UILabel!
    
//    Variable que recibiran los datos, deben de ser del tipo de dato que las envia
    var recibeTitulo: String?
    var recibeBody: String?
    
//    Funcion al arrancar
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Al arrancar este VC, le vamos a decir que la variable grafica labeltitulo va a ser igual a la variable que recibe el dato de la primera pantalla que es recibe titulo, le agregue al labe que cambie de color al abrir
//        Lo mismo con la de body pero en este caso le ponemos que si la variable que llega es igual a sin contendio entonces pintala de rojo y si no entonces solo muestrala normal, igual al abrir que cambie de color a rojo cuando sea sin contendido
        labelTitulo.text = recibeTitulo
        labelTitulo.textColor = UIColor.blue
        if recibeBody == "Sin contenido"{
            labelBody.text = "Sin contenido"
            labelBody.textColor = UIColor.red
        }else{
        labelBody.text = recibeBody
        }
    }

}
