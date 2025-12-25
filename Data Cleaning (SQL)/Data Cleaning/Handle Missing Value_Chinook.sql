
-- NOTE: Tidak ada missing value di hampir semua tabel, kecuali customer, invoice dan track. FOKUS pada bagian kolom CUSTOMER dan INVOICE saja. karena hanya itu yang diubah.

-- album (tidak ada missing value)
select * from album
where album_id is null or title is null or title = '' or artist_id is null;


-- artist (tidak ada missing value)
select * from artist
where artist_id is null or name is null;

-----------------------------------------------------------------------------------------------------------------------

-- customer (ada missing value)
select * from customer	
where 
	customer_id is null or first_name is null or last_name is null or company is null or address is null
	or city is null or state is null or country is null or postal_code is null or phone is null
	or fax is null or email is null or support_rep_id is null;



-- missing value terdapat di kolom company, state, postal_code dan fax, mari handle satu-persatu.

select * from customer where company is null;
-- COMPANY
-- dari 59 customer sebanyak 49 customer, company = null, ini menandakan sebagian besar transaksi individu, bukan mewakili suatu perusahaan.
-- nilai NULL di company tidak akan diubah, karena nanti ketika visualisasi bisa dilakukan grouping (customer individual/perusahaan)

-- STATE
-- terdapat 29 customer yang memiliki state null. Tapi tidak mungkin dihapus karena total customer cuman 59, nanti akan sangat berpengaruh pada data.
-- solusi: karena country dan city TIDAK ada yang NULL, maka state akan diisi manual berdasarkan city dan country

select distinct city, state, country from customer where state is null;


-- mengupdate state berdasarkan city dan country:
UPDATE customer
SET
    state =
        CASE
            WHEN city = 'Buenos Aires' AND country = 'Argentina' THEN 'Autonomous City of Buenos Aires'
            WHEN city = 'Dijon' AND country = 'France' THEN 'Bourgogne Franche Comte'
            WHEN city = 'Bangalore' AND country = 'India' THEN 'Karnataka'
            WHEN city = 'London' AND country = 'United Kingdom' THEN 'England'
            WHEN city = 'Madrid' AND country = 'Spain' THEN 'Community of Madrid'
            WHEN city = 'Frankfurt' AND country = 'Germany' THEN 'Hessen'
            WHEN city = 'Warsaw' AND country = 'Poland' THEN 'Mazovia'
            WHEN city = 'Copenhagen' AND country = 'Denmark' THEN 'Hovedstaden'
            WHEN city = 'Prague' AND country = 'Czech Republic' THEN 'Prague Region'
            WHEN city = 'Helsinki' AND country = 'Finland' THEN 'Uusimaa'
            WHEN city = 'Vienne' AND country = 'Austria' THEN 'Vienna'
            WHEN city = 'Delhi' AND country = 'India' THEN 'National Capital Territory of Delhi'
            WHEN city = 'Lisbon' AND country = 'Portugal' THEN 'Lisbon Region'
            WHEN city = 'Bordeaux' AND country = 'France' THEN 'Nouvelle Aquitaine'
            WHEN city = 'Paris' AND country = 'France' THEN 'Île de France'
            WHEN city = 'Oslo' AND country = 'Norway' THEN 'Oslo'
            WHEN city = 'Santiago' AND country = 'Chile' THEN 'Santiago Metropolitan Region'
            WHEN city = 'Berlin' AND country = 'Germany' THEN 'Berlin'
            WHEN city = 'Edinburgh' AND country = 'United Kingdom' THEN 'Scotland'
            WHEN city = 'Lyon' AND country = 'France' THEN 'Auvergne Rhône Alpes'
            WHEN city = 'Stuttgart' AND country = 'Germany' THEN 'Baden Württemberg'
            WHEN city = 'Budapest' AND country = 'Hungary' THEN 'Budapest'
            WHEN city = 'Stockholm' AND country = 'Sweden' THEN 'Stockholm County'
            WHEN city = 'Porto' AND country = 'Portugal' THEN 'Porto District'
            WHEN city = 'Brussels' AND country = 'Belgium' THEN 'Brussels Capital Region'
            ELSE state
        END
