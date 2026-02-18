CREATE TABLE Profesora (
    id_profesora INT PRIMARY KEY,
    dni TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    es_jefe_departamento BOOLEAN DEFAULT FALSE
);

CREATE TABLE Alumna (
    id_alumna INT PRIMARY KEY,
    dni TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    fecha_nacimiento DATE,
    id_tutora INT,
    FOREIGN KEY (id_tutora) REFERENCES Profesora(id_profesora)
);

CREATE TABLE Asignatura (
    codigo_asignatura TEXT PRIMARY KEY,
    nombre_asignatura TEXT NOT NULL,
    horas_semanales INT NOT NULL
);

CREATE TABLE Profesor_Asignatura (
    id_profesora INT,
    codigo_asignatura INT,
    turno TEXT,
    PRIMARY KEY (id_profesora, codigo_asignatura, turno),
    FOREIGN KEY (id_profesora) REFERENCES Profesora(id_profesora),
    FOREIGN KEY (codigo_asignatura) REFERENCES Asignatura(codigo_asignatura)
);

CREATE TABLE Matriculas (
    id_alumna INT,
    codigo_asignatura INT,
    nota DECIMAL,
    es_repetidora BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_alumna, codigo_asignatura),
    FOREIGN KEY (id_alumna) REFERENCES Alumna(id_alumna),
    FOREIGN KEY (codigo_asignatura) REFERENCES Asignatura(codigo_asignatura)
);
