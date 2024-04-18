
# Points of Interest Explorer Development Guide

## Introduction

Welcome to the Points of Interest Explorer project! This guide will take you through the steps to contribute to the development of this innovative platform designed to discover and share information about various points of interest. Let's get started on the journey to make exploration easier and more interactive for everyone!

## Project Roadmap

### Stage 1: Group Formation

Gather a small team of two to three motivated individuals who are passionate about building an interactive web platform. Collaboration is key!

### Stage 2: Application Outline and ER Diagram

Develop a clear and concise summary of the project's domain, functionality, and an Entity-Relationship (ER) diagram with clear assumptions to outline the database schema and relationships.

### Stage 3: Development Plan

1. **Database Schema**: Establish the database schema with a relational structure, ensuring all keys and dependencies are mapped out.

2. **Tech Stack**:
   - **Frontend**: Build the user interface using HTML, CSS, and Next.js for a dynamic and responsive experience.
   - **Backend**: Utilize Flask, a lightweight Python web framework, for the backend logic.
   - **Database**: Implement SQLite for database management due to its lightweight nature and ease of integration with Flask.

3. **Data Acquisition**: Plan to acquire data from open-source datasets like OpenStreetMap, Wikimedia Commons, and government sources. Populate the initial database using SQL's `INSERT` command, possibly assisted by Bard AI for synthetic data generation.

4. **Labor Division**: Divide tasks among team members based on individual strengths and interests. Maintain flexibility to help each other out.

### Stage 4: Mid-project Report

Update stakeholders on the current progress, including completed milestones, challenges faced, and planned future tasks. Provide visual proof of work like screenshots or live links.

### Stage 5: Demo and Final Report

- **Basic Functions**: Implement basic CRUD operations (Create, Read, Update, Delete) for all entities in the database. Ensure that users can register, log in, and interact with points of interest, including leaving reviews.

- **Advanced Functions**: Integrate more complex features, like advanced search filters, interactive maps, and possibly a recommendation engine that suggests POIs based on user preferences.

- **Content Moderation**: Develop a system to moderate user-generated content to maintain the quality and reliability of the information provided.

## Technical Specifications

### Relational Schema

Refer to the provided schema for database structure, noting primary keys (underlined & bolded) and foreign keys (blue font).

### Frontend

Leverage HTML and CSS for structuring and styling. Implement dynamic client-side interactions with Next.js.

### Backend

Develop the server-side logic with Flask, ensuring the application is secure, efficient, and scalable.

### Database

Use SQLite to manage data, taking advantage of its simplicity for small to medium-sized projects.

### Data Source

Collate data from open-source platforms, utilizing available government and public domain datasets. Use Bard AI to create synthetic datasets if necessary.

## Getting Started

### Prerequisites

- Python (3.x recommended)
- MySQL Server

### Setup Development Environment

1. **Repository Setup**:
   - Fork the 'PointsofInterestExplorer' repository and clone your fork to your local machine.
   - Navigate into the project directory.

2. **Database Initialization**:
   - Ensure MySQL Server is installed and running on your machine.
   - Execute the `setup_db.sh` script to create the database and populate it with the initial data:
     ```bash
     ./setup_db.sh
     ```
   - This script will set up the `flog_db` database and all required tables, along with the initial seed data for points of interest.

3. **Backend Server**:
   - Set up a Python virtual environment within the project directory:
     ```bash
     python3 -m venv venv
     source venv/bin/activate  # On Windows use `venv\Scripts\activate`
     ```
   - Install the required Python dependencies:
     ```bash
     pip install -r requirements.txt
     ```
   - Start the Flask backend server:
     ```bash
     python app.py
     ```

### Run the Application

With the Flask backend server running, open your web browser and navigate to `http://localhost:5000` to view the application.

### Collaboration

- Commit your changes and use Git for version control. Regularly push updates to the remote repository.
- Create pull requests for merging changes after peer reviews.
- Maintain communication with team members via your chosen platform (e.g., Slack, Discord) for coordination and updates.

## Development Tips

- Keep code modular to facilitate maintenance and future development.
- Write tests early on to ensure your features work as expected and to catch regressions.
- Comment your code where necessary to explain complex logic.
- Stay consistent with coding standards agreed upon by your team.
- Regularly update your roadmap to reflect current project status and next steps.

