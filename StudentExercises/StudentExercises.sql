USE MASTER
GO

IF NOT EXISTS (
    SELECT [name]
    FROM sys.databases
    WHERE [name] = N'StudentExercises'
)
CREATE DATABASE StudentExercises
GO

USE StudentExercises
GO


DROP TABLE IF EXISTS StudentExercise;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Exercise;
DROP TABLE IF EXISTS Instructor;
DROP TABLE IF EXISTS Cohort;


CREATE TABLE Cohort (
    Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL
);

CREATE TABLE Instructor (
    Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    SlackHandle VARCHAR(50),
    Specialty VARCHAR(50),
    CohortId INTEGER NOT NULL
    CONSTRAINT FK_InstructorCohort FOREIGN KEY(CohortId) REFERENCES Cohort(Id)
);

CREATE TABLE Student (
    Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    SlackHandle VARCHAR(50),
    CohortId INTEGER NOT NULL
    CONSTRAINT FK_StudentCohort FOREIGN KEY(CohortId) REFERENCES Cohort(Id)
);

CREATE TABLE Exercise (
    Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50),
    [Language] VARCHAR(50) NOT NULL
);

CREATE TABLE StudentExercise (
    Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
    ExerciseId INTEGER NOT NULL,
    StudentId INTEGER NOT NULL,
    CONSTRAINT FK_StudentExercise_Exercise FOREIGN KEY(ExerciseId) REFERENCES Exercise(Id),
    CONSTRAINT FK_StudentExercise_Student FOREIGN KEY(StudentId) REFERENCES Student(Id)
);


INSERT INTO Cohort ([Name]) VALUES ('Day Cohort 37');
INSERT INTO Cohort ([Name]) VALUES ('Day Cohort 38');
INSERT INTO Cohort ([Name]) VALUES ('Day Cohort 39');
INSERT INTO Cohort ([Name]) VALUES ('Day Cohort 40');
INSERT INTO Cohort ([Name]) VALUES ('Evening Cohort 11');
INSERT INTO Cohort ([Name]) VALUES ('Evening Cohort 12');

INSERT INTO Instructor (FirstName, LastName, SlackHandle, Specialty, CohortId) VALUES (
    'Adam', 'Sheaffer', '@adams', '.NET Web Development', 1
);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, Specialty, CohortId) VALUES (
    'Steve', 'Brownlee', '@coach', 'React Development', 3
);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, Specialty, CohortId) VALUES (
    'Brenda', 'Long', '@bjlong', 'User Experience', 1
);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, Specialty, CohortId) VALUES (
    'Joe', 'Shepard', '@joes', 'Python/Django', 2
);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, Specialty, CohortId) VALUES (
    'Zoe', 'Ames', '@zoeames', 'Javascript', 5
);

INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Philip', 'Martin', '@pdm', 1
)
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Daniel', 'Bennet', '@danielbennet', 1
)
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Namita', 'Manohar', '@namita', 1
)
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Jeffery', 'Lebowski', '@dude', 2
)
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Walter', 'Sobchalk', '@walter', 2
)
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Donnie', 'Kerabosos', '@donnie', 2
)
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Bunny', 'Lebowski', '@bunny', 3
)
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Brandt', 'Smith', '@brant', 3
)
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Uli', 'Kunkel', '@uli', 3
)
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Jackie', 'Treehorn', '@jtreehorn', 4
)
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Maude', 'Lebowski', '@mleb', 4
)
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES (
    'Joe', 'Defino', '@jdef', 4
)

INSERT INTO Exercise ([Name], [Language]) VALUES('LINQ Intro', 'C#');
INSERT INTO Exercise ([Name], [Language]) VALUES('ADO.NET', 'C#');
INSERT INTO Exercise ([Name], [Language]) VALUES('Dog Walker', 'C#');
INSERT INTO Exercise ([Name], [Language]) VALUES('Trestlebridge', 'C#');
INSERT INTO Exercise ([Name], [Language]) VALUES('Music History', 'SQL');
INSERT INTO Exercise ([Name], [Language]) VALUES('Django Migrations', 'Python');
INSERT INTO Exercise ([Name], [Language]) VALUES('List Comprehensions', 'Python');
INSERT INTO Exercise ([Name], [Language]) VALUES('Array Methods', 'Javascript');
INSERT INTO Exercise ([Name], [Language]) VALUES('Kennel', 'Javascript');
INSERT INTO Exercise ([Name], [Language]) VALUES('Nutshell', 'Javascript');

INSERT INTO StudentExercise([StudentId], [ExerciseId]) VALUES (1, 1);
INSERT INTO StudentExercise([StudentId], [ExerciseId]) VALUES (2, 1);
INSERT INTO StudentExercise([StudentId], [ExerciseId]) VALUES (2, 2);
INSERT INTO StudentExercise([StudentId], [ExerciseId]) VALUES (3, 2);
INSERT INTO StudentExercise([StudentId], [ExerciseId]) VALUES (3, 3);
INSERT INTO StudentExercise([StudentId], [ExerciseId]) VALUES (4, 10);
INSERT INTO StudentExercise([StudentId], [ExerciseId]) VALUES (5, 9);
INSERT INTO StudentExercise([StudentId], [ExerciseId]) VALUES (5, 10);