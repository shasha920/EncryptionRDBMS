#hash passphrase
SET @key_str = SHA2('My secret passphrase', 512);

#look at the database
USE world;

#quick look at the table
SELECT * FROM countrylanguage LIMIT 5;

#convert the data in the column into binary byte strings of length 255
ALTER TABLE countrylanguage MODIFY COLUMN Percentage varbinary(255);

#encrypt the column
UPDATE countrylanguage SET Percentage = AES_ENCRYPT(Percentage, @key_str);

# look at the table
SELECT * FROM countrylanguage LIMIT 5;

#AES is symmetric, use the same key for both encryption and decryption
SELECT cast(AES_DECRYPT(Percentage, @key_str) as char(255)) FROM countrylanguage;

