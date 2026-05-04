# LiftGrid Systems - Elevator Control Platform ER Diagram

![ER Diagram](./diagram-export-5-4-2026-1_27_41-PM.png)

## Overview
Multi-building intelligent elevator management system for commercial infrastructure across India. Tracks buildings, shafts, elevators, floors, ride requests, assignments, trip logs, real-time state, performance metrics, and maintenance workflows.

## Core Entity Groups
**Infrastructure**: buildings → shafts → elevators, floors  
**Configuration**: elevator_floor_assignments (M:N relationship)  
**Operations**: floor_requests → ride_assignments → trip_logs  
**Monitoring**: elevator_realtime_state, elevator_daily_metrics  
**Maintenance**: maintenances → maintenance_history

## Key Features
Supports multi-building deployments, dynamic elevator-floor assignments, request tracking from initiation to completion, real-time operational state monitoring, aggregated analytics for performance optimization, and comprehensive maintenance workflow management with historical tracking.