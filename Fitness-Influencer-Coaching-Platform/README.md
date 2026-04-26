# Fitness Coaching Platform - Database Design

![ER Diagram](./diagram-export-4-26-2026-3_45_12-AM.png)

## What is this?

This is a database design for an **online fitness coaching platform** where trainers can manage clients, sell programs, and track progress.

**8 Tables:**
1. trainers - The coaches
2. clients - The customers
3. programs - Fitness plans trainers sell
4. subscriptions - Who bought which program
5. sessions - Video calls/meetings
6. check_ins - Weekly progress updates
7. trainer_notes - Trainer feedback on check-ins
8. payments - Payment records

**How they connect:**
- Trainers create programs
- Clients buy programs (becomes a subscription)
- Subscriptions include sessions
- Clients submit check-ins
- Trainers give feedback on check-ins
- Payments track money flow

---

Created for: Fitness Coaching Platform Database Assignment