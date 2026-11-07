# ADR 0001: Shared storage and backup package with Fox

- Status: accepted
- Date: 2026-11-07
- Issue: #108
- Cross-repo: teamsuperpanda/fox#150

## Context

Pandoo and Fox both use Hive, both need schema versions, tolerant decoding, a
versioned backup envelope and the same migration rules. Pandoo tracks this in
#48 (hive_ce), #49 (schema migrations), #56 (storage result), #36 (startup),
#42/#44 (export/import); Fox has an almost identical set.

Building the same machinery twice risks drift and duplicated bugs.

## Decision

**Do not extract a shared package yet. Keep the storage layers separate for
v3 and copy the design, not the code.**

The models, serialisers and UI stay in each app in either case, so the shared
surface would be only schema version plus migrations, tolerant decoding, a
result type and an export envelope. In Pandoo those are still being designed:
#56, #48 and #44 are open and may change the shape of the API. Extracting now
would freeze an interface before either app has used it once.

No code is forked from Fox and Fox is not modified; Pandoo keeps its own
implementation.

## Consequences

Cost of not extracting:

- The migration and backup logic is written twice (Pandoo and Fox).
- A fix must be applied in both repositories by hand.
- The two apps can drift in validation and envelope format.

Mitigations:

- The v3 backup envelope is documented in one place (this ADR and the export
  implementation) so a later extraction has a reference.
- The migration contract is explicit in `ARCHITECTURE.md`.
- When both apps have a stable implementation and a real fixture, revisit.

## Revisit trigger

Extract into `panda_store` (path dependency first) when all of these hold:

1. Pandoo #49, #56 and #44 are shipped and unchanged for one release.
2. Fox has the equivalent code merged.
3. A third consumer appears, or a second copy of the migration code causes a
   real bug.

At that point the package contains: schema version plus ordered migrations,
tolerant adapter helpers, a `StorageResult` type and a versioned export
envelope with validation and merge semantics. It contains no widgets, themes,
models, serialisers or undo semantics.

## Alternatives considered

- **Extract now.** Rejected: the API is not stable, and a premature package
  would need breaking changes while both apps are mid-migration.
- **Copy Fox's package into Pandoo.** Rejected: it is not a package, and
  cross-repo copying is harder to maintain than a documented contract.
- **Do nothing and let them drift.** Rejected as a long-term answer; accepted
  only for this milestone with the revisit trigger above.
