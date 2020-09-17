//
//  NewsViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 25.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

//struct News {
//    let newsID: Int
//    let authorID: String
//    let publishTime: String = "01.01.2020 в 00:00"
//    let title: String
//    let newsText: String
//    let img: UIImage!
//    var likes: LikeControl
//    
//    var numberOfView: Int {
//        get {
//            return Int.random(in: 10...1000)
//        }
//    }
//}
//
//var newsTextString: [String] = [
//    """
//     Если вы потеряли свой пульт ДУ Siri Remote, не расстраивайтесь, прижелании вы можете управлять медиаприставкой Apple TV через  «Пункт управления» в iPhone или iPad с установленной iOS 11 либо  более поздними версиями операционной системы.  Конечно, можно купить еще один пульт дистанционного управления,  но зачем тратить лишние, к слову, не такие уж маленькие, деньги?  Либо вы можете перепрограммировать обычный инфракрасный пульт ДУ  для управления Apple TV, но это неудобный и ненадежный способ.  Вместо этого используйте iOS-устройство. Метод работает при  условии, что на iPhone, iPad или iPod touch установлена версия  iOS 11 или выше, а приставка Apple TV – четвертого поколения или  Apple TV 4K. Оба устройства должны быть подключены к одной сети Wi-Fi.
//    """,
//    """
//    Приложение iCloud Drive дает быстрый и удобный доступ к файлам в «облаке» с Mac и iOS-устройств. Вот только добираться к нему не очень удобно – по умолчанию Apple предлагает только вкладку Drive в Finder. А нельзя ли добавить иконку Drive на панель Dock? Можно! И вот как это сделать.
//    Для того, чтобы разместить iCloud Drive в нужном нам месте, потребуется доступ к системной папке. Мы сделаем шорткат и разместим иконку прямо в Dock. Звучит страшновато, но на самом деле здесь нет ничего такого уж сложного.
//
//    1. Откройте на вашем Mac приложение Finder – нажатием на соответствующую иконку или через поиск.
//
//    2. В строке меню выберите Переход → Переход к папке или нажмите сочетание клавиш Command (⌘) + Shift (⇧) + G.
//    3. Введите следующий путь, а затем нажмите Enter (Return):
//
//    /System/Library/CoreServices/Finder.app/Contents/Applications/
//    """,
//    """
//    MacOS и iOS отлично работают вместе. Если вы используете и смартфон, и компьютер от Apple, в вашем распоряжении есть множество полезных функций. В этой статье мы рассмотрим десять самых полезных способов совместного использования Mac и iPhone.
//    Переключаться с одного «яблочного» устройства на другое очень просто благодаря набору функций под названием «Непрерывность» (Continuity). В этот набор входит функция «Универсальный буфер обмена», позволяющая обмениваться содержимым буфера обмена между Mac и iPhone. Прежде чем скопировать текст или изображение на одном устройстве и вставить на другом, убедитесь, что на обоих гаджетах:
//
//    Вы авторизованы в одной и той же учетной записи iCloud;
//    Включена передача данных по Bluetooth;
//    Включена функция Handoff. Для этого на Mac нужно зайти в «Системные настройки» → «Основные» и активировать опцию «Разрешить Handoff между этим Mac и вашими устройствами iCloud». На iOS-устройствах функция Handoff находится в разделе «Основные» приложения «Настройки».
//    Проделав все вышеперечисленное, вы сможете без труда копировать контент (текст, фото и т.д.) на Mac и вставлять на iPhone и наоборот.
//    """
//]
//
//var news: [News] = [
//    News(newsID: 1, authorID: "СтивДжобс", title: "Заголовок-1", newsText: newsTextString[0],
//         img: UIImage(named: "news1"), likes: LikeControl()),
//    News(newsID: 2, authorID: "ДжонатанАйв", title: "Заголовок-2", newsText: newsTextString[1],
//         img: UIImage(named: "news2"), likes: LikeControl()),
//    News(newsID: 3, authorID: "ТимКук", title: "Заголовок-3", newsText: newsTextString[2],
//         img: UIImage(named: "news3"), likes: LikeControl()),
//]
//
//class NewsViewController: UIViewController {
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//}
//
//extension NewsViewController: UITableViewDelegate {
//    
//}
//
//extension NewsViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return news.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell else { fatalError() }
//        
//        let friendID: String = news[indexPath.row].authorID
//        
//        cell.userNameLabel.text = friends[friendID]!.name + " " + friends[friendID]!.surname
//        cell.avatar.image = friends[friendID]?.photo
//        cell.titleLabel.text = news[indexPath.row].title
//        cell.newsText.text = news[indexPath.row].newsText
//        cell.publishTimeLabel.text = news[indexPath.row].publishTime
//        cell.imgView.image = news[indexPath.row].img
//        
//        return cell
//    }
//    
//    
//}
