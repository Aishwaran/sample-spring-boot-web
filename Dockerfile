# Use OpenJDK 21 as base image
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml ./

# Copy the source code to the container
COPY src ./src

# Build the Spring Boot app using Maven
RUN mvn clean package -DskipTests

# Copy the generated .jar file into the container
RUN cp target/*.jar app.jar

# Expose port 8080 to access the app
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
