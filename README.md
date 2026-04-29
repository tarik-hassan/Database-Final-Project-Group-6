# Database-Final-Project-Group-6

A SQL-based gradebook database that allows a professor to track student grades
across multiple courses. The database stores course information, grade category
weights based off the syllabus, individual student scores, and calculates weighted
grades automatically.

---

## Team Members
- Jack Strauss
- Antonio Fiorentino Wong
- Tarik Hassan

---

## Course Information
- Principles of Database Systems (CSC_4480_101)
- Prof. Gregory Safko
- Spring 2026

---

## Prerequisites
- some form of Oracle Database compiler such as SQL Developer or OneCompiler

---

## How to Execute

### Option 1 — Oracle SQL Developer (Recommended)
1. Open SQL Developer and connect to your Oracle schema
2. Open file in application
3. Press **F5** (Run Script) to execute the full file
4. Results appear in the Script Output panel

### Option 2 — OneCompiler
1. Open sql file in VsCode, copy, and paste into OneCompiler
2. Run

---

## Important Note on First Run
Since the script starts with "DROP TABLE ... CASCADE CONSTRAINTS" statements;
On the very first run these will produce errors since the tables don't exist
yet. Everything will be created successfully, so running it again will result in the drops succeeding.

---

## What the Script Does
1. Creates and populates "STUDENTS" — 7 students with unique IDs (can insert more if desired)
2. Creates and populates "COURSES" — 3 CSC courses for Spring 2026 (can insert more courses as well)
3. Creates and populates "SYLLABUS" — grade weights per course (all sum to 100%)
4. Verifies weights — SELECT/SUM queries confirming each course totals 100%
5. Creates and populates "GRADEBOOK" — individual student scores
6. Calculates weighted scores — "weighted_score = (assignment_weight / 100) * score"
7. Queries final grades — SUM of weighted scores per student
8. Demonstrates an UPDATE — adds a new grade category to a student and corrects Joe Smith's Project score and recalculates
