# Instagram Thrift Creator Store

![ER Diagram](./diagram-export-4-27-2026-10_14_54-PM.png)

## What is this?

This is a database design for an **Instagram Thrift Creator Store** where creator can manage customer, sell products, and track orders.

**7 Tables:**
1. customers - customers who buy product
2. categories - thrift and handmade product
3. products - in this table all product details
4. orders - who buy whcih items
5. order_items - itmes selected buy customers
6. payments - then customer make payment 
7. shipments - billing and delivery date

**How they connect:**
- Customer select a item
- then order bill create
- then order go for payement process
- then customer paid the payment 
- then shipment starts
- tracker id send to customer

---

Created for: Instagram Thrift Creator Store