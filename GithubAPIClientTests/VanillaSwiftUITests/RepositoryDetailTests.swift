import XCTest
import SwiftUI
@testable import VanillaSwiftUI
@testable import Core

@MainActor
final class RepositoryDetailTests: XCTestCase {
    func testRepositoryDetailView_InitialState() {
        // Given
        let testRepo = Repository(
            id: 1,
            name: "Test Repo",
            owner: Owner(login: "testUser", avatarURL: "https://test.com/avatar.jpg"),
            description: "Test Description",
            language: "Swift",
            numberOfStars: 100,
            numberOfForks: 50,
            isStarred: false
        )

        let binding = Binding(
            get: { testRepo },
            set: { _ in }
        )

        // When
        let view = RepositoryDetail(repo: binding)

        // Then
        XCTAssertEqual(view.repo.name, "Test Repo")
        XCTAssertEqual(view.repo.description, "Test Description")
        XCTAssertEqual(view.repo.language, "Swift")
        XCTAssertEqual(view.repo.numberOfStars, 100)
        XCTAssertEqual(view.repo.numberOfForks, 50)
        XCTAssertFalse(view.repo.isStarred)
    }

    func testRepositoryDetailView_StarButtonToggle() {
        // Given
        var testRepo = Repository(
            id: 1,
            name: "Test Repo",
            owner: Owner(login: "testUser", avatarURL: "https://test.com/avatar.jpg"),
            description: "Test Description",
            language: "Swift",
            numberOfStars: 100,
            numberOfForks: 50,
            isStarred: false
        )

        let binding = Binding(
            get: { testRepo },
            set: { testRepo = $0 }
        )

        let view = RepositoryDetail(repo: binding)

        // When
        view.repo.isStarred.toggle()

        // Then
        XCTAssertTrue(testRepo.isStarred)

        // When toggled again
        view.repo.isStarred.toggle()

        // Then
        XCTAssertFalse(testRepo.isStarred)
    }
}