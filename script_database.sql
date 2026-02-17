CREATE TABLE Profesores (
    id_profesor INT PRIMARY KEY,
    dni TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    es_jefe_departamento BOOLEAN DEFAULT FALSE
);

CREATE TABLE Alumnos (
    id_alumno INT PRIMARY KEY,
    dni TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    fecha_nacimiento DATE,
    id_tutor INT,
    FOREIGN KEY (id_tutor) REFERENCES Profesores(id_profesor)
);

CREATE TABLE Asignaturas (
    codigo_asignatura INT PRIMARY KEY,
    nombre TEXT NOT NULL,
    horas_semanales INT
);

CREATE TABLE Profesor_Asignatura (
    id_profesor INT,
    codigo_asignatura INT,
    turno TEXT CHECK (turno IN ('mañana', 'tarde', 'nocturno')),
    PRIMARY KEY (id_profesor, codigo_asignatura, turno),
    FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor),
    FOREIGN KEY (codigo_asignatura) REFERENCES Asignaturas(codigo_asignatura)
);

CREATE TABLE Matriculas (
    id_alumno INT,
    codigo_asignatura INT,
    nota DECIMAL,
    es_repetidor BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_alumno, codigo_asignatura),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (codigo_asignatura) REFERENCES Asignaturas(codigo_asignatura)
);
