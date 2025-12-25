-- album (tidak ada data duplikat)
select 
	album_id, 
	title, 
	artist_id, 
	COUNT (*) as jumlah_data
from
	album
group by 1, 2, 3
having count(*) > 1;


-- artist (tidak ada data duplikat)
select 
	artist_id, 
	name, 
	count(*) as jumlah_data
from 
	artist
group by 1, 2
having count(*) > 1;


-- customer (tidak ada data duplikat)
select
	customer_id, first_name, last_name, company, address, city, state, 
	country, postal_code, phone, fax, email, support_rep_id, count(*) as jumlah_data 
from
	customer
group by 1, 2, 3, 4, 5, 6, 7, 8, 9 , 10, 11, 12, 13
having count(*) > 1;


-- employee (tidak ada data duplikat)
select
	employee_id, last_name, first_name, title, reports_to, birth_date, hire_date, 
	address, city, state, country, postal_code, phone, fax, email, count(*) as jumlah_data
from
	employee
group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
having count(*) > 1;


-- genre (tidak ada data duplikat)
select 
	genre_id,
	name,
	count(*) as jumlah_data
from 
	genre
group by 1, 2
having count(*) > 1;


-- invoice (tidak ada data duplikat)
select 
	invoice_id, customer_id, invoice_date, billing_address, billing_city, 
	billing_state, billing_country, billing_postal_code, total, count(*) as jumlah_data
from
	invoice
group by 1, 2, 3, 4, 5, 6, 7, 8, 9
having count(*) > 1;


-- invoice_line (tidak ada data duplikat)
select 
	invoice_line_id, invoice_id, track_id, unit_price, quantity, count(*) as jumlah_data
from
	invoice_line
group by 1, 2, 3, 4, 5
having count(*) > 1;


-- media_type (tidak ada data duplikat)
select 
	media_type_id, name, count(*) as jumlah_data
from
	media_type
group by 1, 2
having count(*) > 1;


-- playlist (tidak ada data duplikat)
select 
	playlist_id, name, count(*) as jumlah_data
from
	playlist
group by 1, 2
having count(*) > 1;


-- playlist_track (tidak ada data duplikat)
select
	playlist_id, track_id, count(*) as jumlah_data
from
	playlist_track
group by 1, 2
having count(*) > 1;


-- track (tidak ada data duplikat)
select 
	track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes,
	unit_price, count(*) as jumlah_data
from
	track
group by 1, 2, 3, 4, 5, 6, 7, 8, 9
having count(*) > 1;