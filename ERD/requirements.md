# ER Diagram for bnb clone

## Task 0

### Entities

- User
- Property
- Booking
- Payment
- Review
- Message

### Attribues

- User(user_Id, first_name,last_name,email,password_hash, phone_number, role, created_at)
- Property(property_Id,host_Id,name,description,location,pricepernight,created_at, updated_at)
- Booking(booking_Id,property_Id,user_Id,start_date,end_date,total_price,status,created_at)
- Payment(payment_Id,booking_Id,amount,payment_date,payment_method)
- Review(review_Id,property_Id,user_Id,rating,comment, created_at)
- Message(message_Id,sender_Id,recipient_Id,message_body,sent_at)

### Relationship

- User to Property (1:many)
- User to Booking (1:many)
- User to Payment (1:many)
- User to Review (1:many)
- User to Message (1:many)

- Property to Booking (1 to many)
- Property to Payment (1 to many)
- Property to Review (1 to many)

- Booking to Payment (1 to 1)

### Entity Relationship Diagram

- https://drive.google.com/file/d/1qZ_4bPAnlHUHJ_7iTAyi4_Z2DKPvsVvs/view?usp=sharing
