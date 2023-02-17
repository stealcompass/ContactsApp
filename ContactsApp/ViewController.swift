//
//  ViewController.swift
//  ContactsApp
//
//  Created by Veniamin on 17.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//в main.storyboard была протянута связь от tableView до ViewController
//связь из connections - dataSource
// то есть мы сделали наш корневой ViewController - "Источником данных"
// для реализации этого паттерна для TableView есть класс UITableViewDataSource
extension ViewController: UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCellIdentifier")  else {
            
            print("Создаем новую ячейку \(indexPath.row)")
            
            let newCell = UITableViewCell(style: .default, reuseIdentifier: "contactCellIdentifier")
            
            var configuration = newCell.defaultContentConfiguration()
            
            configuration.text = "Строка \(indexPath.row)"
            newCell.contentConfiguration = configuration
            return newCell
        }
        
        //создаем ячейку
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "contactCellIdentifier") //создаем СПЕРВА новую ячейку пустую - тип cell становится UIListContentConfiguration
        //по умолчанию reuseIdentifier = nil, но тогда ячейки не переиспользуется и затрачивается больше ресурсов
        //нужен id ячейки, которая будет постоянно переиспользоваться
        //и метод UITableView --dequeueReusableCell, который позволяет переиспользовать ячейку
        
        
        //конфигурируем ячейку
        //var configuration = cell.defaultContentConfiguration()
        
        //indexPath имеет тип IndexPath
        //configuration.text = "Строка \(indexPath.row)"
        //cell.contentConfiguration = configuration
        
        
        print("Используем старую ячейку \(indexPath.row)")
        return cell
    }
}

