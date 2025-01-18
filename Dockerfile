# Use an official OpenJDK image as a base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml ./

# Copy the src code to the container
COPY src ./src

# Install Maven (if not already installed)
RUN apt-get update && apt-get install -y maven

# Build the Spring Boot app using Maven
RUN mvn clean package -DskipTests

# Copy the generated .jar file into the container
RUN cp target/*.jar app.jar

# Expose port 8080 to access the app
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
