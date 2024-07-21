--\/unloaded
INSERT INTO 
    attribute_groups (name, sorted_order)
VALUES
    --notebooks
    ('Screen', 1),
    ('Processor', 2),
    ('Operating memory', 3),
    ('Data storage', 4),
    ('Graphics card', 5),
    ('Case', 6),
    ('Connection', 7);


--\/ unloaded
INSERT INTO
    attributes (group_id, name, sorted_order)
VALUES
--notebooks
    (16, 'Screen diagonal', 1),
    (16, 'Screen type', 2),
    (16, 'Screen refresh rate', 3),
    (16, 'Resolution', 4),
    (16, 'Screen coating', 5),
    (16, 'Built-in camera', 6),

    (17, 'Processor', 1),
    (17, 'Operating System', 2),
    (17, 'Processor generation', 3),

    (18, 'RAM capacity', 1),
    (18, 'RAM type', 2),
    (18, 'Upgrade option', 3),
    (18, 'RAM specifications', 4),

    (19, 'SSD capacity', 1),
    (19, 'Number of M.2 slots', 2),
    (19, 'SSD M.2 interface standard', 3),
    (19, 'Number of 2.5" SATA HDD/SSD slots', 4),

    (20, 'Video card manufacturer', 1),
    (20, 'Discrete graphics card', 2),
    (20, 'Video card memory', 3),
    (20, 'Video card type', 4),
    (20, 'Integrated graphics card', 5),
    
    (21, 'Battery capacity, W h', 1),
    (21, 'Weight, kg', 2),
    (21, 'Colour', 3),
    (21, 'Battery life', 4),
    (21, 'Manipulators', 5),
    (21, 'Case Material', 6),
    (21, 'Battery Features', 7),
    (21, 'Dimensions (W x D x H)', 8),
    
    (22, 'Network adapters', 1),
    (22, 'I/O connectors and ports', 2),
    (22, 'Brief specifications', 3),
    (22, 'Country of manufacture', 4),
    (22, 'Additional features', 5),
    (22, 'Year', 6),
    (22, 'Type', 7),
    (22, 'Additional features', 8),
    (22, 'Supply packa--Tabletsge', 9),
    (22, 'Country of brand registration', 10),
    (22, 'Warranty', 11);