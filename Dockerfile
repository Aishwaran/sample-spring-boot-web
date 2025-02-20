# Use OpenJDK 21 as the base image
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy the pom.xml file to the container (for dependency resolution)
COPY pom.xml ./

# Copy the source code to the container
COPY src ./src

# Build the Spring Boot app using Maven (skip tests)
RUN mvn clean package -DskipTests

# Copy the generated .jar file into the container
RUN cp target/*.jar app.jar

# Expose port 8080 to access the app
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
