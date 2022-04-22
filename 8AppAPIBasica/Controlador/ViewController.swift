//
//  ViewController.swift
//  8AppAPIBasica
//
//  Created by djdenielb on 21/04/22.
//

import UIKit

class ViewController: UIViewController{
    
//  Variables graficas, creamos un enlace de la tabla aqui para poder trabajar con ella
    @IBOutlet weak var tablaPrototipo: UITableView!
    
//    La instancia del cerebro para poder traernos las funciones para consumir la API
    var cerebroApi = CerebroApi()
    
//    Variable, aqui creamos las variables de los atributos de la api que queremos utilizar, si son int o string
    var tituloApi: String = ""
    var bodyApi: String = ""

//    Funcion al cargar
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Al cargar la APP, tenemos que llamar a la funcion de creacionAPI y pasarle la url como string para que la ejecute al cargar
        cerebroApi.creacionApi(recibeURLApi: "https://www.hackingwithswift.com/samples/petitions-1.json")
        
//        Estos son los delegados de la tabla, le estamos diciendo a la tabla que este VC sera el encargado de mostrar los datos y de llenarlos
        tablaPrototipo.delegate = self
        tablaPrototipo.dataSource = self
    }
}

//Esto es una extension, es para poner por separado los protocolos de la tabla, se puede hacer dentro del VC de arriba pero se usa asi para tener mejor acomodo de codigo
//Primero ponemos los protocolos
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
//    La primera funcion obligatoria es para saber cuantas filas seran, aqui accedemos al cerebro y luego al array creado y le ponemos el count para que le diga que el tamaño de las filas sera igual al tamaño del array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cerebroApi.arrayResults.count
    }
    
//    Esta segunda funcion obligatoria, es para llenar la celda de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        Primero se crea la variable celda, se usa el dequeue en la tabla, le pasamos como parametro el nombre de la celda que le pusimos al crearla, y el indexpath que es el contador
        let celda = tablaPrototipo.dequeueReusableCell(withIdentifier: "celdaPrototipo", for: indexPath)
        
//        Esta variable celda accedera al elemento grafico de la celda o sea al titulo y le pondra lo que tenga el array en su posicion contador (indexpath) en su row o sea su file y luego le dira el atributo que es el title
        celda.textLabel?.text = cerebroApi.arrayResults[indexPath.row].title
        
//        Aqui hara lo mismo para el subtitle pero accedera al atributo body, ojo aqui, se puso un ir para indicar que si el body viene vacio entonces que ponga un mensaje en la celda que diga, sin contenido, despues preguntamos si ese body dice sin contendio, pintalo de rojo, en caso de que no venga vacio haz lo mismo que arriba
        if cerebroApi.arrayResults[indexPath.row].body.isEmpty{
            celda.detailTextLabel?.text = "Sin contenido"
            
            if celda.detailTextLabel?.text == "Sin contenido"{
                celda.detailTextLabel?.textColor = UIColor.red
            }
        }else{
            celda.detailTextLabel?.text = cerebroApi.arrayResults[indexPath.row].body
        }
        
//        Al final retornamos celda ya llenada con los valores de la API
        return celda
    }
    
//    Esta tercera funcion es para cuando selecciones la celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        Las 2 variables que declaramos arriba aqui es donde se usaran, tituloapi sera igual que lo que traiga title de la api
        tituloApi = cerebroApi.arrayResults[indexPath.row].title
        
//        Despues hacemos lo mismo por si viene vacia, a la variable bodyapi le ponemos sin contendio y en caso contrario que se llene con el body que tiene el array
        if cerebroApi.arrayResults[indexPath.row].body == ""{
            bodyApi = "Sin contenido"
        }else{
            bodyApi = cerebroApi.arrayResults[indexPath.row].body
        }
        
//        Al final decimos que cambie a la siguiente pantalla
        performSegue(withIdentifier: "segueDetalles", sender: self)
        
    }
    
//    Esta funcion ya es para enviar los datos
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetalles"{
            let enviarDatos = segue.destination as! DetallesViewController
//           Accedemos las variables de la segunda pantalla, y le decimos que sera igual a lo que queremos enviar, en este caso el titulo y el body
            enviarDatos.recibeTitulo = tituloApi
            enviarDatos.recibeBody = bodyApi
        }
    }
}

