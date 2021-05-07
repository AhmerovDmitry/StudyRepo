//
//  UnitTestingExampleTests.swift
//  UnitTestingExampleTests
//
//  Created by Дмитрий Ахмеров on 06.05.2021.
//

import XCTest
@testable import UnitTestingExample

class UnitTestingExampleTests: XCTestCase {
    var sut: ViewController! //Объект который покрывается тестами (sut)
    
    override func setUp() {
        super.setUp()
        // Грузим и объявляем объекты
        sut = ViewController()
    }
    
    override func tearDown() {
        // Выгружаем объекты из памяти
        sut = nil
        super.tearDown()
    }
    
    func testLowestVolumeShouldBe0() {
        // given - что дано
        sut.setVolume(with: -1)
        
        // when - что произошло
        let volume = sut.volume
        
        // then - что должно получиться
        XCTAssert(volume == 0, "Lowest volume should be equal 0")
    }
    
    func testHighestVolumeShouldBe100() {
        // given - что дано
        sut.setVolume(with: 120)
        
        // when - что произошло
        let volume = sut.volume
        
        // then - что должно получиться
        XCTAssert(volume == 100, "Highest volume should be equal 100")
    }
    
    func testNumberOneMustBeGreaterThanNumberTwo() {
        // given
        let numberOne = 1
        let numberTwo = 0
        
        // when
        let result = sut.greaterThenValue(x: numberOne, y: numberTwo)
        
        // then
        XCTAssert(result, "The number one must be greater than number two")
    }
    
    func testNumberOneMustNotBeGreaterThanNumberTwo() {
        // given
        let numberOne = 1
        let numberTwo = 1
        
        // when
        let result = sut.greaterThenValue(x: numberOne, y: numberTwo)
        
        // then
        XCTAssert(!result, "The number one must be greater than number two")
    }
    
    func testIsDivisibleByThree() {
        let result = sut.isDivisibleByThree(number: 3)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByThree() {
        let result = sut.isDivisibleByThree(number: 1)
        XCTAssertEqual(result, false)
    }
}
