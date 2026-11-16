-- Lab 4 - Problem 2 (library) - DDL
-- Mahmoud Khaled - 2204184

DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
USE library;

CREATE TABLE author (
  author_id INT          NOT NULL AUTO_INCREMENT,
  name      VARCHAR(100) NOT NULL,
  country   VARCHAR(50),
  PRIMARY KEY (author_id)
);

CREATE TABLE publisher (
  publisher_id INT          NOT NULL AUTO_INCREMENT,
  name         VARCHAR(100) NOT NULL,
  country      VARCHAR(50),
  PRIMARY KEY (publisher_id)
);

CREATE TABLE category (
  category_id INT         NOT NULL AUTO_INCREMENT,
  name        VARCHAR(50) NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE book (
  book_id      INT           NOT NULL AUTO_INCREMENT,
  title        VARCHAR(150)  NOT NULL,
  price        DECIMAL(10,2) NOT NULL,
  publish_year INT,
  author_id    INT           NOT NULL,
  publisher_id INT           NOT NULL,
  category_id  INT           NOT NULL,
  PRIMARY KEY (book_id),
  FOREIGN KEY (author_id) REFERENCES author(author_id)
    ON DELETE CASCADE,   -- deleting an author deletes all of his/her books
  FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
  FOREIGN KEY (category_id)  REFERENCES category(category_id)
);

CREATE TABLE member (
  member_id INT          NOT NULL AUTO_INCREMENT,
  name      VARCHAR(100) NOT NULL,
  email     VARCHAR(100) UNIQUE,
  join_date DATE         NOT NULL,
  PRIMARY KEY (member_id)
);

CREATE TABLE loan (
  loan_id     INT  NOT NULL AUTO_INCREMENT,
  book_id     INT  NOT NULL,
  member_id   INT  NOT NULL,
  loan_date   DATE NOT NULL,
  return_date DATE,        -- NULL while the book is still borrowed
  PRIMARY KEY (loan_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id)
    ON DELETE CASCADE,     -- deleting a book deletes its loans
  FOREIGN KEY (member_id) REFERENCES member(member_id)
);
