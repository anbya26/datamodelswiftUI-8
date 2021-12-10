//
//  DataModelFile.swift
//  datamodelswiftUI#8
//
//  Created by Mufti Ramdhani on 12/06/21.
//

import Foundation

struct DataModel : Identifiable {
  let id: Int
  let namaProduk: String
  let fotoProduk: String
  let hargaProduk: Int
  let lokasi: String
  let ratingCount: Int
  let jumlahRating: Int
  
  init(id: Int, namaproduk: String, fotoproduk: String, hargaproduk: Int, lokasi: String, ratingccount: Int, jumlahrating: Int ) {
    
    self.id = id
    self.namaProduk = namaproduk
    self.fotoProduk = fotoproduk
    self.hargaProduk = hargaproduk
    self.lokasi = lokasi
    self.ratingCount = ratingccount
    self.jumlahRating = jumlahrating
  }
}
