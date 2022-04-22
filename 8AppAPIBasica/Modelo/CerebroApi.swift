//
//  CerebroApi.swift
//  8AppAPIBasica
//
//  Created by djdenielb on 21/04/22.
//

import Foundation

//Creamos la strcut que sera el cerebro modelos del MVC
struct CerebroApi{
    
//    Se crea un array de que, dentro del array iran los atributos del contenido, lo que se declaro en los structs del modeloAPI
    var arrayResults = [ContenidoResults]()
    
//    Creamos una funcion que va a servir para llamarla desdel VC, esta funcion va a crear el consumo de la api, recibe un string y ese string va a ser la url (pagina) de la API
    mutating func creacionApi(recibeURLApi: String){
        
        
//        Declaramos un variable de tipo string que tendra la url de la api, que es la que recibe la funcion
        let urlString = recibeURLApi
        
//        Creamos un if let para intentar crear una url a partir de la url string que tenemos arriba si esta url string viene mal no creara la URL valida
        if let url = URL(string: urlString){
//            Creamos una variable que contendra un intento de crear datos a partir de la url, hara un try y dira si la url viene bien se crea una URL de datos si se crea esa URL entonces intenta crear un objeto DATA con el contenido de la URL
            if let datosListosAnalizar = try? Data(contentsOf: url){
//                Aqui llamamos a la funcion que parsea convierte los datos del json
                decodificarJson(recibeUnData: datosListosAnalizar)
            }
        }
    }
    
//    Esta funcion se encarga de convertir eso que viene en la api como texto o numero, lo pasa a los atributos que creamos y los pones disponibles dentro del array
    mutating func decodificarJson(recibeUnData: Data){
        
//        Primero se crea una variable que sera del tipo JSONDecoder esto quiere decir que esa variable podra usar todo lo de la clase JSONDecoder
        let decodicador = JSONDecoder()
        
//        Despues creamos otra variable pero sera segura con el if let, esto dira, si creo variable y sera igual a intenta decodificar (lo que tiene Results o sea el struct que creamos y que dentro tenia un array del tipo contenido struct o sea todos los atributos del otro struct, from: desde donde ? desde el data, cual es el data, el que esta arriba en donde se llama a esta funcion y que trae ese data? trae todo el contenido de la url cual url? la de la API
        if let listaDeElementosQueHabra = try? decodicador.decode(Results.self, from: recibeUnData){
//            print(listaDeElementosQueHabra.results.count) este print solo es de debug, para indicar cuantos elementos tiene la API, accede a ellos con el nombre de la variable que acabamos de crear por que ya tiene todos los elementos de la api ya los guardo todos en el array
            
//            Ahora accedemos a la variable array que creamos al principio de este cerebro, esta variable array se va a llenar con que? con la variable de arriba que tiene que? tiene todos los elementos de la API y ahora esta guardados en ese array que a su ves los esta guardando en el array de contenido
            arrayResults = listaDeElementosQueHabra.results
            
//            Como ya los estan guardando en el array de contendio, ahora podemos acceder a ese array que creamos y podemos acceder a los atributos de contenidoResults y poder mostrarlo, pintarlo, etc etc estos print son de Debug
//            print(arrayResults[0].title)
//            print(arrayResults[0].body)
//            print(arrayResults[0].signatureCount)
        }
    }
}


