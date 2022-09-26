//
//  ViewController.swift
//  pokeAppTripster
//
//  Created by user on 21/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var podeImage: UIImageView!
    
    @IBOutlet weak var pokeName: UILabel!
    
    @IBOutlet weak var pokeId: UILabel!
    
    
    @IBOutlet weak var pkeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func pokeStep(_ sender: UIStepper) {
//        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(Int(sender.value + 1))")!
//
//        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//            if let error = error {
//                print("Error with fetching films: \(error)")
//                return
//              }
//
//            guard let httpResponse = response as? HTTPURLResponse,
//                        (200...299).contains(httpResponse.statusCode) else {
//                    print("Error with the response, unexpected status code: \(response)")
//                    return
//                  }
//
//            if let data = data,
//                    let pokeSummary = try? JSONDecoder().decode(PokemonIndex.self, from: data) {
//                    completionHandler(pokeSummary.results ?? [])
//                  }
//
//        })
        
        let pokemonID = Int(sender.value)
        pokeId.text = "Pokémon ID: \(pokemonID)"
//        print(sender.value)

        fetchImage(withUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonID).png"){ image in
            
            DispatchQueue.main.async {
                self.pkeImage.image = image
            }
        }
        makeRequest(apiurl: "https://pokeapi.co/api/v2/pokemon/\(pokemonID)")
    }
    
    func fetchImage(withUrlString urlString: String, completion: @escaping(UIImage)->()){
            
            guard let url  = URL(string: urlString) else {return}
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error =  error {
                    print ("fetchin image errors as as as ", error.localizedDescription)
                    return
                }
                
                guard let data  = data  else {return}
                guard let image = UIImage(data: data) else {return}
                
                completion(image)
            }.resume()
    }
    
    func makeRequest(apiurl: String) {
        guard let url = URL(string: apiurl) else {
            print("Error - string informada é inválida para criação de URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
//        URLCache.shared.removeAllCachedResponses()
        URLSession.shared.dataTask(with: urlRequest ) { data, _, error in
            if error != nil {
                print("Error - Requisição executada, mas tivemos como retorno um erro")
                return
            }
            
            guard let data = data else {
                print("Error Data inválido")
                return
            }
            
            if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) {
                DispatchQueue.main.async {
                    self.pokeName.text = pokemon.name!
                }
            } else {
                print("Error nao consegui converter")
                return
                // não terei objeto
            }
            
        }.resume()
        
        
    }
}

