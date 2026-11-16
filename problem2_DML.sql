-- Lab 4 - Problem 2 (library) - seed data
-- Mahmoud Khaled - 2204184

USE library;

-- authors 2 and 4 are from the same country, author 5 has no books
INSERT INTO author (author_id, name, country) VALUES
  (1, 'Naguib Mahfouz',         'Egypt'),
  (2, 'George Orwell',          'United Kingdom'),
  (3, 'Gabriel Garcia Marquez', 'Colombia'),
  (4, 'Agatha Christie',        'United Kingdom'),
  (5, 'Taha Hussein',           'Egypt');

INSERT INTO publisher (publisher_id, name, country) VALUES
  (1, 'Penguin Books',  'United Kingdom'),
  (2, 'AUC Press',      'Egypt'),
  (3, 'Harper & Row',   'USA');

INSERT INTO category (category_id, name) VALUES
  (1, 'Novel'),
  (2, 'Mystery'),
  (3, 'Political Fiction');

INSERT INTO book (book_id, title, price, publish_year, author_id, publisher_id, category_id) VALUES
  (1,  'Palace Walk',                   14.50, 1956, 1, 2, 1),
  (2,  'Midaq Alley',                   11.00, 1947, 1, 2, 1),
  (3,  'Nineteen Eighty-Four',          12.99, 1949, 2, 1, 3),
  (4,  'Animal Farm',                    9.50, 1945, 2, 1, 3),
  (5,  'One Hundred Years of Solitude', 16.75, 1967, 3, 3, 1),
  (6,  'Love in the Time of Cholera',   15.20, 1985, 3, 1, 1),
  (7,  'Murder on the Orient Express',  10.80, 1934, 4, 3, 2),
  (8,  'And Then There Were None',      10.25, 1939, 4, 3, 2),
  (9,  'Death on the Nile',             18.00, 1937, 4, 1, 2),
  (10, 'The Thief and the Dogs',        22.50, 1961, 1, 2, 1);

-- member 5 has no loans
INSERT INTO member (member_id, name, email, join_date) VALUES
  (1, 'Ahmed Hassan',  'ahmed.hassan@example.com',  '2025-09-10'),
  (2, 'Sara Ali',      'sara.ali@example.com',      '2025-10-02'),
  (3, 'Omar Mostafa',  'omar.mostafa@example.com',  '2026-01-15'),
  (4, 'Nour Ibrahim',  'nour.ibrahim@example.com',  '2026-03-20'),
  (5, 'Youssef Adel',  'youssef.adel@example.com',  '2026-09-01');

-- books 2, 6, 8 and 10 were never borrowed; loans 9, 11 and 12 are not returned yet
INSERT INTO loan (loan_id, book_id, member_id, loan_date, return_date) VALUES
  (1,  3, 1, '2026-02-01', '2026-02-15'),
  (2,  3, 2, '2026-03-05', '2026-03-19'),
  (3,  3, 3, '2026-04-10', '2026-04-22'),
  (4,  7, 1, '2026-04-25', '2026-05-06'),
  (5,  7, 2, '2026-05-12', '2026-05-30'),
  (6,  1, 1, '2026-06-03', '2026-06-20'),
  (7,  4, 3, '2026-07-08', '2026-07-21'),
  (8,  5, 4, '2026-09-14', '2026-09-28'),
  (9,  3, 4, '2026-10-20', NULL),
  (10, 7, 3, '2026-10-01', '2026-10-12'),
  (11, 1, 2, '2026-11-02', NULL),
  (12, 9, 1, '2026-11-09', NULL);
