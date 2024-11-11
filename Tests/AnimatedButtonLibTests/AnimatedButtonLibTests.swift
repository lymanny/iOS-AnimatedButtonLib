import XCTest
@testable import AnimatedButtonLib

final class AnimatedButtonLibTests: XCTestCase {
    
    // Instances for testing
    var testButton: UIButton!
    var testView: UIView!
    
    override func setUp() {
        super.setUp()
        // Initialize UIButton and UIView before each test
        testButton = UIButton()
        testView = UIView()
    }
    
    override func tearDown() {
        // Clean up after each test
        testButton = nil
        testView = nil
        super.tearDown()
    }
    
    // MARK: - UIButton Animation Tests
    
    func testPulsate() {
        let expectation = XCTestExpectation(description: "Pulsate animation completed")
        testButton.pulsate {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFlash() {
        let expectation = XCTestExpectation(description: "Flash animation completed")
        testButton.flash {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testShake() {
        let expectation = XCTestExpectation(description: "Shake animation completed")
        testButton.shake {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testPress() {
        let expectation = XCTestExpectation(description: "Press animation completed")
        testButton.press {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    // MARK: - UIView Animation Tests
    
    func testZoomIn() {
        let expectation = XCTestExpectation(description: "Zoom in animation completed")
        testView.zoomIn {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testZoomOut() {
        let expectation = XCTestExpectation(description: "Zoom out animation completed")
        testView.zoomOut {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testZoomInWithEasing() {
        let expectation = XCTestExpectation(description: "Zoom in with easing animation completed")
        testView.zoomInWithEasing {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testZoomOutWithEasing() {
        let expectation = XCTestExpectation(description: "Zoom out with easing animation completed")
        testView.zoomOutWithEasing {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testBounce() {
        let expectation = XCTestExpectation(description: "Bounce animation completed")
        testView.bounce {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFadeIn() {
        let expectation = XCTestExpectation(description: "Fade in animation completed")
        testView.fadeIn {
            XCTAssertEqual(self.testView.alpha, 1)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFadeOut() {
        let expectation = XCTestExpectation(description: "Fade out animation completed")
        testView.fadeOut {
            XCTAssertEqual(self.testView.alpha, 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
