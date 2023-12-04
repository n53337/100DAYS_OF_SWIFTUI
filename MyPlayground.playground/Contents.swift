var json = ["name":"usef", "age":"21"]

//if let userName = json["namee"]{
//    print("available \(userName)")
//}

func check(){
    guard let userName = json["name"] else{
            return
    }
    print(userName)
}

check()
