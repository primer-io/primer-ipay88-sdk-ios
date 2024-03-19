import Danger
import Foundation

let danger = Danger()
let pr = danger.github.pullRequest
let isReleasePr = pr.head.ref.hasPrefix("release")

func isConventionalCommitTitle() -> Bool {
    // Commitizen-compatible conventional commit titles
    pr.title.hasPrefix("BREAKING CHANGE:") ||
    pr.title.hasPrefix("chore:") ||
    pr.title.hasPrefix("fix:") ||
    pr.title.hasPrefix("feat:")
}

// MARK: - Conventional Commit Title
let validPrefixes = ["fix", "feat", "chore", "ci", "refactor", "docs",
                     "perf", "test", "build", "revert", "style", "BREAKING CHANGE"]
let isConventionalCommitTitle = validPrefixes.contains { pr.title.hasPrefix($0) }

if !pr.head.ref.hasPrefix("release") && !isConventionalCommitTitle {
    fail("Please use a conventional commit title for this PR. See [Conventional Commits and SemVer](https://www.notion.so/primerio/Automating-Version-Bumping-and-Changelog-Creation-c13e32fea11447069dea76f966f4b0fb?pvs=4#c55764aa2f2748eb988d581a456e61e7)")
}
