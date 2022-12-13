CREATE DATABASE UltraHealth;

GRANT ALL PRIVILEGES ON UltraHealth.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE UltraHealth;

-- MAKE NDC CODE AN AUTO-INCREMENT

CREATE TABLE Medication (
  NDC_Code INTEGER NOT NULL AUTO_INCREMENT,
  DrugName TEXT NOT NULL,
  Company TEXT NOT NULL,
  PRIMARY KEY (NDC_Code)
);

CREATE TABLE Insurance (
  Insurance_ID INTEGER NOT NULL AUTO_INCREMENT,
  Member_ID TEXT NOT NULL,
  Policy TEXT NOT NULL,
  Company TEXT NOT NULL,
  PRIMARY KEY (Insurance_ID)
);

CREATE TABLE Doctor (
  Doctor_ID INTEGER NOT NULL AUTO_INCREMENT,
  Name TEXT NOT NULL,
  WorkingAddress TEXT NOT NULL,
  City VARCHAR(30) NOT NULL,
  State CHAR(2) NOT NULL,
  ZipCode CHAR(5) NOT NULL,
  PhoneNumber CHAR(13) NOT NULL,
  Email TEXT NOT NULL,
  Fax CHAR(13) NOT NULL,
  PRIMARY KEY (Doctor_ID)
);

CREATE TABLE Patient (
  Patient_ID INTEGER NOT NULL AUTO_INCREMENT,
  Name TEXT NOT NULL,
  DOB TEXT NOT NULL,
  Address TEXT NOT NULL,
  City VARCHAR(30) NOT NULL,
  State CHAR(2) NOT NULL,
  ZipCode CHAR(5) NOT NULL,
  Email TEXT NOT NULL,
  PhoneNumber CHAR(13) NOT NULL,
  PrimaryDoctor INTEGER NOT NULL,
  Insurance_ID INTEGER,
  PRIMARY KEY (Patient_ID),
  FOREIGN KEY (PrimaryDoctor) REFERENCES Doctor(Doctor_ID),
  FOREIGN KEY (Insurance_ID) REFERENCES Insurance(Insurance_ID)
);

CREATE TABLE Prescription (
  RxNumber INTEGER NOT NULL AUTO_INCREMENT,
  NDC_Code INTEGER NOT NULL,
  RefillNumber INTEGER NOT NULL,
  Patient_ID INTEGER NOT NULL,
  StartDate TEXT,
  EndDate TEXT,
  StillTaking TEXT,
  PRIMARY KEY (RxNumber),
  FOREIGN KEY (NDC_Code) REFERENCES Medication(NDC_Code),
  FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

CREATE TABLE DocInsurance (
  Doctor_ID INTEGER NOT NULL,
  Insurance_ID INTEGER NOT NULL,
  PRIMARY KEY (Doctor_ID, Insurance_ID),
  FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID),
  FOREIGN KEY (Insurance_ID) REFERENCES Insurance(Insurance_ID)
);

CREATE TABLE Pharmacy (
  Pharmacy_ID INTEGER NOT NULL AUTO_INCREMENT,
  PharmacyName TEXT NOT NULL,
  Address TEXT NOT NULL,
  City VARCHAR(30) NOT NULL,
  State CHAR(2) NOT NULL,
  ZipCode CHAR(5) NOT NULL,
  Manager TEXT NOT NULL,
  PhoneNumber CHAR(13) NOT NULL,
  Fax CHAR(13) NOT NULL,
  PRIMARY KEY (Pharmacy_ID)
);

CREATE TABLE Pharmacist (
  Pharmacist_ID INTEGER NOT NULL AUTO_INCREMENT,
  Name TEXT NOT NULL,
  Email TEXT NOT NULL,
  Pharmacy_ID INTEGER NOT NULL,
  PRIMARY KEY (Pharmacist_ID)
);

CREATE TABLE Orders (
  Order_ID INTEGER NOT NULL AUTO_INCREMENT,
  RxNumber INTEGER NOT NULL,
  Total VARCHAR(50) NOT NULL,
  OrderDate TEXT NOT NULL,
  Patient_ID INTEGER NOT NULL,
  PRIMARY KEY (Order_ID),
  FOREIGN KEY (RxNumber) REFERENCES Prescription(RxNumber)
);

