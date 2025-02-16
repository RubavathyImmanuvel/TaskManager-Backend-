# Use Eclipse Temurin (Adoptium) JDK 23 as the base image
FROM eclipse-temurin:23-jdk

# Set working directory
WORKDIR /app

# Copy the Maven wrapper and source code
COPY . .

# Grant execute permissions to the Maven wrapper
RUN chmod +x mvnw

# Force Maven to build the project, skipping tests
RUN ./mvnw clean package -DskipTests

# Find the generated JAR file dynamically and rename it to app.jar
RUN cp target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
