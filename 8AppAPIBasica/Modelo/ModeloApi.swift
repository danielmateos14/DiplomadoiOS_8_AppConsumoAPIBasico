//
//  ModeloApi.swift
//  8AppAPIBasica
//
//  Created by djdenielb on 21/04/22.
//

import Foundation

//Primer paso para consumir api es analizar la API y ver de que tipo son los atributos que vamos a utilizar, si estan dentro de un parentesis o un corchete, ya viene eso se tiene que hacer por ejemplo para acceder a titulo, body etc, se tiene que hacer un struct con el protocolo codable, dentro de ese struct se tiene que poner exactamente el nombre de cada atributo que vamos a consumir el mismo nombre que tenga en la apu, si por ejempo esos atributos estan dentro de un atributo padre se tiene que crear un struct de ese atributo padre e indicarle dentro que el atributo sera el otro struct, abajo se puede ver como esta estructurada la API para asi poder ir creando los structs dependiedo del padre y los hijos

struct Results: Codable{
    var results:[ContenidoResults]
}

struct ContenidoResults: Codable{
    let title: String
    let body: String
    let signatureCount: Int
}



//{
//   "metadata":{
//      "responseInfo":{
//         "status":200,
//         "developerMessage":"OK",
//         "userMessage":"",
//         "errorCode":"",
//         "moreInfo":""
//      },
//      "requestInfo":{
//         "apiVersion":1,
//         "resource":"petitions",
//         "query":{
//            "body":null,
//            "createdAfter":null,
//            "createdAt":null,
//            "createdBefore":null,
//            "isPublic":1,
//            "isSignable":null,
//            "limit":"100",
//            "mock":0,
//            "offset":0,
//            "petitionsDefaultLimit":"1000",
//            "publicThreshold":149,
//            "responseId":null,
//            "signatureCount":null,
//            "signatureCountCeiling":null,
//            "signatureCountFloor":0,
//            "signatureThreshold":null,
//            "signatureThresholdCeiling":null,
//            "signatureThresholdFloor":null,
//            "sortBy":"DATE_REACHED_PUBLIC",
//            "sortOrder":"ASC",
//            "status":null,
//            "title":null,
//            "url":null,
//            "websiteUrl":"https://petitions.whitehouse.gov"
//         }
//      },
//      "resultset":{
//         "count":1375,
//         "limit":100,
//         "offset":0
//      }
//   },
//   "results":[
//      {
//         "id":"2722358",
//         "type":"petition",
//         "title":"Remove Chuck Schumer and Nancy Pelosi from office",
//         "body":"Schumer and Pelosi's hatred and refusing to work with President Donald J. Trump is holding America hostage. We the people know securing our southern border is a priority which will not happen with these two in office. Lets build the wall NOW!",
//         "petition_type":[
//            {
//               "id":291,
//               "name":"Call on Congress to act on an issue"
//            }
//         ],
//         "issues":[
//            {
//               "id":306,
//               "name":"Budget &amp; Taxes"
//            },
//            {
//               "id":326,
//               "name":"Homeland Security &amp; Defense"
//            },
//            {
//               "id":29,
//               "name":"Immigration"
//            }
//         ],
//         "signatureThreshold":100000,
//         "signatureCount":149,
//         "signaturesNeeded":99851,
//         "url":"https://petitions.whitehouse.gov/petition/remove-chuck-schumer-and-nancy-pelosi-office",
//         "deadline":1549642064,
//         "status":"closed",
//         "response":[
//
//         ],
//         "created":1547050064,
//         "isSignable":false,
//         "isPublic":true,
//         "reachedPublic":0
//      },
