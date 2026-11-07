# Roadmap

Pandoo is a local-first todo app with no accounts, no sync and no telemetry.
The v3 line makes that promise explicit, trustworthy and easy to contribute to.
Each milestone is a GitHub milestone with linked issues.

## v3.0 - Open source launch

Ship Pandoo as a genuinely MIT, free, privacy-first app that people can
inspect, run, fork and contribute to.

- MIT license, licensed assets, SPDX and REUSE compliance.
- README, ARCHITECTURE, CONTRIBUTING, SECURITY, CODE_OF_CONDUCT and templates
  that match the real tree.
- An in-app About screen with version, licenses and source.
- Signed release artifacts from CI, an iOS privacy manifest and no debug-signed
  release builds.

## v3.1 - Trust and data safety

Make data loss unlikely and recoverable.

- Schema versioning and a migration framework; stable list IDs.
- Explicit storage results instead of rethrowing into the UI.
- Quarantine unreadable records instead of failing startup.
- Undo for deletes and clean-completed; archive instead of delete.
- JSON backup export and validated import; CSV per list.
- Complete translations and l10n gates; accessibility and reduce-motion fixes.
- More tests, goldens and CI gates.

## v3.2 - Polish and UX

- First-run onboarding and a sample list.
- Empty states for home, empty list and no search results.
- Animated add, complete and delete; Hero transition into a list.
- Per-list progress, haptics, accent themes.
- A searchable settings sheet and landscape/tablet layouts.

## v3.3 - Reminders

- Due dates on items.
- Local notifications and platform-limit handling.
- Recurring tasks.
- Today and Upcoming views.

## v3.4 - Power features

- Priority levels, tags and tag filters.
- Subtasks, notes, item editing and manual reordering.
- Global search and quick add.
- Home-screen widgets and OS integration.
- ICS export and completion history.
- Custom list icons and colors.
- A `pandoo://` URL scheme as the single navigation entry point.

## Explicitly out of scope

These will not be added, including through pull requests:

- Accounts, sign-in or user profiles.
- Hosted sync or any server-side storage.
- Analytics, telemetry, crash reporting or advertising SDKs.
- Any feature that requires the app to talk to the network.

A fork may add them; the official app will not.

## How work is chosen

1. Data-safety and launch blockers first.
2. Then the milestone order above.
3. Within a milestone: `p1`, then `p2`, then unlabelled (treated as `p2`),
   then `p3`.
4. Dependencies are respected: licensing and release plumbing before features;
   schema migration and stable IDs before due dates, archive, tags or stats.

## Labels

Type:

| Label | Meaning |
|---|---|
| `bug` | Something is broken |
| `enhancement` | New feature or improvement |
| `refactor` | Internal restructuring, no behavior change |
| `docs` | Documentation and repo copy |
| `tests` | Test coverage |
| `ci` | Continuous integration and automation |
| `release` | Packaging, versioning and distribution |
| `legal` | Licensing, attribution and compliance |
| `security` | Privacy and security |
| `data-safety` | Backups, recoverability, migrations |
| `performance` | Speed, jank and memory |
| `epic` | Tracking issue for a group of work |
| `dependencies` | Package or action updates |
| `github_actions` | Automated Actions updates |

Area and audience:

| Label | Meaning |
|---|---|
| `accessibility` | Screen readers, tap targets, motion, contrast |
| `ux` | Interaction design |
| `i18n` | Translation and locale handling |
| `android`, `ios` | Platform specific |
| `good first issue` | Scoped and safe for a new contributor |
| `help wanted` | Maintainer would welcome outside help |

Priority: `p0` (critical, blocks launch or risks data loss), `p1` (high),
`p2` (medium, the default for unlabelled issues), `p3` (low).

## Triage rules

- Every new issue starts unlabelled. A maintainer adds `needs-triage`, then a
  type, an area and a priority, and either a milestone or a `blocked` note.
- Accepted means the issue has a milestone and a clear acceptance list.
- Claim an issue by commenting on it. One contributor per issue at a time.
- Duplicates are closed with a link to the issue that carries the work.
- Security reports never go in a public issue; see `SECURITY.md`.
- Stale policy: an issue with no activity for 180 days and no milestone is
  closed as stale, with a note that it can be reopened.
