//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Vincent on 22/02/2018.
//  Copyright © 2018 Native App Studio. All rights reserved.
//

import Foundation

// Struct that holds a question
struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

// The response type enumerator
enum ResponseType {
    case single, multiple, ranged
}

// Struct that holds the answer and the personality type
// it corresponds to
struct Answer {
    var text: String
    var type: PersonType
}

enum PersonType: String {
    case emma = "Emma", viaNerd = "VIA-nerd", verlegenNerd = "verlegen nerd", hippie = "hipstertje"
    
    var definition: String {
        switch self {
        case .emma:
            return "Jij bent de Emma! Niet getreurd, dit is ongetwijfeld de beste uitslag die je had kunnen krijgen. De Emma weet wat zij/hij wil, de uitvoer laat alleen soms nog wat te wensen over. Je doet misschien een jaartje extra over je studie, maar je geniet ten top en, ondanks dat je woke af bent, ben je niet pretentieus en voel je jezelf niet de ultieme wereldverbeteraar. Chapeau!"
            
        case .viaNerd:
            return "Jij bent een coole VIA-nert! Je hebt al dagen geen buitenlucht geproefd, deels omdat ook de bewaking van Science Park je heeft opgegeven om je elke avond dat hok uit te tyfen. Al je (vrije?) tijd spendeer je in dat kleine hok, een beetje te chillen en programmaatjes in elkaar aan het flansen. Maar zo bespaar je op de huur en haal je je studie wel!"
            
        case .verlegenNerd:
            return "Jij bent de verlegen nerd! Je bent aardig, slim en doet gewoon wat van je gevraagd wordt. Stiekem heb je zelf Google, Nest, Facebook, SURF of Foxconn opgestart, maar dat weet niemand. Jij houdt je gewoon lekker overal buiten en codet er gewoon op los. Wat maakt het nou uit dat je bij je ouders woont? Je moeder kan gewoon lekker koken."
        case .hippie:
            return "Jij bent de hippe FPS/BG figuur! Jij wereldverbeteraar! Er is nu een 99.99% kans dat jij de major KI doet, in plaats van de bachelor. Dat maakt jou woke af over de staat van onze wereld, en KI is voor al onze problemen de oplossing. Helaas dacht je dat het wat minder programmeren en wat meer filosoferen zou zijn. Baal jij ff van die vakken als Datastructuren en Computersystemen. Gelukkig verkoopt nu zelfs de kantine op Science Park superfoods, dat maakt jouw leven op deze verre campus meteen een stuk minder kut."
        }
    }
}


