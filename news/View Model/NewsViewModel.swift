//
//  NewsViewModel.swift
//  news
//
//  Created by Teguh Satrio on 9/5/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

//import Foundation
//import FirebaseFirestore
//
//class NewsViewModel: ObservableObject {
//  @Published var news = [NewsModel]()
//
//  private var db = Firestore.firestore()
//
//  func fetchData() {
//    db.collection("books").addSnapshotListener { (querySnapshot, error) in
//      guard let documents = querySnapshot?.documents else {
//        print("No documents")
//        return
//      }
//
//      self.news = documents.map { queryDocumentSnapshot -> NewsModel in
//        let data = queryDocumentSnapshot.data()
//        let title = data["title"] as? String ?? ""
//        let author = data["author"] as? String ?? ""
//        let numberOfPages = data["pages"] as? Int ?? 0
//
//        return NewsModel(id: .init(), title: title, author: author, numberOfPages: numberOfPages)
//      }
//    }
//  }
//}

