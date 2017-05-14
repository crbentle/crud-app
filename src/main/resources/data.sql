INSERT INTO client ( company_name, website, phone, street_address, city, state, zip_code ) VALUES
( 'Aquent', 'https://aquent.com/','(828) 398-1800','58 N Lexington Ave','Asheville','NC','28801' ),
( 'Progress Energy', 'https://www.duke-energy.com','(800) 452-2777','4214 Trinity Rd','Raleigh','NC','27607' ),
( 'EGL Co Inc', 'https://www.egl-lighting.com/','(908) 508-1111','100 Industrial Rd','Berkeley Heights','NJ','07922' ),
( 'AutoZone', 'http://www.autozone.com','(828) 684-9222','1960 Hendersonville Rd','Asheville','NC','28803' );




INSERT INTO person (first_name, last_name, email_address, street_address, city, state, zip_code, client_id ) VALUES
('Chris', 'Bentley', 'cbentley@aquent.com', '1234 Haywood Rd.', 'Asheville', 'NC', '28806', 1);
	
-- Random names from https://names.igopaygo.com/people/fake-person
INSERT INTO person (first_name, last_name, email_address, street_address, city, state, zip_code, client_id ) VALUES
('Grumio', 'Carnahan', 'gr.carnahan@progressenergyinc.info', '4581 High Mountain Crescent', 'Saltillo', 'NS', '65481', 2),
('Phyliss', 'Newman', 'pnewman@arvinmeritor.info', '6161 Foggy Cider Isle', 'Siloam', 'NM', '87083', 0),
('Alexis', 'Rinker', 'alexrink@autozone-inc.info', '7670 Crystal Abbey', 'East Millbury', 'KY', '42950', 4),
('Cordell', 'Easterly', 'cor.ea@diaperstack.com', '2123 Fallen Berry Extension', 'Bissell', 'NM', '87935', 0),
('Seleucus', 'Salley', 'seleucu.salley@egl-inc.info', '9283 Red Mountain', 'Town And Country', 'MI', '48059', 3),
('Ilanna', 'Seidler', 'ilann.seid@egl-inc.info', '3745 Tawny Pond Pointe', 'Cropper', 'MT', '59486', 3),
('Chiquita', 'Loop', 'chiqui-lo@egl-inc.info', '8864 Blue Grove Mall ', 'Bayou Corne', 'NS', '45321', 3),
('Barina', 'Montalbano', 'barinamonta@progressenergyinc.info', '686 Dusty Dale Falls', 'Belle Meade', 'AK', '99519', 2),
('Thorberta', 'Gay', 'thorbert.gay@autozone-inc.info', '259 Misty Boulevard', 'Leola', 'MT', '59095', 4),
('Toyo', 'Swilley', 'toyo.swille@diaperstack.com', '812 Easy Road', 'Turntime Crossroads', 'AR', '71793', 0);