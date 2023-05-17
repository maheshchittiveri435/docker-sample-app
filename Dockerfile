# Base image with Java installed
FROM openjdk:11-jre

# Set the working directory
WORKDIR /app

# Copy the JaCoCo agent JAR file into the container
COPY jacocoagent.jar /app

# Copy the jacococli.jar file to the container
COPY jacococli.jar .

# Copy the application JAR into the container
COPY target/Application-1.0.jar /app

# Mount a volume to store jacoco on the host machine
VOLUME /app

# Run the application with the JaCoCo agent enabled
CMD ["java", "-javaagent:/app/jacocoagent.jar=destfile=/app/jacoco.exec", "-jar", "/app/Application-1.0.jar"]