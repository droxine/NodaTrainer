//
//  QuestionBank.swift
//  NodaTrainer
//
//  Created by sangeles on 5/4/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    
    init() {
        self.list.append(Question(text: "El sonido puede ser determinado e indeterminado", correctAnswer: true))
        self.list.append(Question(text: "El sonido determinado se llama ruido y es el que produce, por ejemplo, la caída de un libro", correctAnswer: false))
        self.list.append(Question(text: "El pentagrama es el conjunto de 6 rectas horizontales, llamadas líneas, que guardan entre sí la misma distancia", correctAnswer: false))
        self.list.append(Question(text: "Espacio es la distancia que se halla entre dos líneas, siendo en total cuatro.", correctAnswer: true))
        self.list.append(Question(text: "Las líneas y espacios se cuentan de abajo hacia arriba, como a continuación:", correctAnswer: true))
        self.list.append(Question(text: "Existen 7 figuras musicales", correctAnswer: true))
        self.list.append(Question(text: "Existen 8 silencios musicales", correctAnswer: false))
        self.list.append(Question(text: "La siguiente nota musical es Do en la clave de Fa (Primera octava):", correctAnswer: false))
        self.list.append(Question(text: "La siguiente imagen muestra la equivalencia de un pentagrama con una tablatura", correctAnswer: true))
        self.list.append(Question(text: "La siguiente imagen señala la nota Mi, tanto en primera como segunda octava ubicadas en un teclado", correctAnswer: false))
    }
}
