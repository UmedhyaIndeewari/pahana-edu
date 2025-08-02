# 📚 Pahana-Edu Bookshop Management System

A complete, production-ready **Bookshop Management System** built using Java Servlets, JSP, JDBC, and Maven architecture. The system manages customers, items, billing, authentication, and user guidance in a clean and modular way.

---

## 🚀 Features

- 🔐 **Authentication**
    - Session-based login/logout
    - Secure dashboard access
- 👤 **Customer Management**
    - Full CRUD operations
    - Search and update functionality
- 📦 **Item Management**
    - Manage item catalog with categories and prices
- 🧾 **Billing System**
    - Create dynamic bills with items, quantities, and total prices
- ❓ **Help Section**
    - User instructions and module guidance
- 🖥️ **Dashboard**
    - Central navigation hub with styled UI and Font Awesome icons
- 🌑 **Dark Mode UI**
    - Consistent dark theme across all pages

---

## 🛠️ Tech Stack

- Java (JDK 17+)
- JSP & Servlets
- JDBC
- Apache Tomcat (v9 or v10)
- MySQL
- Maven
- JUnit 5
- HTML, CSS, JavaScript (for UI)
- Font Awesome (for icons)

---

## 📦 Project Structure
```
bookshop-management/
│
├── src/main/java/
│ ├── controller/ # Servlets
│ ├── dao/ # Data Access Layer
│ ├── service/ # Business Logic
│ ├── dto/ # Data Transfer Objects
│ ├── model/ # Entity Models
│
├── src/main/webapp/
│ ├── WEB-INF/views/ # JSP files (secured)
│ ├── assets/ # CSS, JS, Fonts
│
├── src/test/java/ # JUnit tests
├── sql/ # SQL schema & seed data
├── pom.xml # Maven project file
└── README.md
```

---

## 🧪 Testing

- JUnit 5 used for testing DAO and Service layers.
- Tests use a real database connection (no mocking).
- Test setup and teardown handled using `@BeforeEach` and `@AfterEach`.

---

## 🧰 Prerequisites

- JDK 17+
- Apache Tomcat 9 or 10
- MySQL Server
- Maven (v3.6+)
- IDE (e.g., IntelliJ IDEA, Eclipse)

---

## ⚙️ Installation & Deployment

### 1. Clone the Repository


git clone https://github.com/your-username/bookshop-management.git
cd bookshop-management

### 2. Configure the Database
Create a MySQL database named bookshop_db

Run the SQL scripts:

-- Create tables and schema
source sql/schema.sql;

-- Seed initial data
source sql/seed_data.sql;

### 3. Update your DB connection settings in DBConnection.java:
```java

private static final String URL = "jdbc:mysql://localhost:3306/bookshop_db";
private static final String USER = "root";
private static final String PASSWORD = "your_password";
```

### 4. Deploy to Apache Tomcat:
Copy the generated .war file from target/ to your Tomcat webapps/ folder.

Start the Tomcat server.

Access the application at:

http://localhost:8080/pahana_edu_war/

### Default Login (for testing)
```

Username: admin
Password: admin123

| Module   | Description                             |
| -------- | --------------------------------------- |
| Auth     | Secure login/logout, session validation |
| Customer | Add/edit/delete/search customers        |
| Items    | Manage item inventory                   |
| Billing  | Add bills with real-time item totals    |
| Help     | Static user instructions for modules    |

```
### 📄 License
```
This project is for academic and educational purposes only.
```
🙌 Contributions
````
Pull requests and feedback are welcome! Please fork the repository and submit a PR for review







