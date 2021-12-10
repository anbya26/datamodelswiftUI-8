//
//  ContentView.swift
//  datamodel#8
//
//  Created by Mufti Ramdhani on 10/06/21.
//

import SwiftUI

//Model Data


struct ContentView: View {
  //data baru
  let data : [DataModel] = [
    DataModel(id: 1, namaproduk: "polygonXtrada", fotoproduk: "foto1", hargaproduk: 2000000, lokasi: "Kab.Banyumas", ratingccount: 4, jumlahrating: 56),
    DataModel(id: 2, namaproduk: "polygonHeist", fotoproduk: "foto2", hargaproduk: 3000000, lokasi: "Kab.Bogor", ratingccount: 5, jumlahrating: 56),
    DataModel(id: 3, namaproduk: "polygonMonarch", fotoproduk: "foto3", hargaproduk: 6000000, lokasi: "Kab.Brebes", ratingccount: 3, jumlahrating: 56),
    DataModel(id: 4, namaproduk: "United Detroit", fotoproduk: "foto4", hargaproduk: 9000000, lokasi: "Kab.Garut", ratingccount: 4, jumlahrating: 56),
    DataModel(id: 5, namaproduk: "United Miami", fotoproduk: "foto5", hargaproduk: 9000000, lokasi: "Kab.Bandung", ratingccount: 4, jumlahrating: 56),
    DataModel(id: 6, namaproduk: "United Patrol", fotoproduk: "foto6", hargaproduk: 2000000, lokasi: "Kab.Pemalang", ratingccount: 6, jumlahrating: 56),
    DataModel(id: 7, namaproduk: "Exotic M56", fotoproduk: "foto7", hargaproduk: 4000000, lokasi: "Kab.Semarang", ratingccount: 8, jumlahrating: 56),
    DataModel(id: 8, namaproduk: "Exotic j98", fotoproduk: "foto8", hargaproduk: 5000000, lokasi: "Kab.Banyumas", ratingccount: 4, jumlahrating: 56),
    DataModel(id: 9, namaproduk: "Genio Xtrada", fotoproduk: "foto9", hargaproduk: 8000000, lokasi: "Kab.Aceh", ratingccount: 3, jumlahrating: 56),
    DataModel(id: 10, namaproduk: "Pacific M898", fotoproduk: "foto10", hargaproduk: 2000000, lokasi: "Kab.Cianjur", ratingccount: 4, jumlahrating: 56),
  ]
  
//  @State var jumlahkeranjang = Int = 0
  @ObservedObject var globaldata = GlobalObject()
   

  var body: some View {
    
    NavigationView{
      ScrollView{
        ForEach(data) { row in //create number of rows
          VStack(spacing:10){
            Product(data: row, jumlahkeranjang: self.globaldata)
          }
          .padding()
        }
      }
      .navigationBarTitle("Sepeda MTB")
      .navigationBarItems(
        trailing:
          HStack(spacing: 20){
            Button(action: {print("Ok")})
            {
              Image(systemName: "person.fill")
            }
            
            keranjangView(jumlahkeranjang: globaldata)
           
          }
      )
    }
    .accentColor(Color.secondary)
    .navigationViewStyle(StackNavigationViewStyle())
  }
}


struct DetailView : View {
  
  @ObservedObject var globaldata : GlobalObject
  var body: some View {
    NavigationView {
      Text("Detail")
        .navigationBarTitle("Detail")
        .navigationBarItems(
          trailing:
            HStack(spacing: 20){
              Button(action: {print("Ok")})
              {
                Image(systemName: "person.fill")
              }
              
              NavigationLink(destination: DetailView(globaldata: globaldata )){
                keranjangView(jumlahkeranjang: globaldata)
              }
              
             
            }
        )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct Product :View { 
  let data: DataModel
  
//  @Binding var jumlahproduk : Int
  @ObservedObject var jumlahkeranjang : GlobalObject
  var body: some View {
    
    VStack(alignment:.leading){
      ZStack(alignment:.topTrailing){
        
        
        Image(self.data.fotoProduk)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(height: 200)
          .clipped()
        
        Button(action: {print("heart clicked")}){
          Image(systemName: "heart")
            .padding()
            .foregroundColor(Color.red)
        }
      }
      
      Text(self.data.namaProduk)
        .font(.title)
        .bold()
        .padding(.leading)
        .padding(.trailing)
      
      Text("Rp.\(self.data.hargaProduk)")
        .font(.title)
        .foregroundColor(Color.red)
        .bold()
        .padding(.leading)
        .padding(.trailing)
      
      HStack{
        Image(systemName: "mappin.circle")
        Text(self.data.lokasi )
      }
      .padding(.leading)
      .padding(.trailing)
      
      HStack{
        HStack{
          ForEach(0..<self.data.ratingCount){ items in
            Image(systemName: "star.fill")
          }
          
        }
        .foregroundColor(Color.yellow)
        
        Text("\(self.data.jumlahRating)")
        
      }
      .padding(.leading)
      .padding(.trailing)
      .padding(.bottom)
      
      tambahKeranjang(keranjang: jumlahkeranjang  )
      
    }
    .background(Color("warna"))
    .cornerRadius(15)
  }
}

struct keranjangView : View {
  
//  @Binding var jumlah: Int
  
   @ObservedObject var keranjang : GlobalObject
  
  
  var body: some View {
    ZStack{
 
        Image(systemName: "cart.fill")
          .resizable()
          .frame(width:20, height:20)
      
      Text("\(self.jumlahkeranjang.jumlah)")
        .foregroundColor(Color.white)
        .frame(width:10, height:10)
        .font(.body)
        .padding(5)
        .background(Color.red)
        .clipShape(Circle())
        .offset(x:10, y:-10)
    }
  }
}

struct tambahKeranjang : View {
  //buat binding data
//  @Binding var jumlah: Int
 
  @ObservedObject var keranjang : GlobalObject
  
  var body: some View {
    Button(action:{self.keranjang.jumlah += 1}){
      HStack {
        Spacer()
        HStack{
          Image(systemName: "cart")
          Text("Tambah keranjang")
            .font(.callout)
            .padding()
          
        }
        Spacer()
      }
    }
    .background(Color.green)
    .foregroundColor(Color.white)
    .cornerRadius(10)
    .padding()
  }
  
}