insert into Medication (DrugName, Company) values ('Lorazepam', 'Hi-Tech Pharmacal Co., Inc.');
insert into Medication (DrugName, Company) values ('Fludarabine Phosphate', 'Sandoz Inc');
insert into Medication (DrugName, Company) values ('Body Repair Balm', 'Skinfix, Inc.');
insert into Medication (DrugName, Company) values ('PENTOXIFYLLINE', 'Golden State Medical Supply, Inc.');
insert into Medication (DrugName, Company) values ('Citroma', 'Supervalue, INC');
insert into Medication (DrugName, Company) values ('NAAMAN', 'LEADER GREEN CO., LTD.');
insert into Medication (DrugName, Company) values ('Lunesta', 'H.J. Harkins Company, Inc.');
insert into Medication (DrugName, Company) values ('Antifungal', 'Actavis Mid Atlantic LLC');
insert into Medication (DrugName, Company) values ('RILUZOLE', 'Apotex Corp');
insert into Medication (DrugName, Company) values ('NALTREXONE HYDROCHLORIDE', 'American Health Packaging');
insert into Medication (DrugName, Company) values ('Acyclovir', 'Golden State Medical Supply, Inc.');
insert into Medication (DrugName, Company) values ('GAMMAGARD S/D', 'Baxter Healthcare Corporation');
insert into Medication (DrugName, Company) values ('Instant Hand Sanitizer Original', 'King Import Warehouse');
insert into Medication (DrugName, Company) values ('Chem Clean Antibacterial Hand', 'Whisk Products, Inc.');
insert into Medication (DrugName, Company) values ('MINOXIDIL', 'AvKARE, Inc.');
insert into Medication (DrugName, Company) values ('PROVENCE MELTING FOUNDATION', 'NATURE REPUBLIC CO., LTD.');
insert into Medication (DrugName, Company) values ('Thyrotropin Releasing Hormone', 'AnazaoHealth Corporation');
insert into Medication (DrugName, Company) values ('ASPERGILLUS NIGER', 'Allergy Laboratories, Inc.');
insert into Medication (DrugName, Company) values ('SunZone Family SPF 30', 'Empack Spraytech Inc');
insert into Medication (DrugName, Company) values ('Pioglitazone', 'Sandoz Inc');
insert into Medication (DrugName, Company) values ('care one pain relief pm', 'American Sales Company');
insert into Medication (DrugName, Company) values ('Simcor', 'Physicians Total Care, Inc.');
insert into Medication (DrugName, Company) values ('Trazodone Hydrochloride', 'Cardinal Health');
insert into Medication (DrugName, Company) values ('Warfarin Sodium', 'REMEDYREPACK INC.');
insert into Medication (DrugName, Company) values ('Mark 3', 'Cargus International, Inc.');
insert into Medication (DrugName, Company) values ('alcohol', 'Sion Biotext Medical Ltd');
insert into Medication (DrugName, Company) values ('Dermablend Leg and Body Cover', 'L''Oreal USA Products Inc');
insert into Medication (DrugName, Company) values ('IBU', 'Dr. Reddy''s Laboratories Limited');
insert into Medication (DrugName, Company) values ('AUREOBASIDIUM PULLULANS VAR PULLULANS', 'ALK-Abello, Inc.');
insert into Medication (DrugName, Company) values ('VIRACEPT', 'H.J. Harkins Company, Inc.');
insert into Medication (DrugName, Company) values ('La Prairie Switzerland', 'Juvena Produits de Beaute GMBH');
insert into Medication (DrugName, Company) values ('topcare severe sinus congestion', 'Topco Associates LLC');
insert into Medication (DrugName, Company) values ('Lemon Verbena Antibacterial Foaming Hand Wash', 'SJ Creations, Inc.');
insert into Medication (DrugName, Company) values ('LISINOPRIL AND HYDROCHLOROTHIAZIDE', 'St Marys Medical Park Pharmacy');
insert into Medication (DrugName, Company) values ('MBM 6 Liver', 'Wellness Center');
insert into Medication (DrugName, Company) values ('Zicam Cold Remedy Ultra Rapidmelts', 'Matrixx Initiatives, Inc.');
insert into Medication (DrugName, Company) values ('sunmark', 'McKesson');
insert into Medication (DrugName, Company) values ('METHOTREXATE', 'Rebel Distributors Corp');
insert into Medication (DrugName, Company) values ('Norditropin', 'Novo Nordisk');
insert into Medication (DrugName, Company) values ('anti nausea', 'Meijer Distribution Inc');
insert into Medication (DrugName, Company) values ('Etodolac', 'Apotex Corp.');
insert into Medication (DrugName, Company) values ('Ultimate Rescue', 'ABCO Laboratories, Inc.');
insert into Medication (DrugName, Company) values ('CVS COLD AND HOT MEDICATED XL', 'CVS PHARMACY, INC.');
insert into Medication (DrugName, Company) values ('Invirase', 'Genentech, Inc.');
insert into Medication (DrugName, Company) values ('SIMVASTATIN', 'St Marys Medical Park Pharmacy');
insert into Medication (DrugName, Company) values ('Methadone Hydrochloride', 'VistaPharm Inc');
insert into Medication (DrugName, Company) values ('Diazepam', 'Mylan Institutional Inc.');
insert into Medication (DrugName, Company) values ('Xylocaine', 'Cardinal Health');
insert into Medication (DrugName, Company) values ('Enalapril Maleate', 'Mylan Institutional Inc.');
insert into Medication (DrugName, Company) values ('Anticavity Fluoride Rinse', 'CVS Pharmacy, Inc');
insert into Medication (DrugName, Company) values ('Oxygen', 'Health Complex Medical Inc');
insert into Medication (DrugName, Company) values ('Solu-Medrol', 'REMEDYREPACK INC.');
insert into Medication (DrugName, Company) values ('Good Neighbor Pharmacy Cough DM ER', 'Amerisource Bergen');
insert into Medication (DrugName, Company) values ('Lovastatin', 'Bryant Ranch Prepack');
insert into Medication (DrugName, Company) values ('FLOVENT', 'Physicians Total Care, Inc.');
insert into Medication (DrugName, Company) values ('Aspirin', 'Time-Cap Labs, Inc');
insert into Medication (DrugName, Company) values ('Lidocaine Hydrochloride', 'REMEDYREPACK INC.');
insert into Medication (DrugName, Company) values ('White Petrolatum', 'Geritrex Corp.');
insert into Medication (DrugName, Company) values ('rexall bismuth', 'Dolgencorp Inc');
insert into Medication (DrugName, Company) values ('ANTI BACTERIAL HAND SANITIZER', 'Dolgencorp Inc');
insert into Medication (DrugName, Company) values ('Morphine Sulfate', 'Rhodes Pharmaceuticals L. P.');
insert into Medication (DrugName, Company) values ('Etodolac', 'Aphena Pharma Solutions - Tennessee, LLC');
insert into Medication (DrugName, Company) values ('Metoprolol Tartrate', 'REMEDYREPACK INC.');
insert into Medication (DrugName, Company) values ('Colgate', 'Mission Hills, S.A. de C.V.');
insert into Medication (DrugName, Company) values ('SHISEIDO FUTURE SOLUTION LX TOTAL RADIANCE FOUNDATION', 'SHISEIDO AMERICAS CORPORATION');
insert into Medication (DrugName, Company) values ('QUERCUS VIRGINIANA POLLEN', 'ALK-Abello, Inc.');
insert into Medication (DrugName, Company) values ('PROMETHAZINE HYDROCHLORIDE', 'STAT RX USA LLC');
insert into Medication (DrugName, Company) values ('Risperidone', 'Contract Pharmacy Services-PA');
insert into Medication (DrugName, Company) values ('REVITALIZING FACIAL FOAM', 'AMI Cosmetic Co.,Ltd.');
insert into Medication (DrugName, Company) values ('SUPER PLUS PERFECT BB', 'HANSKIN CO., LTD.');
insert into Medication (DrugName, Company) values ('Nu Skin Sunright 50 Broad Spectrum SPF 50', 'NSE Products, Inc.');
insert into Medication (DrugName, Company) values ('Childrens Acetaminophen', 'Rij Pharmaceutical Corporation');
insert into Medication (DrugName, Company) values ('NICOTINE TRANSDERMAL SYSTEM', 'Novartis Consumer Health, Inc.');
insert into Medication (DrugName, Company) values ('Oxygen', 'BayCare Home Care, Inc.');
insert into Medication (DrugName, Company) values ('Musco', 'Apotheca Company');
insert into Medication (DrugName, Company) values ('Paricalcitol', 'Banner Pharmacaps');
insert into Medication (DrugName, Company) values ('PARURE DE LUMIERE LIGHT-DIFFUSING FOUNDATION WITH SUNSCREEN MOISTURE INFUSION BROAD SPECTRUM SPF 25 12 ROSE CLAIR', 'Guerlain S.A.');
insert into Medication (DrugName, Company) values ('HyVee Alcohol Prep Pads', 'HY-VEE, INC.');
insert into Medication (DrugName, Company) values ('CIPROFLOXACIN', 'RedPharm Drug Inc.');
insert into Medication (DrugName, Company) values ('Silicea Kit Refill', 'Washington Homeopathic Products');
insert into Medication (DrugName, Company) values ('Finasteride', 'Camber Pharmaceuticals, Inc.');
insert into Medication (DrugName, Company) values ('Bupropion Hydrochloride', 'BluePoint Laboratories');
insert into Medication (DrugName, Company) values ('Ampicillin', 'Sandoz Inc');
insert into Medication (DrugName, Company) values ('Metoclopramide', 'Cardinal Health');
insert into Medication (DrugName, Company) values ('Chlorpromazine Hydrochloride', 'Sandoz Inc');
insert into Medication (DrugName, Company) values ('Oxygen', 'Ablecare Medical, Inc.');
insert into Medication (DrugName, Company) values ('up and up childrens multi symptom cold', 'Target Corporation');
insert into Medication (DrugName, Company) values ('OXYGEN', 'Jernigan Healthcare, Inc.');
insert into Medication (DrugName, Company) values ('Tincture Merthiolate', 'DLC Laboratories, Inc');
insert into Medication (DrugName, Company) values ('Pussy Willow', 'Nelco Laboratories, Inc.');
insert into Medication (DrugName, Company) values ('No7 Lifting and Firming Foundation Sunscreen SPF 15 Almond', 'BCM Cosmetique SAS');
insert into Medication (DrugName, Company) values ('Kadian', 'Actavis Kadian LLC');
insert into Medication (DrugName, Company) values ('TRETIN.X', 'Onset Dermatologics LLC');
insert into Medication (DrugName, Company) values ('FLURA-DROPS', 'KIRKMAN GROUP, INC.');
insert into Medication (DrugName, Company) values ('Plexion', 'Brava Pharmaceuticals, LLC');
insert into Medication (DrugName, Company) values ('PRINIVIL', 'Merck Sharp & Dohme Corp.');
insert into Medication (DrugName, Company) values ('Fiore Rx Almond Milk Matte Antifungal Nail Lacquer', 'Cosco International, Inc.');
insert into Medication (DrugName, Company) values ('Oxygen', 'Weiler Welding Company');
insert into Medication (DrugName, Company) values ('kirkland signature allerclear', 'Costco Wholesale Company');
insert into Medication (DrugName, Company) values ('LOSARTAN POTASSIUM and HYDROCHLOROTHIAZIDE', 'St Marys Medical Park Pharmacy');

