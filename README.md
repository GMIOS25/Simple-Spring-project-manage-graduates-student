# Student Information Management System - Website

> A Java Spring MVC web application for managing and tracking graduate student employment information.

## 📋 Project Overview

This application is designed to help the Ministry of Education manage employment statistics for graduates across all universities and education institutions nationwide. Students graduate and declare their graduation and employment information to provide national data on workforce utilization and job market requirements.

**For full project specifications and requirements, see:** [Java_Web_Đề_2023.md](./Java_Web_Đề_2023.md)

## 📋 Key Features

- ✅ Graduate student information registration form
- ✅ Student information search functionality
- ✅ Graduation and employment data management
- ✅ ComboBox dropdown selection for schools and majors
- ✅ Form validation (required fields & date validation)
- ✅ Spring MVC architecture implementation

## 🔧 System Requirements

### Software Prerequisites
- **Java**: JDK 17 or higher
- **Apache Tomcat**: Version 10.0.0 or higher (compatible with Jakarta Servlet API 6.0)
- **Maven**: Version 3.6.0 or higher
- **MySQL**: Version 5.7 or higher
- **IDE**: IntelliJ IDEA, Eclipse, or any compatible Java IDE

### Maven Dependencies
The following libraries are automatically managed by Maven:
- Spring Framework 6.1.6
- Spring Data JPA 3.2.5
- Hibernate Core 6.4.4
- MySQL Connector Java 8.3.0
- Jakarta Servlet API 6.0.0
- Jakarta JSTL 3.0.1
- Lombok 1.18.32

## 📦 Installation Guide

### Step 1: Database Setup

1. **Create the database:**
   ```sql
   CREATE DATABASE IF NOT EXISTS student_management;
   USE student_management;
   ```

2. **Run the data initialization script:**
   - Navigate to: `src/main/resources/`
   - Execute the `data.sql` file in your MySQL client
   
   Or via command line:
   ```bash
   mysql -u root -p student_management < src/main/resources/data.sql
   ```

### Step 2: Configure Database Connection

Edit `src/main/resources/application.properties`:

```properties
# Database Configuration
db.driver=com.mysql.cj.jdbc.Driver
db.url=jdbc:mysql://localhost:3306/student_management?useSSL=false&serverTimezone=Asia/Ho_Chi_Minh&characterEncoding=UTF-8
db.username=root
db.password=YOUR_PASSWORD
```

**Replace `YOUR_PASSWORD` with your MySQL root password**

### Step 3: Project Setup

1. **Clone/Download the project:**
   ```bash
   cd D:\CODES\Java\Inteliji\Website
   ```

2. **Install Maven dependencies:**
   ```bash
   mvn clean install
   ```

3. **Build the WAR file:**
   ```bash
   mvn clean package
   ```

### Step 4: Deploy to Tomcat

1. **Locate your Tomcat installation:**
   - Windows: `C:\Program Files\Apache Software Foundation\Tomcat 10`
   - Linux: `/usr/local/tomcat` or `/opt/tomcat`

2. **Copy the WAR file:**
   ```bash
   # After successful build, copy the generated WAR file
   cp target/website-1.0-SNAPSHOT.war /path/to/tomcat/webapps/
   ```

3. **Start Tomcat:**
   ```bash
   # Windows
   %CATALINA_HOME%\bin\startup.bat
   
   # Linux/MacOS
   $CATALINA_HOME/bin/startup.sh
   ```

### Step 5: Access the Application

Once Tomcat is running, open your web browser and navigate to:

```
http://localhost:8080/website-1.0-SNAPSHOT/sinhvien/form
```

Or for root deployment:
```
http://localhost:8080/sinhvien/form
```

## 📝 Available URL Routes

| Feature | URL | Method |
|---------|-----|--------|
| Student Info Entry Form | `/sinhvien/form` | GET |
| Save Student Info | `/sinhvien/save` | POST |
| (Additional search features in development) | TBD | TBD |

## 🛠️ Build and Run

### Using Maven

```bash
# Clean and build
mvn clean build

# Run tests (if available)
mvn test

# Package as WAR
mvn package

# Deploy directly (if Maven plugin configured)
mvn tomcat:deploy
```

### Using IDE (IntelliJ IDEA)

1. Open project in IntelliJ IDEA
2. Configure Tomcat server: Run → Edit Configurations
3. Add new Tomcat Server configuration
4. Click "Run" or press `Shift + F10`

## 📚 Project Structure

```
Website/
├── src/
│   ├── main/
│   │   ├── java/org/website/
│   │   │   ├── config/          # Spring configuration classes
│   │   │   ├── controller/      # MVC Controllers
│   │   │   ├── entity/          # JPA Entity classes
│   │   │   ├── service/         # Business logic services
│   │   │   ├── repository/      # Data access layer
│   │   │   ├── dto/             # Data Transfer Objects
│   │   │   └── exception/       # Custom exceptions
│   │   ├── resources/
│   │   │   ├── application.properties  # App configuration
│   │   │   └── data.sql                # Database init script
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   └── views/       # JSP template files
│   │       └── index.jsp
│   └── test/
├── pom.xml
└── README.md
```

## 🔧 Configuration Details

### application.properties
Located at `src/main/resources/application.properties`

This file contains database connection settings. Update the `db.*` properties according to your environment.

### Spring Configuration
- **AppConfig.java**: Main Spring application configuration
- **JpaConfig.java**: JPA and Hibernate configuration
- **WebMvcConfig.java**: Spring MVC configuration with view resolver

## 🐛 Troubleshooting

### Issue 1: HTTP 404 Error
**Problem:** Getting 404 Not Found error
**Solution:** 
- Verify Tomcat is running correctly
- Check if the WAR file is deployed to the webapps directory
- Restart Tomcat server
- Verify application context path matches the URL

### Issue 2: Database Connection Error
**Problem:** `Can't get a connection, pool error`
**Solution:**
- Verify MySQL is running
- Check database credentials in `application.properties`
- Ensure `student_management` database exists
- Check MySQL is listening on port 3306

### Issue 3: Maven Build Fails
**Problem:** Build errors with dependencies
**Solution:**
```bash
# Clear Maven cache and rebuild
mvn clean install -U
```

## 📖 Project Specifications

For complete project requirements, scoring criteria, and implementation details, please refer to:

**[Java_Web_Đề_2023.md](./Java_Web_Đề_2023.md)** 

This document contains:
- Detailed project description
- Database schema and requirements
- Feature requirements breakdown
- Scoring matrix
- Bonus criteria

## 👥 Author

Vietnamese Ministry of Education Exam Project - 2023

## 📄 License

This project is part of an educational assessment and should be used for learning purposes only.

## 🤝 Support

For issues or questions:
1. Check the troubleshooting section above
2. Review the full specifications in Java_Web_Đề_2023.md
3. Check Spring/Hibernate documentation
4. Review Tomcat server logs: `%CATALINA_HOME%/logs/catalina.out`

---

**Last Updated:** May 11, 2026

