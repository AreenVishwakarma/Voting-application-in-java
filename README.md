# Voting System

## Overview
This project is a **Voting System for Elections** where users can register, vote for a candidate, and check their details.

## Features
- **User Registration**: Users must register with their credentials.
- **Voting Page**: After registration, users are redirected to the voting page.
- **Vote Submission**: Users select a candidate and enter their Aadhar number to submit their vote.
- **Dashboard**: Users can log in to check their details.
- **Logout Functionality**: Users can securely log out after voting.

## Pages & Workflow
1. **Registration Page**
   - Users register using their credentials.
   - Upon successful registration, they are redirected to the voting page.

2. **Voting Page**
   - Users select a candidate.
   - They must enter their Aadhar number to confirm and submit the vote.
   - After voting, they are logged out.

3. **Dashboard Page**
   - Users log in to check their details.

## Technologies Used
- **JSP & Servlets** (Java-based web development)
- **JDBC** (Database connectivity)
- **HTML, CSS, JavaScript** (Frontend design)
- **MySQL** (Database for storing user and voting details)

## Setup Instructions
### For Java NetBeans Users
1. **Install NetBeans IDE** (if not installed already).
2. **Set up Tomcat Server** in NetBeans:
   - Go to **Tools** > **Servers** > **Add Server**.
   - Select **Apache Tomcat**, specify the installation directory, and configure the settings.
3. **Clone the repository**
   ```bash
   git clone <repository-url>
   ```
4. **Import the Project into NetBeans**
   - Open NetBeans and select **File** > **Open Project**.
   - Locate the cloned project folder and open it.
5. **Setup the Database**
   - Create a MySQL database.
   - Import the SQL script (`voting_system.sql`).
6. **Configure Database Connection**
   - Update `dbConfig.jsp` or relevant configuration file with MySQL credentials.
7. **Run the Project**
   - Right-click on the project and select **Run**.
   - The application will open in your browser via `http://localhost:8080/voting-system`.

## Usage
1. **Register** on the registration page.
2. **Vote** by selecting a candidate and entering your Aadhar number.
3. **Logout** after voting.
4. **Login** to the dashboard to check your details.

## License
This project is open-source and can be modified as needed.

---
For any issues or improvements, feel free to contribute!

