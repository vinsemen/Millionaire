//
//  Questions.swift
//  Millionaire
//
//  Created by Семён Винников on 18.02.2023.
//

import Foundation


class QuestionData {
    
    class func loadQuestions() -> [Question] {
        return [
        Question(text: "Что такое анклав?",
                 variants: [Answer.A: Variant(text: "Часть территории государства, полностью окружённая территорией другого государства", isRight: true),
                            Answer.B: Variant(text: "Государство, не имеющeе выхода к морю", isRight: false),
                            Answer.C: Variant(text: "Вид острова", isRight: false),
                            Answer.D: Variant(text: "Название вулкана", isRight: false)]),
        Question(text: "Какими государствами окружён Лихтенштейн?",
                 variants: [Answer.A: Variant(text: "Германией и Италией", isRight: false),
                            Answer.B: Variant(text: "Австрией и Швейцарией", isRight: true),
                            Answer.C: Variant(text: "Словенией и Францией", isRight: false),
                            Answer.D: Variant(text: "Канадой и США", isRight: false)]),
        Question(text: "Что такое муссоны?",
                 variants: [Answer.A: Variant(text: "Тропические дожди", isRight: false),
                            Answer.B: Variant(text: "Ветра, идущие из тропиков к экватору", isRight: true),
                            Answer.C: Variant(text: "Завихрения ветра над океаном", isRight: false),
                            Answer.D: Variant(text: "Смерч в Мексике", isRight: false)]),
        Question(text: "В какой стране находится самый высокий водопад мира, высота непрерывного падения воды которого составляет 807 метров?",
                 variants: [Answer.A: Variant(text: "На границы Замбии и Зимбабве", isRight: false),
                            Answer.B: Variant(text: "В Венесуэле", isRight: true),
                            Answer.C: Variant(text: "На границе Америки и Канады", isRight: false),
                            Answer.D: Variant(text: "Конечно, в Китае!", isRight: false)]),
        Question(text: "С каким морем соединяется Чёрное море через пролив Босфор?",
                 variants: [Answer.A: Variant(text: "Фракийское море", isRight: false),
                            Answer.B: Variant(text: "Эгейское море", isRight: false),
                            Answer.C: Variant(text: "Мраморное море", isRight: true),
                            Answer.D: Variant(text: "Аральское море", isRight: false)]),
        Question(text: "В акватории какой реки расположен архипелаг Тысяча островов?",
                 variants: [Answer.A: Variant(text: "Арканзас", isRight: false),
                            Answer.B: Variant(text: "Река Святого Лаврентия", isRight: true),
                            Answer.C: Variant(text: "Рио-Гранде", isRight: false),
                            Answer.D: Variant(text: "Нил", isRight: false)]),
        Question(text: "Что такое Аппалачи?",
                 variants: [Answer.A: Variant(text: "Горная система на востоке Северной Америки, в США и Канаде", isRight: true),
                            Answer.B: Variant(text: "Каньоны в Мексике", isRight: false),
                            Answer.C: Variant(text: "Хребет на западе Перу", isRight: false),
                            Answer.D: Variant(text: "Впадина в Мертвом море", isRight: false)]),
        Question(text: "Что такое Лавразия?",
                 variants: [Answer.A: Variant(text: "Древний континент", isRight: true),
                            Answer.B: Variant(text: "Континент, существование которого ученые только предполагают", isRight: false),
                            Answer.C: Variant(text: "Большой необитаемый остров в Тихом океане", isRight: false),
                            Answer.D: Variant(text: "Племя в Африке", isRight: false)]),
        Question(text: "Мичиган — это ...",
                 variants: [Answer.A: Variant(text: "Озеро в США", isRight: false),
                            Answer.B: Variant(text: "Штат США", isRight: false),
                            Answer.C: Variant(text: "Оба ответа верны", isRight: true),
                            Answer.D: Variant(text: "Нет правильного ответа", isRight: false)]),
        Question(text: "Что такое «фумарольная» активность вулканов?",
                 variants: [Answer.A: Variant(text: "Это когда активный вулкан выпускает в атмосферу водяной пар и другие газы", isRight: true),
                            Answer.B: Variant(text: "Очень слабый выброс жидкой расплавленной массы из кратера вулкана", isRight: false),
                            Answer.C: Variant(text: "Вытекание из вулкана тефры", isRight: false),
                            Answer.D: Variant(text: "Когда лава долгое время не застывает", isRight: false)]),
        Question(text: "'Матерь вод Ганг' или 'Река девяти драконов' — это река ...",
                 variants: [Answer.A: Variant(text: "Янцзы", isRight: false),
                            Answer.B: Variant(text: "Амур", isRight: false),
                            Answer.C: Variant(text: "Меконг", isRight: true),
                            Answer.D: Variant(text: "Амазонка", isRight: false)])
        
        

        
        ]
    }
}
