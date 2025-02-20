//
//  ProfessorsFetcher.swift
//  MyProfessor
//
//  Created by Leonard on 11/17/24.
//

import Foundation
import SwiftSoup

@MainActor
class ProfessorsFetcher: ObservableObject {
    
    var Professors: [String: Professor] = [:]
    var lastClassCode: (String, String) = ("", "")
    var isClasOrLab: Bool = false
    
    func getAllProfessors(className: String, classCode: String, termCode: String) async {
        do {
            let schoolSchedule = try SwiftSoup.parse(await fetchHTML(from: "https://www.deanza.edu/schedule/listings.html?dept=\(className)&t=\(termCode)")!)
            let professors = try schoolSchedule.select("tr") // Select all <tr> elements
            refineProfessorsSelection(professors: professors, className: "\(className) \(classCode)")
            
            
        } catch {
            print("There's a problem getting professors")
        }
    }
    
    private func refineProfessorsSelection(professors: Elements, className: String) {
        
        var refinedProfessorData : Elements
        var refinedProfessorExtraData : Elements
        
        do {
            let range = findElementsRange(allProfessors: professors, className: className)
            
            if range != (0,0) {
                
                for i in range.0...range.1 {
                    if !isClasOrLab(element: professors[i]) {
                        
                        if try professors[i].text().contains("SPAN 1") {
                            refinedProfessorData = refineProfessorData(professorRawData: professors[i])!
                            let name: String = try refinedProfessorData[7].text()
                            let crn: String = try refinedProfessorData[0].text()
                            let schedule: String = "\(try refinedProfessorData[3].text())/\(try refinedProfessorData[5].text())/\(try refinedProfessorData[6].text())/\(try refinedProfessorData[8].text())"
                            let allSchedules: [String: [String]] = [crn : [schedule]]
                            
                            print("here professor is \(name) and crn \(crn)")
                            if Professors.keys.contains(name) {
                                self.Professors[name]?.allSchedules[crn] = [schedule]
                                lastClassCode = (name, crn)
                            } else {
                                self.Professors[name] = Professor(name: name, allSchedules: allSchedules)
                                lastClassCode = (name, crn)
                            }
                        }
                    } else {
                        refinedProfessorExtraData = refineProfessorData(professorRawData: professors[i])!
                        let extraSchedule = ["\(try refinedProfessorExtraData[0].text())/\(try refinedProfessorExtraData[1].text())/\(try refinedProfessorExtraData[2].text())/\(try refinedProfessorExtraData[4].text())"]
                        if var professor = self.Professors[lastClassCode.0] {
                            professor.allSchedules[lastClassCode.1, default: []].append(contentsOf: extraSchedule)
                            self.Professors[lastClassCode.0] = professor
                        }
                    }
                }
            } else {
                self.Professors = [:]
            }
        } catch {
            print("There was a problem refining the Data.")
        }
    }
    
    func findElementsRange(allProfessors: Elements, className: String) -> (Int, Int) {
        
        do {
            var i: Int = 0
            var result: (Int, Int) = (0,0)
            
            if try allProfessors.text().contains(className){
                
                while try !allProfessors[i].text().contains(className) {
                    i += 1
                }
                
                result.0 = i
                
                var findEnd = false
                
                while !findEnd {
                    let professor = try allProfessors[i].text()
                    if !professor.contains(className) {
                        if professor.contains("LAB") || professor.contains("CLAS") || professor.contains("TBA") {
                            i += 1
                        } else {
                            findEnd = true
                        }
                    } else {
                        i += 1
                    }
                }
                result.1 = i - 1
                return result
            } else {
                return (0,0)
            }
            
        } catch {
            return (0,0)
        }
        
    }
    
    func isClasOrLab(element: Element) -> Bool {
        do {
            let elementData = try element.text()
            
            if elementData.contains("CLAS") || elementData.contains("LAB") {
                return true
            }
        } catch {
            return false
        }
        return false
    }
    
    func refineProfessorData(professorRawData: Element) -> Elements? {
        
        do {
            let professorData = try professorRawData.select("td")// Select all <td> elements
            return professorData
        } catch {
            return nil
        }
    }
}

// ✅ Professor Model
struct Professor {
    var name: String
    var allSchedules: [String: [String]] // classCode: [schedules]
    var numRatings: Int = 0
    var difficulty: Double = 0.0
    var overallRating: Double = 0.0
    var wouldTakeAgain: Double = 0.0
}
