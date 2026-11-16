# Lab 4 – Search Queries in SQL (Problem 2: Library website)

**Name:** Mahmoud Khaled
**ID:** 2204184

Stack: Python 3 + Flask + MySQL. This continues the Lab 3 website: the old pages
(show / add / edit / remove books and authors) still work, and the new search pages are added.

## Files
| File | What it is |
|------|------------|
| `problem2_DDL.sql` | creates the `library` database and its six tables |
| `problem2_DML.sql` | seed data (5 authors, 3 publishers, 3 categories, 10 books, 5 members, 12 loans) |
| `problem2_Queries.sql` | the SQL of the pages F2.1 – F2.6 |
| `website/` | the Flask website (`app.py`, `templates/`, `requirements.txt`) |

## Run it, step by step
1. Make sure MySQL is running and you know the root password.
2. Build the database and insert the seed data (from this folder):
   ```
   mysql -u root -p < problem2_DDL.sql
   mysql -u root -p < problem2_DML.sql
   ```
3. (Optional) run the queries of the pages in the MySQL client:
   ```
   mysql -u root -p -t < problem2_Queries.sql
   ```
4. Install the website's dependencies:
   ```
   cd website
   pip install -r requirements.txt
   ```
5. Set the database password and start the site:
   - Linux / macOS: `export DB_PASSWORD=your_password`
   - Windows (cmd): `set DB_PASSWORD=your_password`

   ```
   python app.py
   ```
   Optional variables: `DB_HOST` (default `localhost`), `DB_USER` (default `root`).
6. Open http://127.0.0.1:5000 and use the menu at the top of the page.

## New pages (Lab 4)
| Req  | Page | URL | SQL used |
|------|------|-----|----------|
| F2.1 | Search books: title keyword, minimum and maximum price, category list, cheapest first | `/search` | `WHERE`, `LIKE`, `BETWEEN`, `ORDER BY` |
| F2.2 | Catalogue: all books with the author, publisher and category names | `/catalogue` | `JOIN` of four tables |
| F2.3 | Reports: (a) books and average price per category, (b) authors with at least 2 books, (c) total, smallest and largest price | `/reports` | `GROUP BY`, `HAVING`, aggregate functions |
| F2.4 | Loans: (a) loans not returned yet, (b) members who never borrowed, (c) books never borrowed | `/loans` | `JOIN`, `LEFT JOIN`, `IS NULL` |
| F2.5 | Most borrowed: the 3 books with the most loans and the member with the most loans | `/most-borrowed` | `GROUP BY`, `ORDER BY`, `LIMIT` |
| F2.6 | Authors and books: (a) every author with the number of books (also 0), (b) books whose author and publisher are from the same country | `/authors-books` | `LEFT JOIN`, `JOIN` |
| Bonus | The search form of F2.1 uses a prepared statement (`cursor(prepared=True)` with `%s` placeholders), the text the user types is never put inside the SQL text | `/search` | |

## Seed data cases
- Two authors from the same country: George Orwell and Agatha Christie (United Kingdom).
- Author with no books: Taha Hussein.
- Author with at least 2 books: Naguib Mahfouz (3 books).
- Author and publisher from the same country: George Orwell and Penguin Books.
- Book priced between 15 and 20: Death on the Nile (18.00).
- Book never borrowed: Midaq Alley.
- Member with no loans: Youssef Adel.
- Loan not returned yet: loan 12.

## Pages from Lab 3 (still working)
Home page with the books and authors tables, "+ Add book", "+ Add author", "Edit" and "Remove".
The book form now also asks for the publish year, the publisher and the category.
Removing an author removes his/her books, and removing a book removes its loans (`ON DELETE CASCADE`).
