Crownfield Eye Hospital Database

Student: Mohammed Batahi
Student ID: G1419280  
Module: CPU4:103 Introduction to Database

How to Run
Run the files in this order in MySQL Workbench:

1. 01_schema.sql - Creates database and tables
2. 02_individual_queries.sql - Runs queries 1-4
3. 03_procedure_and_trigger.sql - Creates procedure and trigger
4. 04_security.sql - Sets up roles and security

Files
- `01_schema.sql - Database schema and sample data
- `02_individual_queries.sql` - Queries 1-4 (aggregate, joins, subquery)
- `03_procedure_and_trigger.sql` - Queries 5-6 (procedure, trigger)
- `04_security.sql` - Roles and data protection
- `05_ERD.png` - Entity-Relationship Diagram

Assumptions
- Each appointment has one patient, one clinician, one clinic.
- Follow-up plan is optional.
- Clinicians have one primary specialty.

References
- Connolly, T. & Begg, C. (2015) Database Systems. 6th ed. Pearson.
- MySQL (2024) MySQL 8.0 Reference Manual.
