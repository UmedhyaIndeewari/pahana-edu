# 🧪 Regression Testing Checklist for v1.0.0

**Target Branch:** `regression`  
**Merge Source:** `staging`  
**Date:** 2025-08-02
**Tester:** Miss Umedhya Indeewari

---

## 🔍 General Goals

- Ensure no existing functionality is broken
- Validate system-wide behavior
- Confirm stable, release-ready build
- Final testing before `main` merge and tagging

---

## ✅ Full System Regression Test

| Module              | Test Case Description                   | Status          |
|---------------------|-----------------------------------------|-----------------|
| Login               | Valid & invalid login flow              | ☐ Pass / ☐ Fail |
| Logout              | Logout clears session properly          | ☐ Pass / ☐ Fail |
| Customer Management | Full CRUD + UI feedback                 | ☐ Pass / ☐ Fail |
| Item Management     | Full CRUD + price and category handling | ☐ Pass / ☐ Fail |
| Billing Module      | Create multiple bills with mixed items  | ☐ Pass / ☐ Fail |
| Billing Module      | Calculate correct totals                | ☐ Pass / ☐ Fail |
| Help Page           | Loads with instructions for each module | ☐ Pass / ☐ Fail |
| Navigation          | Links work across dashboard and sidebar | ☐ Pass / ☐ Fail |
| UI Theme            | Dark theme applied globally             | ☐ Pass / ☐ Fail |

---

## 🧪 JUnit Testing

| Task                                          | Status          |
|-----------------------------------------------|-----------------|
| All unit tests pass (`mvn test`)              | ☐ Pass / ☐ Fail |
| No skipped or ignored test cases              | ☐ Pass / ☐ Fail |
| Test logs clean (no unexpected output/errors) | ☐ Pass / ☐ Fail |

---

## 🛡 Security & Routing

| Test Case                                            | Status          |
|------------------------------------------------------|-----------------|
| Protected views are not accessible without login     | ☐ Pass / ☐ Fail |
| URLs under `WEB-INF/views` cannot be opened directly | ☐ Pass / ☐ Fail |
| Session expiration handled gracefully                | ☐ Pass / ☐ Fail |

---

## 🧼 Release Readiness

| Task                                         | Status      |
|----------------------------------------------|-------------|
| `pom.xml` version is `1.0.0`                 | ☐ Confirmed |
| `CHANGELOG.md` matches implemented modules   | ☐ Confirmed |
| UI content free of typos or placeholder text | ☐ Confirmed |
| Application is stable on final deploy test   | ☐ Confirmed |

---

## 🗒 Notes

- _[List issues, bugs, or concerns]_

---

### 🚀 Ready to Merge into `main`: ☐ Yes / ☐ No
62 changes: 62 additions & 0 deletions62  
docs/taging-test-checklist.md
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,62 @@
# ✅ Staging Testing Checklist for v1.0.0

**Target Branch:** `staging`  
**Merge Source:** `dev`  
**Date:** 2025-07-31  
**Tester:** Mr. Deepana Welivitage

---

## 🔍 General Goals

- Verify new features from `dev` branch work as expected
- Validate UI flow and interaction
- Confirm JUnit test suite runs without errors
- Review CHANGELOG and versioning

---

## 📋 Feature Testing

| Module              | Test Case Description                                 | Status          |
|---------------------|-------------------------------------------------------|-----------------|
| Authentication      | Login with valid/invalid credentials                  | ☐ Pass / ☐ Fail |
| Logout              | Logout clears session and redirects to login          | ☐ Pass / ☐ Fail |
| Dashboard           | Links to all modules are visible and functional       | ☐ Pass / ☐ Fail |
| Customer Management | Add, edit, delete, list customers                     | ☐ Pass / ☐ Fail |
| Item Management     | Add, edit, delete, list items with styled UI          | ☐ Pass / ☐ Fail |
| Billing Module      | Create bill with multiple items, quantity, total calc | ☐ Pass / ☐ Fail |
| Billing Module      | View bill details correctly                           | ☐ Pass / ☐ Fail |
| Help Page           | Opens help.jsp from dashboard and shows guide         | ☐ Pass / ☐ Fail |

---

## 🧪 JUnit Testing

| Task                                            | Status          |
|-------------------------------------------------|-----------------|
| `mvn clean test` runs successfully              | ☐ Pass / ☐ Fail |
| DAO layer tests (Customer, Item) pass           | ☐ Pass / ☐ Fail |
| Service layer tests (Customer, Item, Auth) pass | ☐ Pass / ☐ Fail |
| Test setup and teardown logic verified          | ☐ Pass / ☐ Fail |

---

## 🛠 Technical Checks

| Task                                       | Status      |
|--------------------------------------------|-------------|
| `pom.xml` version set to `1.0.0`           | ☐ Confirmed |
| `CHANGELOG.md` entry for v1.0.0 is present | ☐ Confirmed |
| App builds and runs without crash          | ☐ Confirmed |
| No debugging code or console logs remain   | ☐ Confirmed |

---

## 🗒 Notes

- _[Any issues found or additional notes]_

---

### ✅ Ready to Merge into `regression`: ☐ Yes / ☐ No