insert into Insurance (Member_ID, Policy, Company) values ('Quo Lux', 'Zathin', 'Schamberger-Cole');
insert into Insurance (Member_ID, Policy, Company) values ('Otcom', 'Fixflex', 'Bernier Group');
insert into Insurance (Member_ID, Policy, Company) values ('Tampflex', 'Sonsing', 'Jakubowski Inc');
insert into Insurance (Member_ID, Policy, Company) values ('Tresom', 'Toughjoyfax', 'Runolfsdottir Inc');
insert into Insurance (Member_ID, Policy, Company) values ('Redhold', 'Bigtax', 'Schimmel-Aufderhar');
insert into Insurance (Member_ID, Policy, Company) values ('Alpha', 'Quo Lux', 'Schroeder, Bergnaum and Stamm');
insert into Insurance (Member_ID, Policy, Company) values ('Flexidy', 'Stringtough', 'Casper, Stoltenberg and Witting');
insert into Insurance (Member_ID, Policy, Company) values ('Viva', 'Keylex', 'Beer and Sons');
insert into Insurance (Member_ID, Policy, Company) values ('Fix San', 'Temp', 'Lang-Carter');
insert into Insurance (Member_ID, Policy, Company) values ('Bamity', 'Voyatouch', 'Kreiger, Rowe and Reilly');
insert into Insurance (Member_ID, Policy, Company) values ('Hatity', 'Bytecard', 'Aufderhar LLC');
insert into Insurance (Member_ID, Policy, Company) values ('Regrant', 'Sonsing', 'Oberbrunner, Skiles and Hammes');
insert into Insurance (Member_ID, Policy, Company) values ('Greenlam', 'Duobam', 'Hayes LLC');
insert into Insurance (Member_ID, Policy, Company) values ('Regrant', 'Mat Lam Tam', 'Gerlach, Berge and Bechtelar');
insert into Insurance (Member_ID, Policy, Company) values ('Cookley', 'Tin', 'Runolfsdottir Group');
insert into Insurance (Member_ID, Policy, Company) values ('Flexidy', 'Sonsing', 'Mante-Feest');
insert into Insurance (Member_ID, Policy, Company) values ('Flexidy', 'Temp', 'Kessler, Rau and Emmerich');
insert into Insurance (Member_ID, Policy, Company) values ('Konklab', 'Sub-Ex', 'Runolfsdottir and Sons');
insert into Insurance (Member_ID, Policy, Company) values ('Opela', 'Daltfresh', 'Hoppe, Fay and O''Hara');
insert into Insurance (Member_ID, Policy, Company) values ('Wrapsafe', 'Bitchip', 'Buckridge-Nikolaus');
insert into Insurance (Member_ID, Policy, Company) values ('Tempsoft', 'Alpha', 'Armstrong and Sons');
insert into Insurance (Member_ID, Policy, Company) values ('Tampflex', 'Biodex', 'Veum Inc');
insert into Insurance (Member_ID, Policy, Company) values ('Duobam', 'Quo Lux', 'Heathcote, Shanahan and Turner');
insert into Insurance (Member_ID, Policy, Company) values ('Alphazap', 'Tresom', 'Schimmel and Sons');
insert into Insurance (Member_ID, Policy, Company) values ('Vagram', 'Viva', 'Feest, Okuneva and Johns');
insert into Insurance (Member_ID, Policy, Company) values ('Bytecard', 'Zathin', 'Johns, Weimann and Olson');
insert into Insurance (Member_ID, Policy, Company) values ('Tempsoft', 'Cookley', 'Robel-Hammes');
insert into Insurance (Member_ID, Policy, Company) values ('It', 'Bamity', 'Rowe Inc');
insert into Insurance (Member_ID, Policy, Company) values ('Domainer', 'Solarbreeze', 'Torphy, Kessler and Vandervort');
insert into Insurance (Member_ID, Policy, Company) values ('Konklux', 'Domainer', 'Jaskolski Inc');
insert into Insurance (Member_ID, Policy, Company) values ('Tresom', 'Gembucket', 'Wintheiser, Predovic and Nienow');
insert into Insurance (Member_ID, Policy, Company) values ('Otcom', 'Andalax', 'Bauch-Ernser');
insert into Insurance (Member_ID, Policy, Company) values ('Bitwolf', 'Voltsillam', 'Bernier Inc');
insert into Insurance (Member_ID, Policy, Company) values ('Zamit', 'Asoka', 'Wehner Group');
insert into Insurance (Member_ID, Policy, Company) values ('Stim', 'Veribet', 'Gaylord, Denesik and Conn');
insert into Insurance (Member_ID, Policy, Company) values ('Subin', 'Prodder', 'Gutmann LLC');
insert into Insurance (Member_ID, Policy, Company) values ('Quo Lux', 'Alpha', 'Friesen and Sons');
insert into Insurance (Member_ID, Policy, Company) values ('Gembucket', 'Alphazap', 'Abernathy-Bechtelar');
insert into Insurance (Member_ID, Policy, Company) values ('Konklux', 'Solarbreeze', 'Schmeler, Purdy and Bradtke');
insert into Insurance (Member_ID, Policy, Company) values ('Y-find', 'Quo Lux', 'Kohler, Casper and Rice');
insert into Insurance (Member_ID, Policy, Company) values ('Y-find', 'It', 'Douglas-Pouros');
insert into Insurance (Member_ID, Policy, Company) values ('Bamity', 'Viva', 'Bergnaum Inc');
insert into Insurance (Member_ID, Policy, Company) values ('Ventosanzap', 'Otcom', 'Stroman, Hammes and Altenwerth');
insert into Insurance (Member_ID, Policy, Company) values ('Mat Lam Tam', 'Tin', 'Larkin Group');
insert into Insurance (Member_ID, Policy, Company) values ('Zoolab', 'Hatity', 'Yundt-Collier');

insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Lanny Ballance', '37 Cambridge Hill', 'Fresno', 'CA', '50058', '(559) 9841498', 'lballance0@dagondesign.com', '(508) 3620913');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Mignon Windham', '8 Buena Vista Road', 'Houston', 'TX', '60966', '(713) 3270827', 'mwindham1@archive.org', '(504) 2332728');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Noby Kilmister', '6464 Weeping Birch Alley', 'Washington', 'DC', '09931', '(202) 1283810', 'nkilmister2@edublogs.org', '(917) 7723892');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Christie Smewings', '2936 Wayridge Alley', 'Herndon', 'VA', '80781', '(757) 2674570', 'csmewings3@360.cn', '(713) 1984115');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Kellina Spoole', '15403 Spohn Terrace', 'Sioux Falls', 'SD', '70867', '(605) 6638356', 'kspoole4@hc360.com', '(786) 3144353');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Sasha Lemin', '7208 Hermina Terrace', 'Oklahoma City', 'OK', '20751', '(405) 7702095', 'slemin5@vistaprint.com', '(480) 4154569');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Vanda Iacobacci', '7124 Almo Court', 'Dulles', 'VA', '70338', '(571) 8843972', 'viacobacci6@twitter.com', '(907) 5919588');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Sidney Ponnsett', '23137 Heffernan Drive', 'Columbia', 'SC', '70946', '(803) 8904215', 'sponnsett7@homestead.com', '(501) 3971693');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Alvan Sukbhans', '4284 Lyons Point', 'Santa Fe', 'NM', '16168', '(505) 5423633', 'asukbhans8@whitehouse.gov', '(717) 4686347');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Hayden Marcoolyn', '0896 Grayhawk Hill', 'Clearwater', 'FL', '39953', '(813) 2493956', 'hmarcoolyn9@nifty.com', '(601) 1403945');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Donica Clewett', '6844 Hazelcrest Circle', 'Washington', 'DC', '69873', '(202) 6278264', 'dclewetta@infoseek.co.jp', '(540) 9740917');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Nanete Byatt', '733 Tennyson Trail', 'Escondido', 'CA', '31919', '(760) 8814670', 'nbyattb@ed.gov', '(479) 1127800');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Nahum Chandler', '4 Lukken Parkway', 'Salt Lake City', 'UT', '02969', '(801) 6621488', 'nchandlerc@edublogs.org', '(561) 6198818');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Wendall Hardwick', '6 Pawling Drive', 'Lake Charles', 'LA', '92898', '(337) 3281327', 'whardwickd@macromedia.com', '(262) 8170972');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Atalanta Freemantle', '9 Oriole Circle', 'Houston', 'TX', '55034', '(832) 7856701', 'afreemantlee@seattletimes.com', '(256) 8736900');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Trent Hurdidge', '7485 Russell Pass', 'Pasadena', 'CA', '19386', '(626) 3898628', 'thurdidgef@exblog.jp', '(540) 8526347');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Dianemarie Necolds', '946 Myrtle Terrace', 'Boca Raton', 'FL', '88087', '(305) 8003088', 'dnecoldsg@behance.net', '(304) 4346165');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Berny Guille', '7676 Debra Drive', 'Jackson', 'MS', '07137', '(601) 6990114', 'bguilleh@csmonitor.com', '(225) 7606125');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Leela Danilovitch', '79 1st Trail', 'Albuquerque', 'NM', '70597', '(505) 9901717', 'ldanilovitchi@craigslist.org', '(704) 8721293');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Doroteya Isitt', '6727 Macpherson Court', 'Atlanta', 'GA', '45303', '(404) 3186935', 'disittj@examiner.com', '(907) 7348441');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Yancey Lebang', '900 Bellgrove Trail', 'Phoenix', 'AZ', '07091', '(602) 8866831', 'ylebangk@csmonitor.com', '(316) 8900827');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Zachary Deverock', '81 Crownhardt Trail', 'Austin', 'TX', '72090', '(512) 6405390', 'zdeverockl@noaa.gov', '(479) 2941124');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Celestine Domenicone', '0 Pawling Terrace', 'Cincinnati', 'OH', '36701', '(513) 8823390', 'cdomeniconem@loc.gov', '(318) 3868952');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Carolin Thamelt', '04346 Continental Alley', 'Jacksonville', 'FL', '29330', '(904) 3664964', 'cthameltn@t.co', '(303) 6156715');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Morey Brotherhead', '462 Calypso Place', 'Charleston', 'WV', '28805', '(304) 3149665', 'mbrotherheado@businesswire.com', '(662) 4456674');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Nannette Pragnell', '74454 Dapin Drive', 'Shreveport', 'LA', '53928', '(318) 6518631', 'npragnellp@blogtalkradio.com', '(818) 2881163');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Alfredo Hutsby', '4513 Loomis Lane', 'Toledo', 'OH', '13488', '(419) 1966641', 'ahutsbyq@xinhuanet.com', '(808) 1303977');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Fidelio MacFall', '2309 Dunning Lane', 'Honolulu', 'HI', '04514', '(808) 5505015', 'fmacfallr@arizona.edu', '(479) 6393267');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Cesare Newcomen', '63 Swallow Terrace', 'Fresno', 'CA', '96869', '(559) 9944412', 'cnewcomens@exblog.jp', '(562) 7346874');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Marlowe Andreazzi', '3 Dryden Court', 'Duluth', 'GA', '18154', '(404) 1923515', 'mandreazzit@comcast.net', '(214) 5115339');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Eda Bramah', '1689 Bultman Pass', 'Houston', 'TX', '49175', '(713) 8530841', 'ebramahu@xrea.com', '(803) 9919669');
insert into Doctor (Name, WorkingAddress, City, State, ZipCode, PhoneNumber, Email, Fax) values ('Sib Batstone', '0 Sundown Street', 'Milwaukee', 'WI', '55148', '(262) 1753529', 'sbatstonev@devhub.com', '(760) 5475971');

insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Mathilda Minthorpe', '01/07/1999', '0898 Fair Oaks Circle', 'LA', 'Lake Charles', '54104', 'mminthorpe0@java.com', '(337) 2445689', 15, 7);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Felic Hayhurst', '01/24/1996', '352 Killdeer Hill', 'MN', 'Maple Plain', '09253', 'fhayhurst1@google.es', '(763) 2677226', 11, 29);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Myca Streat', '04/29/2003', '76 Mayfield Street', 'MD', 'Hagerstown', '41510', 'mstreat2@cyberchimps.com', '(240) 9862755', 14, 44);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Lela Turban', '08/04/1990', '63577 Lien Plaza', 'OH', 'Cincinnati', '38030', 'lturban3@bandcamp.com', '(513) 4433687', 10, null);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Rhett Utley', '09/15/1985', '997 Tennyson Road', 'FL', 'Zephyrhills', '33905', 'rutley4@gmpg.org', '(813) 6677961', 4, 22);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Doralia Beavers', '11/15/1966', '50292 Maple Point', 'NV', 'North Las Vegas', '28240', 'dbeavers5@list-manage.com', '(702) 9079550', 24, 4);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Wallache Ballintyne', '02/11/2001', '55384 Arapahoe Way', 'TX', 'Houston', '32956', 'wballintyne6@behance.net', '(281) 7733442', 12, 8);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Bobbi Hansie', '06/27/1968', '09 Troy Pass', 'FL', 'Miami', '01904', 'bhansie7@globo.com', '(786) 2450460', 28, 13);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Salim Veart', '03/25/1987', '301 Mandrake Center', 'OK', 'Oklahoma City', '34874', 'sveart8@so-net.ne.jp', '(405) 3882645', 21, 25);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Angela Aslie', '02/04/1986', '16 Sage Lane', 'CA', 'Los Angeles', '05557', 'aaslie9@jigsy.com', '(310) 5221975', 23, 39);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Raimondo Gosford', '11/20/1977', '88 Annamark Circle', 'WA', 'Seattle', '34422', 'rgosforda@com.com', '(425) 4109558', 3, 11);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Muffin Broggio', '01/08/1998', '03990 Fieldstone Terrace', 'KS', 'Wichita', '36756', 'mbroggiob@yale.edu', '(316) 3260663', 21, 12);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Benedikta Kernaghan', '11/17/1992', '47454 Farwell Hill', 'CT', 'Stamford', '72262', 'bkernaghanc@163.com', '(203) 9074870', 13, 4);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Aggi Hattrick', '11/19/1973', '4890 8th Alley', 'TX', 'Waco', '04825', 'ahattrickd@dyndns.org', '(254) 2720249', 18, 27);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Winthrop Tolussi', '10/05/2000', '39 Montana Way', 'MO', 'Saint Louis', '57935', 'wtolussie@rambler.ru', '(314) 6055434', 20, 38);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Cassie Dollimore', '01/23/1980', '2 Burrows Trail', 'TX', 'Midland', '34898', 'cdollimoref@deliciousdays.com', '(432) 5818876', 4, 44);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Ashlan Hardaker', '01/09/1986', '23342 International Park', 'AL', 'Mobile', '73857', 'ahardakerg@scribd.com', '(251) 7575588', 18, 27);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Kissee Beevors', '04/19/1978', '312 Meadow Ridge Park', 'KY', 'Lexington', '82144', 'kbeevorsh@bloomberg.com', '(859) 9027505', 3, 9);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('D''arcy Vance', '05/31/1967', '42387 Heffernan Alley', 'TX', 'Dallas', '24836', 'dvancei@usatoday.com', '(214) 8648981', 12, 4);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Gennie Kersaw', '08/18/1981', '01 Prairieview Place', 'NE', 'Omaha', '29300', 'gkersawj@salon.com', '(402) 7070252', 20, 15);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Violet Marl', '09/21/1967', '713 Evergreen Drive', 'WI', 'Green Bay', '20093', 'vmarlk@wordpress.org', '(920) 5782564', 26, 2);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Tommy Zamudio', '06/07/1969', '1 Sauthoff Alley', 'OH', 'Cincinnati', '90692', 'tzamudiol@bloglines.com', '(513) 8392662', 22, 44);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Fern D''Ruel', '09/28/1990', '5 Montana Road', 'CA', 'Burbank', '20316', 'fdruelm@bloglovin.com', '(323) 5450588', 15, 19);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Dora Benjefield', '10/21/1978', '477 Namekagon Drive', 'TX', 'Houston', '38117', 'dbenjefieldn@meetup.com', '(713) 3449386', 3, 40);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Rafaello Cottill', '02/27/1971', '82 Sage Terrace', 'AZ', 'Peoria', '30360', 'rcottillo@whitehouse.gov', '(928) 4042555', 17, 32);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Clayton Mosedale', '07/30/1970', '66737 Meadow Vale Hill', 'NV', 'Reno', '79928', 'cmosedalep@marriott.com', '(775) 3894846', 25, 5);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Elspeth Bowering', '09/28/1987', '2 Wayridge Way', 'IL', 'Chicago', '54458', 'eboweringq@homestead.com', '(312) 2577990', 18, 5);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Toinette Bristowe', '01/22/1967', '5 Brentwood Park', 'CO', 'Denver', '33292', 'tbristower@vkontakte.ru', '(720) 8858025', 3, 11);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Laughton Sutter', '10/12/1985', '0 Scott Park', 'OR', 'Portland', '17498', 'lsutters@hibu.com', '(503) 9712965', 8, 11);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Rick Aps', '02/23/1985', '012 Doe Crossing Place', 'NC', 'High Point', '68657', 'rapst@goodreads.com', '(336) 3410915', 11, 17);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Thane Dannell', '02/11/1986', '3 Fairfield Terrace', 'TX', 'Longview', '04423', 'tdannellu@stanford.edu', '(903) 8058256', 8, 38);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Marsh Driutti', '12/03/1982', '7 Fordem Court', 'NY', 'Rochester', '63933', 'mdriuttiv@bizjournals.com', '(585) 5874348', 4, 30);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Vania Margetts', '07/15/1974', '50 Shopko Park', 'GA', 'Atlanta', '59424', 'vmargettsw@pinterest.com', '(404) 2938598', 15, 7);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Jock Greson', '10/25/1969', '7774 Lunder Point', 'FL', 'Miami', '29529', 'jgresonx@shutterfly.com', '(305) 4147082', 19, 20);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Odille Turfin', '08/01/1974', '2 Reinke Plaza', 'IN', 'Indianapolis', '87654', 'oturfiny@google.cn', '(317) 2599252', 19, 44);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Martha Norker', '01/12/1989', '6344 Crescent Oaks Circle', 'NC', 'Durham', '78136', 'mnorkerz@usa.gov', '(919) 6977309', 20, 9);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Jacobo Petrolli', '03/07/1997', '7 Alpine Lane', 'WA', 'Tacoma', '62495', 'jpetrolli10@who.int', '(253) 5013681', 23, 39);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Yancy Stonner', '01/19/1965', '4143 Cottonwood Plaza', 'CO', 'Aurora', '55800', 'ystonner11@hugedomains.com', '(303) 2580157', 22, 21);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Emmott Cato', '05/23/2002', '72380 Kinsman Hill', 'TN', 'Memphis', '96508', 'ecato12@odnoklassniki.ru', '(901) 7124812', 14, 36);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Charlot Skiplorne', '08/22/1995', '2910 Artisan Avenue', 'WA', 'Tacoma', '34242', 'cskiplorne13@wiley.com', '(253) 2956515', 25, 25);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Tobe Rodenhurst', '02/26/2002', '61330 Moulton Trail', 'MN', 'Saint Paul', '41912', 'trodenhurst14@indiegogo.com', '(651) 4675235', 20, 12);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Miquela Caulcott', '02/25/2003', '60 Canary Point', 'VA', 'Virginia Beach', '12928', 'mcaulcott15@prweb.com', '(757) 9390833', 14, 11);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Roxi Cristofolini', '05/04/1987', '76 Nelson Junction', 'MN', 'Saint Paul', '25740', 'rcristofolini16@gnu.org', '(651) 5512711', 26, 34);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Emili Somner', '07/27/1980', '72 Grover Lane', 'MI', 'Lansing', '94960', 'esomner17@prlog.org', '(517) 5245975', 20, 37);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Giuseppe Shannahan', '07/06/1995', '8 Merry Avenue', 'WI', 'Milwaukee', '41051', 'gshannahan18@usa.gov', '(414) 9824813', 11, 8);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Kristal Switland', '01/04/1997', '167 Kipling Parkway', 'TX', 'Wichita Falls', '71297', 'kswitland19@ftc.gov', '(940) 3855785', 12, 9);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Doralynn Arnall', '11/14/2001', '7 Tennyson Way', 'GA', 'Marietta', '04850', 'darnall1a@histats.com', '(770) 4229372', 4, 38);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Kameko Lyngsted', '02/10/1985', '9 Forster Lane', 'LA', 'Shreveport', '31515', 'klyngsted1b@weebly.com', '(318) 3594574', 27, 19);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Charlotte Boyan', '06/27/2001', '7 Coolidge Point', 'GA', 'Atlanta', '39635', 'cboyan1c@dagondesign.com', '(404) 6222525', 13, 21);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Sergei Cahill', '10/28/1975', '55 Scoville Park', 'MO', 'Kansas City', '34019', 'scahill1d@timesonline.co.uk', '(816) 4862164', 2, 22);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Irving Ascough', '08/06/1979', '9805 Ridge Oak Trail', 'AL', 'Montgomery', '30760', 'iascough1e@phoca.cz', '(334) 8659995', 8, 16);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Myrilla Hassin', '06/11/1976', '637 Stoughton Hill', 'WV', 'Charleston', '67611', 'mhassin1f@booking.com', '(304) 6573332', 12, 34);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Gratiana Stonner', '05/15/1972', '3 Thompson Drive', 'TX', 'Dallas', '27702', 'gstonner1g@trellian.com', '(214) 7359007', 5, 32);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Ricky Walewski', '04/29/2000', '2817 Express Trail', 'MI', 'Detroit', '92443', 'rwalewski1h@oakley.com', '(313) 3489286', 1, 36);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Luciano Petkovic', '05/22/1990', '9 Manitowish Way', 'NY', 'Schenectady', '01489', 'lpetkovic1i@amazon.de', '(518) 8068607', 15, 34);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Jefferson Janaud', '01/02/1994', '195 Heffernan Court', 'PA', 'Bethlehem', '48281', 'jjanaud1j@princeton.edu', '(267) 4813165', 3, 25);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Trixy Mafham', '04/15/1997', '6333 Myrtle Crossing', 'KS', 'Topeka', '52542', 'tmafham1k@furl.net', '(785) 4517544', 29, 18);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Dela Camelli', '03/08/1990', '825 Manitowish Plaza', 'DC', 'Washington', '37366', 'dcamelli1l@usa.gov', '(202) 1287176', 12, 41);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Brunhilde Pitchford', '08/18/1984', '4 Karstens Way', 'FL', 'Tallahassee', '11696', 'bpitchford1m@blog.com', '(850) 3004216', 21, 34);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Winnie Foxwell', '02/05/1972', '824 Cambridge Court', 'FL', 'Hialeah', '01586', 'wfoxwell1n@macromedia.com', '(786) 1792711', 29, 15);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Washington Marling', '07/17/1988', '04875 Grayhawk Court', 'NY', 'New York City', '66722', 'wmarling1o@squarespace.com', '(212) 9021062', 11, 14);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Stace Snazel', '03/15/1995', '81706 Schiller Alley', 'DC', 'Washington', '78016', 'ssnazel1p@europa.eu', '(202) 8881493', 27, 33);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Parnell Marmion', '12/28/1990', '9565 Graceland Lane', 'FL', 'Melbourne', '26448', 'pmarmion1q@etsy.com', '(321) 1729025', 5, null);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Mabel Beckhouse', '01/02/1975', '2971 Bashford Street', 'OH', 'Akron', '31688', 'mbeckhouse1r@accuweather.com', '(330) 9556151', 22, 3);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Sascha Brandrick', '03/26/1978', '485 Crownhardt Hill', 'CA', 'Oakland', '39413', 'sbrandrick1s@twitpic.com', '(510) 3472613', 20, 19);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Gweneth Casterou', '07/30/2001', '6 Mendota Terrace', 'TX', 'Irving', '84701', 'gcasterou1t@microsoft.com', '(214) 4633465', 1, 24);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Vivian Sapshed', '12/18/1968', '8682 Rieder Road', 'CA', 'Santa Barbara', '27861', 'vsapshed1u@bizjournals.com', '(805) 1180104', 6, 9);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Erminie MacGilmartin', '11/06/1966', '508 Hallows Point', 'FL', 'Fort Myers', '93243', 'emacgilmartin1v@sitemeter.com', '(239) 4900386', 12, 23);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Nikki Foden', '03/29/1977', '843 Pankratz Terrace', 'LA', 'New Orleans', '57726', 'nfoden1w@wsj.com', '(504) 7753722', 15, 27);
insert into Patient (Name, DOB, Address, State, City, ZipCode, Email, PhoneNumber, PrimaryDoctor, Insurance_ID) values ('Jared Blachford', '11/16/1987', '7 Beilfuss Junction', 'TX', 'El Paso', '70580', 'jblachford1x@comsenz.com', '(915) 8829200', 13, 7);

insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (26, 7, 35, '05/23/2016', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (45, 7, 29, '03/16/2018', '09/09/2019', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (80, 2, 4, '10/24/2017', '09/27/2020', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (40, 6, 27, '07/02/2015', '08/14/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (81, 5, 67, '12/27/2017', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (14, 3, 8, '07/07/2015', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (83, 2, 23, '04/30/2016', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (79, 1, 21, '11/18/2016', '05/11/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (95, 3, 46, '05/16/2017', '07/22/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (75, 3, 46, '02/22/2017', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (6, 7, 62, '12/09/2016', '02/05/2020', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (14, 9, 34, '07/10/2018', '08/27/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (28, 7, 37, '01/26/2016', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (57, 2, 52, '08/06/2015', '02/06/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (50, 7, 46, '04/08/2016', '02/04/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (69, 7, 23, '11/29/2017', '01/24/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (20, 3, 57, '08/09/2018', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (42, 5, 18, '09/07/2015', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (53, 10, 7, '02/09/2016', '04/09/2020', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (99, 4, 64, '03/03/2015', '07/13/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (48, 7, 15, '12/12/2016', '03/25/2019', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (20, 4, 37, '10/11/2015', '11/17/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (12, 2, 19, '09/16/2017', '12/16/2020', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (80, 9, 28, '04/14/2017', '01/08/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (42, 7, 62, '10/26/2018', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (78, 4, 1, '03/19/2018', '05/25/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (41, 3, 14, '10/04/2018', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (9, 7, 62, '04/08/2017', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (30, 2, 47, '11/26/2016', '07/20/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (16, 1, 51, '11/22/2015', '07/18/2020', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (38, 8, 49, '07/19/2017', '07/19/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (68, 4, 22, '12/02/2015', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (50, 9, 37, '04/22/2015', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (93, 1, 4, '12/19/2017', '11/28/2020', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (30, 10, 52, '12/26/2015', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (77, 5, 6, '04/15/2015', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (61, 9, 53, '11/09/2016', '05/10/2019', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (48, 1, 13, '11/23/2018', '01/28/2020', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (70, 3, 7, '10/05/2016', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (49, 9, 13, '03/25/2015', '05/30/2019', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (18, 3, 6, '12/29/2017', '12/25/2019', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (4, 1, 32, '12/30/2017', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (46, 9, 26, '11/27/2016', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (82, 6, 13, '08/21/2017', '08/13/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (100, 3, 64, '03/11/2015', '10/31/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (79, 2, 69, '03/02/2016', null, false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (39, 6, 61, '11/03/2017', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (17, 3, 20, '06/30/2016', '10/14/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (14, 1, 1, '02/22/2015', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (70, 7, 14, '06/10/2017', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (83, 3, 38, '04/02/2015', '07/02/2019', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (12, 8, 49, '02/21/2017', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (63, 7, 27, '03/13/2018', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (39, 1, 22, '12/20/2015', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (16, 10, 6, '07/25/2015', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (13, 3, 51, '08/06/2018', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (52, 4, 7, '07/30/2015', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (96, 6, 28, '09/27/2017', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (69, 6, 15, '02/23/2017', '12/08/2018', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (56, 2, 33, '10/19/2017', '09/13/2019', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (33, 5, 47, '01/02/2016', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (24, 9, 25, '10/17/2016', '07/30/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (78, 4, 62, '08/11/2016', '07/28/2019', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (86, 2, 64, '09/02/2017', '11/09/2020', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (45, 5, 47, '05/11/2018', '11/19/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (83, 3, 59, '06/22/2017', '07/20/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (80, 10, 21, '05/02/2017', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (85, 9, 12, '07/08/2016', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (65, 7, 31, '05/14/2018', '04/30/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (71, 7, 9, '03/31/2016', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (9, 3, 57, '04/24/2015', '05/10/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (97, 6, 8, '05/05/2016', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (80, 6, 51, '12/03/2015', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (4, 10, 65, '09/18/2016', '10/08/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (46, 8, 44, '03/11/2016', '01/26/2020', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (58, 6, 12, '11/05/2016', '10/26/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (6, 5, 20, '08/11/2016', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (23, 7, 44, '12/03/2017', '07/29/2020', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (67, 2, 39, '09/13/2015', '06/03/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (89, 1, 20, '12/02/2015', '07/24/2022', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (25, 4, 16, '08/15/2017', null, true);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (68, 1, 5, '01/21/2016', '05/04/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (49, 7, 61, '05/18/2017', '11/13/2021', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (73, 4, 22, '05/02/2018', '01/28/2020', false);
insert into Prescription (NDC_Code, RefillNumber, Patient_ID, StartDate, EndDate, StillTaking) values (98, 6, 29, '03/06/2015', null, true);

insert into DocInsurance (Doctor_ID, Insurance_ID) values (9, 3);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (12, 23);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (17, 21);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (26, 19);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (14, 22);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (7, 4);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (19, 44);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (4, 25);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (22, 11);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (8, 21);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (10, 15);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (19, 9);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (2, 16);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (12, 4);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (29, 40);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (24, 33);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (15, 38);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (24, 19);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (19, 6);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (27, 18);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (28, 24);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (28, 5);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (10, 6);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (9, 26);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (13, 13);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (27, 44);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (18, 16);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (14, 11);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (3, 21);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (24, 41);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (2, 2);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (19, 19);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (29, 20);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (12, 35);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (30, 43);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (13, 6);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (10, 26);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (5, 26);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (19, 16);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (20, 9);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (18, 33);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (17, 33);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (7, 45);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (2, 39);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (3, 45);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (12, 29);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (17, 20);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (3, 31);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (15, 23);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (7, 21);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (28, 1);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (17, 1);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (17, 44);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (28, 15);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (13, 35);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (5, 33);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (21, 45);
insert into DocInsurance (Doctor_ID, Insurance_ID) values (4, 27);

insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Johnston-Johnson', '5957 Corry Avenue', 'Saint Louis', 'MO', '30070', 'Elbertine Ziehms', '(314) 3321860', '(941) 7975984');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Volkman-Gleichner', '1126 Victoria Point', 'Salt Lake City', 'UT', '78048', 'Irwin Steinham', '(801) 1935377', '(719) 9109982');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Von-Mohr', '9 Anderson Drive', 'Tempe', 'AZ', '03493', 'Tobye Billingsley', '(480) 6072573', '(775) 5532129');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Considine, Schneider and Hammes', '85182 Waubesa Point', 'Brooklyn', 'NY', '00457', 'Bianka Darque', '(347) 7583973', '(917) 2568884');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Beatty, Doyle and Breitenberg', '51482 Towne Way', 'Minneapolis', 'MN', '98215', 'Tessi Buchan', '(952) 1704916', '(907) 5072004');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Ernser, Lindgren and Homenick', '00 Stuart Place', 'Boston', 'MA', '35938', 'Prudi Sommerville', '(617) 1054515', '(786) 1249018');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Price and Sons', '42 Rieder Court', 'Greensboro', 'NC', '47301', 'Gladys Lestor', '(910) 4274178', '(832) 7566276');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Torp Group', '5 Emmet Pass', 'Gilbert', 'AZ', '84131', 'Read Briar', '(602) 9664957', '(978) 2474475');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('McGlynn Group', '9530 Randy Hill', 'Durham', 'NC', '35413', 'Donnie Beynon', '(919) 1829424', '(661) 5446682');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Schaden-Walsh', '2 Russell Park', 'Racine', 'WI', '61336', 'Ricky McCully', '(262) 7646054', '(760) 4901184');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Carter Group', '29 Vernon Way', 'Bakersfield', 'CA', '24172', 'Horacio Staig', '(661) 1993919', '(313) 9519606');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Bins-Zboncak', '06 Bayside Place', 'Fairfax', 'VA', '88009', 'Emlynn Gravy', '(571) 6027386', '(702) 2008545');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Lesch, Weber and Grady', '265 Lakeland Alley', 'Bozeman', 'MT', '73461', 'Corny Greser', '(406) 2732655', '(202) 8719182');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Farrell LLC', '5577 Superior Lane', 'Akron', 'OH', '26865', 'Crystie Bockett', '(330) 8921973', '(915) 6827481');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Bernhard Inc', '3 Eagle Crest Plaza', 'Fresno', 'CA', '46796', 'Gray McGilleghole', '(209) 5425542', '(773) 8080544');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Streich Inc', '94422 Laurel Parkway', 'Seminole', 'FL', '74412', 'Aretha Kitchingman', '(941) 8630761', '(513) 9913909');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Feil, Ankunding and Larkin', '629 Wayridge Pass', 'Milwaukee', 'WI', '95696', 'Romona Cardello', '(414) 8031099', '(267) 7553207');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Nikolaus-Schoen', '87121 Gale Parkway', 'Las Vegas', 'NV', '27810', 'Sandy Tabour', '(702) 1569561', '(313) 5552167');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Collins-Cole', '4369 Susan Trail', 'Iowa City', 'IA', '99821', 'Robers Gout', '(319) 5821849', '(203) 3435704');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Gutmann-Zboncak', '83 Comanche Pass', 'Ann Arbor', 'MI', '44960', 'Lucine Baudy', '(734) 3271056', '(713) 7169568');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Torp, Legros and Blick', '641 Jay Drive', 'Virginia Beach', 'VA', '80766', 'Bee Swinburne', '(757) 9744526', '(616) 4568217');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Weber, Pollich and Buckridge', '7560 Northview Hill', 'Fort Wayne', 'IN', '32372', 'Darn Patient', '(260) 1367269', '(208) 8071236');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Hammes LLC', '0264 Delladonna Way', 'Washington', 'DC', '68419', 'Austin Arnke', '(202) 1191705', '(404) 5406177');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Parker LLC', '91818 Dexter Road', 'Las Vegas', 'NV', '24242', 'Krispin Fenne', '(702) 1851117', '(661) 9847678');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Beier, Huels and Von', '665 Sage Avenue', 'Midland', 'MI', '12247', 'Aimee Yellowlea', '(989) 8542172', '(512) 3264393');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Quigley, Paucek and Hills', '070 Bartelt Junction', 'Young America', 'MN', '78458', 'Kelley Simond', '(952) 3512233', '(814) 1048621');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Moen, Ritchie and Franecki', '91844 Upham Drive', 'Chicago', 'IL', '50697', 'Nettie Melato', '(773) 4738549', '(941) 5749787');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Robel, Kihn and Schuster', '82825 Dunning Terrace', 'Hampton', 'VA', '12558', 'Roxie Popelay', '(757) 1689280', '(202) 8870738');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Runolfsson Inc', '8 Melody Avenue', 'White Plains', 'NY', '57528', 'Damara Ipsley', '(914) 6150308', '(202) 5296789');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Hettinger, Bruen and Emard', '3349 Huxley Point', 'Washington', 'DC', '17815', 'Keelia Moggan', '(202) 4598776', '(314) 7722803');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Bahringer-Kshlerin', '7095 Sunfield Lane', 'Denver', 'CO', '92354', 'Dawna Gave', '(303) 2472394', '(972) 1849674');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Crona-Reichel', '8 Thackeray Circle', 'Portland', 'OR', '86330', 'Lucie Garrioch', '(503) 6649415', '(504) 9688103');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Dach-Wilkinson', '51449 Northridge Parkway', 'Tampa', 'FL', '55926', 'Wit Lauga', '(813) 7475329', '(210) 4902497');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Waters, Terry and Swaniawski', '0658 Welch Circle', 'Albany', 'NY', '06501', 'Pearle Barehead', '(518) 7819386', '(915) 4881213');
insert into Pharmacy (PharmacyName, Address, City, State, ZipCode, Manager, PhoneNumber, Fax) values ('Abernathy-Bartell', '140 Harper Center', 'Tacoma', 'WA', '12144', 'Isidora Graal', '(253) 8317658', '(360) 5511015');

insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Olwen Theodoris', 'otheodoris0@nyu.edu', 16);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Thornton Ruler', 'truler1@netlog.com', 34);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Roldan Latchmore', 'rlatchmore2@noaa.gov', 27);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Drew Cragell', 'dcragell3@google.com.hk', 30);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Katharine Clurow', 'kclurow4@cbsnews.com', 7);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Arline Van Ross', 'avan5@java.com', 31);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Bridgette Walshaw', 'bwalshaw6@google.nl', 21);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Cristobal Gorvin', 'cgorvin7@wordpress.org', 11);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Rana MacCardle', 'rmaccardle8@nytimes.com', 3);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Chiquita Rigglesford', 'crigglesford9@g.co', 32);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Marybeth Norwell', 'mnorwella@paginegialle.it', 3);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Walden Davidsson', 'wdavidssonb@scribd.com', 11);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Maximilien Powter', 'mpowterc@yolasite.com', 26);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Rudd Sussems', 'rsussemsd@chron.com', 2);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Nancie Frany', 'nfranye@behance.net', 4);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Ediva Lewinton', 'elewintonf@techcrunch.com', 28);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Leroi Williscroft', 'lwilliscroftg@theguardian.com', 23);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Teena Tooker', 'ttookerh@skype.com', 6);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Alvie Band', 'abandi@jigsy.com', 22);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Foster Eisig', 'feisigj@archive.org', 10);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Louella Epsley', 'lepsleyk@naver.com', 35);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Dru Christofe', 'dchristofel@tuttocitta.it', 18);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Ferdinand Barthod', 'fbarthodm@craigslist.org', 9);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Byram Pinare', 'bpinaren@reuters.com', 33);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Fern Freiburger', 'ffreiburgero@salon.com', 27);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Flory Faulds', 'ffauldsp@craigslist.org', 22);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Philipa Kits', 'pkitsq@admin.ch', 23);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Lilith Spearett', 'lspearettr@bravesites.com', 22);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Khalil Treasure', 'ktreasures@hp.com', 30);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Renell Roostan', 'rroostant@chron.com', 2);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Roma Gogan', 'rgoganu@ftc.gov', 6);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Elayne Ashcroft', 'eashcroftv@altervista.org', 10);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Urbano Gosz', 'ugoszw@si.edu', 28);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Fredric Fust', 'ffustx@vinaora.com', 16);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Trula Grain', 'tgrainy@is.gd', 21);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Corrie Stenson', 'cstensonz@1688.com', 14);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Angel Greenhalf', 'agreenhalf10@google.co.jp', 26);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Hewett Narup', 'hnarup11@ox.ac.uk', 13);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Andy Ablett', 'aablett12@com.com', 5);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Tynan Lead', 'tlead13@aboutads.info', 31);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Charla Pidon', 'cpidon14@boston.com', 12);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Max MacNeely', 'mmacneely15@github.io', 33);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Astrix Yersin', 'ayersin16@slashdot.org', 9);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Bobbie Luchelli', 'bluchelli17@studiopress.com', 23);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Tandy Tattersdill', 'ttattersdill18@hostgator.com', 22);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Anne-corinne Deeney', 'adeeney19@w3.org', 22);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Cal Szymonowicz', 'cszymonowicz1a@mapy.cz', 19);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Randolf Hamlington', 'rhamlington1b@tinypic.com', 15);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Inez Bromell', 'ibromell1c@walmart.com', 26);
insert into Pharmacist (Name, Email, Pharmacy_ID) values ('Caty Goodlet', 'cgoodlet1d@wsj.com', 5);

insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (17, '46.59', '02/12/2018', 53);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (3, '58.75', '07/23/2019', 57);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (37, '73.20', '12/02/2021', 52);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (74, '86.11', '04/21/2018', 1);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (59, '08.99', '05/12/2021', 1);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (63, '53.20', '10/22/2021', 63);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (49, '36.41', '10/25/2015', 63);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (2, '52.49', '08/10/2021', 59);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (26, '32.79', '10/24/2020', 11);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (65, '00.52', '10/19/2015', 21);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (12, '46.13', '09/27/2017', 34);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (26, '64.94', '12/13/2017', 69);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (76, '07.89', '04/09/2022', 41);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (3, '15.43', '12/10/2016', 64);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (2, '12.92', '10/06/2017', 19);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (27, '98.74', '05/19/2019', 10);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (59, '06.49', '12/21/2016', 55);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (31, '65.37', '03/31/2015', 2);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (73, '32.26', '10/06/2020', 67);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (15, '96.44', '08/16/2015', 28);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (52, '00.16', '08/02/2020', 65);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (11, '36.13', '08/12/2015', 42);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (39, '73.94', '04/24/2022', 66);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (15, '65.65', '12/13/2017', 6);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (77, '34.83', '10/15/2020', 34);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (71, '14.42', '05/16/2018', 48);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (77, '90.34', '07/11/2016', 48);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (23, '88.61', '08/26/2021', 39);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (69, '40.29', '09/27/2018', 44);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (33, '76.56', '12/12/2019', 51);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (61, '51.18', '08/24/2020', 15);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (7, '86.15', '12/12/2021', 62);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (20, '05.90', '06/23/2019', 44);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (56, '85.20', '05/19/2019', 19);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (16, '36.69', '01/02/2018', 16);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (48, '29.09', '07/27/2019', 62);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (83, '93.00', '09/06/2016', 49);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (69, '81.02', '05/03/2019', 48);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (39, '22.90', '12/03/2015', 33);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (56, '43.47', '02/24/2020', 21);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (71, '82.27', '05/04/2017', 70);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (67, '62.57', '09/02/2016', 6);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (4, '62.64', '09/15/2017', 63);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (48, '19.62', '09/13/2017', 70);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (68, '85.34', '05/05/2022', 41);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (29, '19.15', '07/27/2020', 5);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (53, '78.49', '11/06/2021', 57);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (46, '69.22', '04/03/2022', 4);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (14, '51.78', '09/16/2016', 9);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (75, '64.17', '02/24/2021', 26);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (80, '15.18', '10/01/2021', 51);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (13, '55.61', '12/30/2019', 48);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (28, '82.78', '04/07/2017', 61);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (65, '69.00', '09/09/2021', 45);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (34, '58.21', '01/13/2022', 3);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (31, '47.43', '05/02/2015', 67);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (18, '66.10', '12/27/2019', 19);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (8, '92.32', '05/19/2021', 2);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (3, '73.26', '09/21/2017', 52);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (26, '69.07', '06/29/2021', 44);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (80, '54.89', '06/06/2019', 24);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (53, '09.92', '08/29/2019', 8);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (7, '88.19', '03/16/2018', 32);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (56, '75.36', '11/13/2022', 15);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (23, '08.95', '04/08/2019', 20);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (26, '81.12', '12/14/2017', 64);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (74, '32.94', '05/25/2016', 30);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (29, '28.98', '05/22/2021', 32);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (67, '05.99', '03/11/2021', 23);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (83, '48.58', '04/26/2022', 63);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (20, '58.78', '11/15/2019', 3);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (18, '08.86', '07/11/2019', 11);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (16, '01.62', '11/18/2015', 56);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (64, '13.90', '10/25/2016', 51);
insert into Orders (RxNumber, Total, OrderDate, Patient_ID) values (18, '57.65', '08/26/2022', 15);