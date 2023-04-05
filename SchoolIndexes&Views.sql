CREATE INDEX μαθητες_ονομα_idx
ON ΜΑΘΗΤΕΣ(ονομα);

CREATE INDEX μαθητες_επιθετο_idx
ON ΜΑΘΗΤΕΣ(επιθετο);

CREATE INDEX καθηγητες_ονομα_idx
ON ΚΑΘΗΓΗΤΕΣ(ονομα);

CREATE INDEX καθηγητες_επιθετο_idx
ON ΚΑΘΗΓΗΤΕΣ(επιθετο);

CREATE VIEW ονόματα_μαθητών AS
SELECT ονομα, επιθετο
FROM ΜΑΘΗΤΕΣ;

CREATE VIEW ονόματα_καθηγητών AS 
SELECT ονομα, επιθετο
FROM ΚΑΘΗΓΗΤΕΣ;