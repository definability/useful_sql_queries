WITH cat_id AS (
	INSERT
		INTO category (name,title)
		SELECT 'category1','Super category'
		WHERE NOT EXISTS (
			SELECT id FROM category
			WHERE name = 'category1'
			)
	RETURNING id
	), l_id AS (
	INSERT
		INTO layer (name,title,category_id)
		SELECT 'layer2','Postlayer',(SELECT id FROM cat_id)
		WHERE NOT EXISTS (
			SELECT id FROM layer
			WHERE name = 'layer2'
			)
	RETURNING id
	), ms_ids AS (
	INSERT INTO measurements (name,title,layer_id)
	VALUES
	('m5','Five',(SELECT id FROM l_id)),
	('m6','Six',(SELECT id FROM l_id)),
	('m7','Seven',(SELECT id FROM l_id)),
	('m8','Eight',(SELECT id FROM l_id))
	RETURNING id
	)
INSERT INTO meas_content (type,content,measurement_id)
	VALUES
	(3,'oh',(SELECT id FROM ms_ids LIMIT 1 OFFSET 1)),
	(4,'my',(SELECT id FROM ms_ids LIMIT 1 OFFSET 1)),
	(2,'God',(SELECT id FROM ms_ids LIMIT 1 OFFSET 2)),
	(2,'!!!',(SELECT id FROM ms_ids LIMIT 1 OFFSET 2)),
	(4,'amamam',(SELECT id FROM ms_ids LIMIT 1 OFFSET 3));
