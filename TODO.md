# RKU Placement Portal — Git Push Fix (HTTP 408)

## Goal
Push the repository to GitHub successfully while keeping the `ABOUT-VIDEO.mp4` video in the repo (via Git LFS). The 141 MB blob must be purged because GitHub rejects files >100 MB even in history.

## Steps
- [x] 1. Create safety backup branch
- [x] 2. Install `git-filter-repo` (via pip)
- [x] 3. Purge `assets/images/ABOUT-VIDEO.mp4` from git history (removes 141 MB + 98 MB versions)
- [ ] 4. Re-add `origin` remote (filter-repo removes it)
- [ ] 5. Configure Git LFS for `*.mp4` and re-add the video pointer
- [ ] 6. Set `http.postBuffer` (500 MB) for large pushes
- [ ] 7. Commit LFS changes
- [ ] 8. Force-push to `origin/main`
- [ ] 9. Verify on GitHub (`git ls-remote origin`)
- [ ] 10. Confirm size reduction (`git count-objects -vH`)

