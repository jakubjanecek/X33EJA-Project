INSERT INTO X33EJA.BANKBRANCH (ID, NAME) VALUES (1234, 'čvutBank');

INSERT INTO X33EJA.USERDATA (ID, ROLEUSER, USERNAME, PASSWORD) VALUES (1000, 'admin', 'admin', 'admin');
INSERT INTO X33EJA.USERDATA (ID, ROLEUSER, USERNAME, PASSWORD) VALUES (2000, 'customer', 'customer', 'customer');
INSERT INTO X33EJA.USERDATA (ID, ROLEUSER, USERNAME, PASSWORD) VALUES (3000, 'admin', 'admin1', 'admin1');

INSERT INTO X33EJA.CONTACT (ID, HOUSENUMBER, PHONENUMBER1, CITY, PHONENUMBER2, STREET, EMAIL, ZIP) VALUES (1500, '123', '777777777', 'Praha', '607123456', 'I. P. Pavlova', 'admin@cvutbank.cz', 15000);
INSERT INTO X33EJA.CONTACT (ID, HOUSENUMBER, PHONENUMBER1, CITY, PHONENUMBER2, STREET, EMAIL, ZIP) VALUES (2500, '456', '602789456', 'Hradec Králové', NULL, NULL, 'klient@seznam.cz', 45036);
INSERT INTO X33EJA.CONTACT (ID, HOUSENUMBER, PHONENUMBER1, CITY, PHONENUMBER2, STREET, EMAIL, ZIP) VALUES (3500, '4568', '951753684', 'Olomouc', '165743987', 'Jiráskova', 'admin1@cvutbank.cz', 45698);

INSERT INTO X33EJA.PERSON (ID, DTYPE, NAME, SURNAME, USERDATA_ID, PHONENUMBER, CONTACT_ID) VALUES (10000, 'Employee', 'Zaměstnanec', 'Zaměstnanecký', 1000, '777777777', 1500);
INSERT INTO X33EJA.PERSON (ID, DTYPE, NAME, SURNAME, USERDATA_ID, PHONENUMBER, CONTACT_ID) VALUES (20000, 'Customer', 'Klient', 'Klientský', 2000, '602789456', 2500);
INSERT INTO X33EJA.PERSON (ID, DTYPE, NAME, SURNAME, USERDATA_ID, PHONENUMBER, CONTACT_ID) VALUES (30000, 'Employee', 'Další', 'Zaměstnanec', 3000, '951753684', 3500);

INSERT INTO X33EJA.MESSAGE (ID, DATEMESS, TEXT) VALUES (13030, '2009-12-08', 'Důležitá zpráva pro klienty...');
INSERT INTO X33EJA.MESSAGE (ID, DATEMESS, TEXT) VALUES (23030, '2009-12-24', 'Vánoceééé :)');
INSERT INTO X33EJA.MESSAGE (ID, DATEMESS, TEXT) VALUES (33030, '2010-01-07', 'Konéééc :)');

INSERT INTO X33EJA.BANKBRANCH_PERSON (BANKBRANCH_ID, EMPLOYEES_ID) VALUES (1234, 10000);
INSERT INTO X33EJA.BANKBRANCH_PERSON (BANKBRANCH_ID, EMPLOYEES_ID) VALUES (1234, 30000);

INSERT INTO X33EJA.BANKBRANCH_MESSAGE (BANKBRANCH_ID, SENTMESSAGES_ID) VALUES (1234, 13030);
INSERT INTO X33EJA.BANKBRANCH_MESSAGE (BANKBRANCH_ID, SENTMESSAGES_ID) VALUES (1234, 23030);
INSERT INTO X33EJA.BANKBRANCH_MESSAGE (BANKBRANCH_ID, SENTMESSAGES_ID) VALUES (1234, 33030);

INSERT INTO X33EJA.PERSON_PERSON (CUSTOMERS_ID, ADVISORS_ID) VALUES (20000, 10000);
INSERT INTO X33EJA.PERSON_PERSON (CUSTOMERS_ID, ADVISORS_ID) VALUES (20000, 30000);

INSERT INTO X33EJA.ACCOUNT (ID, BALANCE, NUMBER, CUSTOMER_ID) VALUES (9000, 1000, '123456789', 20000);
INSERT INTO X33EJA.ACCOUNT (ID, BALANCE, NUMBER, CUSTOMER_ID) VALUES (8000, 5000, '987654321', 20000);
INSERT INTO X33EJA.ACCOUNT (ID, BALANCE, NUMBER, CUSTOMER_ID) VALUES (6543, 2345, '0', NULL);

INSERT INTO X33EJA.BANKTRANSACTION (ID, MESSAGE, SPECSYM, CONSSYM, VARSYM, AMOUNT, DATETRANS, TOACCOUNT_ID, FROMACCOUNT_ID) VALUES (60000, 'T#1', 1, 2, 3, 100, '2010-01-06', 8000, 9000);
INSERT INTO X33EJA.BANKTRANSACTION (ID, MESSAGE, SPECSYM, CONSSYM, VARSYM, AMOUNT, DATETRANS, TOACCOUNT_ID, FROMACCOUNT_ID) VALUES (90000, 'T#3', 3, 1, 1, 200, '2009-12-03', 9000, 8000);
INSERT INTO X33EJA.BANKTRANSACTION (ID, MESSAGE, SPECSYM, CONSSYM, VARSYM, AMOUNT, DATETRANS, TOACCOUNT_ID, FROMACCOUNT_ID) VALUES (30000, 'T#2', 2, 3, 2, 300, '2009-12-26', 8000, 9000);

INSERT INTO X33EJA.TEMPLATE (ID, MESSAGE, SPECSYM, CONSSYM, VARSYM, AMOUNT, ACCOUNT) VALUES (100000, 'šablona 1', 12, 3, 7, 222, '123456789');
INSERT INTO X33EJA.TEMPLATE (ID, MESSAGE, SPECSYM, CONSSYM, VARSYM, AMOUNT, ACCOUNT) VALUES (200000, 'šablona 2', 35, 2, 4, 333, '987654321');
INSERT INTO X33EJA.TEMPLATE (ID, MESSAGE, SPECSYM, CONSSYM, VARSYM, AMOUNT, ACCOUNT) VALUES (300000, 'zpráva pro příjemce', 5, 2, 5, 111, '123456789');

INSERT INTO X33EJA.PERSON_TEMPLATE (CUSTOMER_ID, TEMPLATES_ID) VALUES (20000, 100000);
INSERT INTO X33EJA.PERSON_TEMPLATE (CUSTOMER_ID, TEMPLATES_ID) VALUES (20000, 300000);
INSERT INTO X33EJA.PERSON_TEMPLATE (CUSTOMER_ID, TEMPLATES_ID) VALUES (10000, 200000);