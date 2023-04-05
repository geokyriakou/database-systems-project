CREATE TABLE ΣΧΟΛΕΙΟ ( 
	κωδικος_σχολειου	INTEGER	NOT NULL,
	Δήμος	VARCHAR(45)	NOT NULL,
	Ιδιότητα	VARCHAR(45)	NOT NULL,
PRIMARY KEY (κωδικος_σχολειου) );

CREATE TABLE ΜΑΘΗΜΑ ( 
	κωδικος_μαθηματος	VARCHAR(10)	NOT NULL,
PRIMARY KEY (κωδικος_μαθηματος) );

CREATE TABLE ΚΑΘΗΓΗΤΕΣ ( 
	επιθετο	VARCHAR(45),
	ειδικότητα	VARCHAR(45),
	αρ_ταυτοτ_καθ	VARCHAR(8)	NOT NULL,
	ονομα	VARCHAR(45),
	FK1_κωδικος_σχολειου	INTEGER	NOT NULL,
	FK2_κωδικος_μαθηματος	VARCHAR(10),
	FK3_τμημα	CHAR(2)	NOT NULL,
PRIMARY KEY (αρ_ταυτοτ_καθ) );

CREATE TABLE ΤΑΞΗ ( 
	τμημα	CHAR(2)	NOT NULL,
PRIMARY KEY (τμημα) );

CREATE TABLE ΜΑΘΗΤΕΣ ( 
	ονομα	VARCHAR(45),
	επιθετο	VARCHAR(45),
	ημ_γεννησης	DATE,
	Αρ_ταυτοτ_μαθ	VARCHAR(8)	NOT NULL,
	FK1_τμημα	CHAR(2),
	FK2_κωδικος_σχολειου	INTEGER,
PRIMARY KEY (Αρ_ταυτοτ_μαθ) );

CREATE TABLE ΓΟΝΕΙΣ ( 
	αρ_ταυτοτ_γον	VARCHAR(8)	NOT NULL,
	επιθετο	VARCHAR(45),
	διευθ_κατοικιας	VARCHAR(45),
	ονομα	VARCHAR(45),
	τηλεφωνο_γονεα	INTEGER,
	FK1_Αρ_ταυτοτ_μαθ	VARCHAR(8)	NOT NULL,
PRIMARY KEY (αρ_ταυτοτ_γον, FK1_Αρ_ταυτοτ_μαθ) );

CREATE TABLE εχουν_περασει ( 
	Βαθμός	INTEGER,
	FK1_Αρ_ταυτοτ_μαθ	VARCHAR(8)	NOT NULL,
	FK2_κωδικος_μαθηματος	VARCHAR(10)	NOT NULL,
PRIMARY KEY (FK1_Αρ_ταυτοτ_μαθ, FK2_κωδικος_μαθηματος) );

ALTER TABLE ΚΑΘΗΓΗΤΕΣ ADD FOREIGN KEY (FK1_κωδικος_σχολειου) REFERENCES ΣΧΟΛΕΙΟ (κωδικος_σχολειου) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE ΚΑΘΗΓΗΤΕΣ ADD FOREIGN KEY (FK2_κωδικος_μαθηματος) REFERENCES ΜΑΘΗΜΑ (κωδικος_μαθηματος) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE ΚΑΘΗΓΗΤΕΣ ADD FOREIGN KEY (FK3_τμημα) REFERENCES ΤΑΞΗ (τμημα) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE ΜΑΘΗΤΕΣ ADD FOREIGN KEY (FK1_τμημα) REFERENCES ΤΑΞΗ (τμημα) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE ΜΑΘΗΤΕΣ ADD FOREIGN KEY (FK2_κωδικος_σχολειου) REFERENCES ΣΧΟΛΕΙΟ (κωδικος_σχολειου) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE ΓΟΝΕΙΣ ADD FOREIGN KEY (FK1_Αρ_ταυτοτ_μαθ) REFERENCES ΜΑΘΗΤΕΣ (Αρ_ταυτοτ_μαθ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE εχουν_περασει ADD FOREIGN KEY (FK1_Αρ_ταυτοτ_μαθ) REFERENCES ΜΑΘΗΤΕΣ (Αρ_ταυτοτ_μαθ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE εχουν_περασει ADD FOREIGN KEY (FK2_κωδικος_μαθηματος) REFERENCES ΜΑΘΗΜΑ (κωδικος_μαθηματος) ON DELETE CASCADE ON UPDATE CASCADE;