WHERE
    (city = 'Buenos Aires' AND country = 'Argentina') OR
    (city = 'Dijon' AND country = 'France') OR
    (city = 'Bangalore' AND country = 'India') OR
    (city = 'London' AND country = 'United Kingdom') OR
    (city = 'Madrid' AND country = 'Spain') OR
    (city = 'Frankfurt' AND country = 'Germany') OR
    (city = 'Warsaw' AND country = 'Poland') OR
    (city = 'Copenhagen' AND country = 'Denmark') OR
    (city = 'Prague' AND country = 'Czech Republic') OR
    (city = 'Helsinki' AND country = 'Finland') OR
    (city = 'Vienne' AND country = 'Austria') OR
    (city = 'Delhi' AND country = 'India') OR
    (city = 'Lisbon' AND country = 'Portugal') OR
    (city = 'Bordeaux' AND country = 'France') OR
    (city = 'Paris' AND country = 'France') OR
    (city = 'Oslo' AND country = 'Norway') OR
    (city = 'Santiago' AND country = 'Chile') OR
    (city = 'Berlin' AND country = 'Germany') OR
    (city = 'Edinburgh' AND country = 'United Kingdom') OR
    (city = 'Lyon' AND country = 'France') OR
    (city = 'Stuttgart' AND country = 'Germany') OR
    (city = 'Budapest' AND country = 'Hungary') OR
    (city = 'Stockholm' AND country = 'Sweden') OR
    (city = 'Porto' AND country = 'Portugal') OR
    (city = 'Brussels' AND country = 'Belgium')
        
select * from customer where state is null;
select * from customer
        
-- POSTAL CODE
-- postal code terdapat 4 data yang kosong dari 59 data customer. untuk sekarang 
-- akan dibiarkan (masih bingung mending dibiarkan atau diisi manual sesuai conutry dan city)

select * from customer where postal_code is null;

-- FAX
-- dari 59 data customer terdapat 47 kolom fax yang null
-- karena jumlahnya besar tidak bisa dihapus barisnya, dan akan dibiarkan saja, karena menurutku kurang begitu penting untuk analisis,
-- alasannya karena setiap customer di data ini pasti punya setidaknya 1 yang bisa dihubungi, kalau fax / no telp gk ada, masih ada email.
-- tidak ada yang benar-benar tidak punya kontak (tidak ada fax, phone, dan email)
-- silahkan run query ini:
select * from customer where fax is null and phone is null and email is null;

        

-----------------------------------------------------------------------------------------------------------------------
-- employee (tidak ada missing value) (missing value reports_to di general manager, karena dia general manager, tidak perlu reports_to)
select * from employee
where 
	employee_id is null or last_name is null or first_name is null or title is null or reports_to is null
	or birth_date is null or hire_date is null or address is null or city is null or state is null or country is null 
	or postal_code is null or phone is null or fax is null or email is null;


-- genre (tidak ada missing value)
select * from genre
where genre_id is null or name is null;


----------------------------------------------------------------------------------------------------------------------

-- invoice (ada missing value, tapi itu tergantung missing value customer)
select * from invoice
where
	invoice_id is null or customer_id is null or invoice_date is null or billing_address is null or billing_city is null
	or billing_state is null or billing_country is null or billing_postal_code is null or total is null;

select * from invoice where billing_state is null;

-- Missing value pada kolom billing_state di tabel Invoice akan diganti berdasarkan kolom state pada tabel customer.

UPDATE invoice i
SET
    billing_state = c.state
FROM
    customer c
WHERE
    i.customer_id = c.customer_id AND 
    c.city = i.billing_city AND -- memastikan customer mem-billing sesuai pada alamat asli di c.state
    i.billing_state IS NULL AND
    c.state IS NOT NULL;


----------------------------------------------------------------------------------------------------------------------

-- invoice_line (tidak ada missing value)
select * from invoice_line
where invoice_line_id is null or invoice_id is null or track_id is null or unit_price is null or quantity is null;


-- media_type (tidak ada missing value)
select * from media_type
where media_type_id is null or name is null; 


-- playlist (tidak ada missing value)
select * from playlist
where playlist_id is null or name is null; 


-- playlist_track (tidak ada missing value)
select * from playlist_track
where playlist_id is null or track_id is null;


-- track (ada missing value, hanya di kolom composer, tidak bisa direplace dengan asal isi, tidak bisa dihapus karena missing value sebanyak 900+ data, maka abaikan saja karena tidak terlalu penting/berpengaruh)
select * from track
where 
	track_id is null or name is null or album_id is null or media_type_id is null or genre_id is null
	or composer is null or milliseconds is null or bytes is null or unit_price is null;