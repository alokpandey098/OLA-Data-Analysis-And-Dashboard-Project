CREATE DATABASE Ola;
USE Ola;
SELECT * FROM bookings;

# 1. Retrieve all successful bookings:
CREATE VIEW successful_bookings AS
SELECT * FROM bookings 
WHERE Booking_Status = 'Success';

SELECT * FROM successful_bookings;

# 2. Find the average ride distance for each vehicle type:
CREATE VIEW average_ride_distance_for_each_vehicle AS
SELECT Vehicle_Type ,AVG(Ride_Distance)
AS avg_distance FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM average_ride_distance_for_each_vehicle;

# 3. Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(Canceled_Rides_by_Customer)
AS Total_Ride_canceled_By_Customer
FROM bookings;

SELECT * FROM cancelled_rides_by_customers;
# 2ND Method
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

# 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_customers AS
SELECT Customer_ID ,COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID 
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM top_5_customers;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW rides_cancelled_by_drivers AS
SELECT COUNT(*) FROM bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
SELECT * FROM rides_cancelled_by_drivers;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW maximum_and_minimum_driver_ratings AS
SELECT MAX(Driver_Ratings) as max_rating ,MIN(Driver_Ratings) as min_ratings
FROM bookings 
WHERE Vehicle_Type = 'Prime Sedan';
SELECT * FROM maximum_and_minimum_driver_ratings;

# 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW rides_with_upi AS
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';
SELECT * FROM rides_with_upi;

# 8. Find the average customer rating per vehicle type:
CREATE VIEW average_customer_rating AS
SELECT Vehicle_Type ,AVG(Customer_Rating) 
FROM bookings
GROUP BY Vehicle_type;
SELECT * FROM average_customer_rating;

# 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_booking_value AS
SELECT SUM(Booking_Value) FROM bookings
WHERE Booking_Status = 'Success';
SELECT * FROM total_booking_value;

# 10. List all incomplete rides along with the reason:
CREATE VIEW incomplete_rides_with_reason AS
SELECT * FROM bookings
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM incomplete_rides_with_reason;
