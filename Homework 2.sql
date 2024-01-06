-- Customers table
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
    -- Add other relevant fields
);

-- Movies table
CREATE TABLE Movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_date DATE
    -- Add other relevant fields
);

-- Tickets table
CREATE TABLE Tickets (
    ticket_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    movie_id INT REFERENCES Movies(movie_id),
    seat_number VARCHAR(10),
    price DECIMAL(8, 2)
    -- Add other relevant fields
);

-- Concessions table
CREATE TABLE Concessions (
    concession_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    movie_id INT REFERENCES Movies(movie_id),
    item_name VARCHAR(50),
    quantity INT,
    price DECIMAL(8, 2)
    -- Add other relevant fields
);


INSERT INTO Customers (customer_id ,name, email) 
VALUES(5,'John Doe', 'john.doe@example.com'),(6,'Jane Smith', 'jane.smith@example.com');

-- Insert sample data for Movies
INSERT INTO Movies (title, genre, release_date) 
VALUES('Inception', 'Sci-Fi', '2010-07-16'),('The Shawshank Redemption', 'Drama', '1994-09-23');

-- Insert sample data for Tickets
INSERT INTO Tickets (ticket_id,customer_id, movie_id, seat_number, price) 
VALUES(1, 5, 5, 'A1', 12.50),(2, 6, 6, 'A2', 10.00);

-- Insert sample data for Concessions
INSERT INTO Concessions (customer_id, movie_id, item_name, quantity, price) 
VALUES(5, 4, 'Popcorn', 2, 8.00),(6, 6, 'Soda', 1, 3.50);



--Relationships for ERD 

--There is a one to many relationship for customer and ticket.  ex: A customer can have multiple tickets, but a ticket is associated with one customer

--there is a one to many relationship for customer and concession. ex: A customer can purchase multiple concessions, but each concession is associated with one customer

--there is amany to many relationship for ticket and movie. ex: A ticket is for one movie, but a movie can have multiple tickets.

--there is a many to many relationship for concession and movie. ex: A concession can be associated with multiple movies, and a movie can have multiple concessions.