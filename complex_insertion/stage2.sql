WITH tid AS (
INSERT INTO test_001 (name,title)
VALUES ('c1','Complex1')
       ('c2','Complex2')
RETURNING id)
INSERT INTO test_001_dependent (name,title,test_001_id)
VALUES ('from_new','Hell',tid.id),
       ('from_new2','o!',tid.id); 
