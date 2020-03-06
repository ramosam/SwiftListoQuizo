//
//  QuestionSet.swift
//  SwiftoListoQuizo
//
//  Created by Arcaurel on 3/1/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import Foundation

public class QuestionSet {
    
    let CATS = "Cats"
    let DOGS = "Dogs"
    let PLANTS = "Plants"
    let GHOSTS = "Ghosts"
    
    var questions = [Question]()
    var questionsIndex = 0
    var theme = ""
    
    init(qTheme: String) {
        switch qTheme {
        case CATS:
            questions = createCatQuestions()
            theme = CATS
        case DOGS:
            questions = createDogQuestions()
            theme = DOGS
        case PLANTS:
            questions = createPlantQuestions()
            theme = PLANTS
        case GHOSTS:
            questions = createGhostQuestions()
            theme = GHOSTS
        default:
            questions = createDogQuestions()
            theme = DOGS
        }
    
    }
    

    func moveBackQuestion() {
        questionsIndex -= 1
        if questionsIndex < 0 {
            questionsIndex = questions.count - 1
        }
    }

    func moveForwardQuestion() {
        questionsIndex += 1
        if questionsIndex >= questions.count {
            questionsIndex = 0
        }
    }

    func flipQuestionAnswer() {
        questions[questionsIndex].flipQuestionAnswer()
    }
    
}

// MARK:- Create Data Functions

func createCatQuestions() -> [Question] {
    var questions = [Question]()
    let q0 = Question(question: "How far can cats rotate their ears?", answer: "Cats can rotate their ears 180 degrees.")
    let q1 = Question(question: "A group of kittens is called a ...?", answer: "Kindle, a word that’s used to describe a group of kittens " +
    "born to one mama cat. Meanwhile, a group of full-grown cats is called " +
    "a clowder. ")
    let q2 = Question(question: "Black cats are considered lucky in at least which two countries?", answer: "In Great Britain and Japan, they’re perceived as auspicious. " +
    "In the English Midlands, new brides are given black cats to bless their " +
    "marriage, and the Japanese believe that black cats are good luck.")
    let q3 = Question(question: "What is the technical term for hairball?", answer: "Bezoar.")
    
    questions.append(q0)
    questions.append(q1)
    questions.append(q2)
    questions.append(q3)
    
    return questions
    
}

func createDogQuestions() -> [Question] {
    var questions = [Question]()
    let q0 = Question(question: "Which two dog breeds have been known to go into war with their human handlers during the Middle Ages?", answer: "During the Middle Ages, Great Danes and Mastiffs were sometimes " +
    "suited with armor and spiked collars to enter a battle or to defend supply caravans.")
    let q1 = Question(question: "Why were Dachshunds bred?", answer: "Dachshunds were bred to fight badgers in their dens.")
    let q2 = Question(question: "What color are Dalmations when they're born?", answer: "Dalmatians are completely white at birth.")
    let q3 = Question(question: "How well can a dog really smell?", answer: "Dogs can smell about 1,000-10,000 times better than humans. While" +
    " humans have 5 million smell-detecting cells, dogs have more than 220 million." +
    " The part of the brain that interprets smell is also four times larger in dogs " +
    "than in humans.")
    
    questions.append(q0)
    questions.append(q1)
    questions.append(q2)
    questions.append(q3)
    
    return questions
}

func createPlantQuestions() -> [Question] {
    var questions = [Question]()
    let q0 = Question(question: "What are some differences between True and False Dandelions?", answer: "Cat's Ear and Carolina False Dandelion have leafless solid, " +
    "branching green stems with several blossoms. True dandelions have" +
    " leafless hollow usually beige-colored stems, and produce only one" +
    " blossom per flowering stem. Carolina False Dandelion has a leafy stem," +
    " and is also called Leafy Stem Dandelion.")
    let q1 = Question(question: "Do luffa (loofah) sponges grow in the ocean?", answer: "Luffa (loofah) sponges don't come from the ocean." +
    " A luffa sponge is the ripened fruit of a plant in the gourd / cucumber family.")
    let q2 = Question(question: "What is mycorrhizae and why is it important?", answer: "Mycorrhizal fungi allow plants to draw more nutrients and water " +
    "from the soil. They also increase plant tolerance to different " +
    "environmental stresses. Moreover, these fungi play a major role in soil" +
    " aggregation process and stimulate microbial activity.")
    let q3 = Question(question: "How long does it take for a lemon to ripen?", answer: "They gradually mature and gain sweetness; in fact, the fruit may " +
    "take as long as nine months to ripen. Once the fruit is mature, it can be" +
    " left on the tree for a few weeks, but it does not ripen more. So first off, " +
    "the lemons may not be turning yellow because they have not been ripening on the" +
    " tree long enough.")
    
    questions.append(q0)
    questions.append(q1)
    questions.append(q2)
    questions.append(q3)
    
    return questions
}

func createGhostQuestions() -> [Question] {
    var questions = [Question]()
    let q0 = Question(question: "What percentage of Americans believe in the presence of ghosts?", answer: "Around half of the American population, in survey after survey, " +
    "say they believe in ghosts and hauntings. ")
    let q1 = Question(question: "Why are ghosts traditionally depicted in a white sheet?", answer: "Depicting ghosts in a white sheet may have come from the burial " +
    "cloth placed around a dead body showing only the face. This stereotype image " +
    "was exploited by hoaxers and Hollywood and used in iconic representations, " +
    "making it widely known. ")
    let q2 = Question(question: "What is a banshee?", answer: "A banshee is a female spirit in Irish mythology who heralds the death of a " +
    "family member, usually by wailing, shrieking, or keening.")
    let q3 = Question(question: "What are some indicators that your house is haunted?", answer: "Indicators:\n" +
    "\n" +
    "Things being moved or missing\n" +
    "\n" +
    "Sounds of walking, knocking, banging, whistles, snapping, glass breaking, furniture being moved. (Rarely any evidence)\n" +
    "\n" +
    "Doors and or windows opening or closing\n" +
    "\n" +
    "Lights or appliances turning on or off\n" +
    "\n" +
    "Black shadows that are seen quickly with your peripheral vision\n" +
    "\n" +
    "Mists, smoke, orbs or apparitions\n" +
    "\n" +
    "Whispers or voices, unexplained music")
    
    questions.append(q0)
    questions.append(q1)
    questions.append(q2)
    questions.append(q3)
    
    return questions
}

