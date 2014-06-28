WITH tid AS (
    INSERT INTO test_001 (name,title)
           VALUES ('atat','Atat!')
    RETURNING id)
INSERT INTO test_001_dependent (name,title,test_001_id)
       VALUES ('olol','LOL!',(SELECT id FROM tid));
