# [LARAVEL] Simple API Project for Event Management
 Create database schedule to accomodate storing event data and export functionalities through HTTP API. There are 6 Service with different endpoint.

### Service

Service and Endpoint will listed as below:

| Service | Method |Akses | Description
| ------ | ------ | ------ | -----
| Create Location | POST | /api/location/create | Service to Create Location
| Create Event | POST | /api/event/create | Service To Create Event 
| Create Ticket	 | POST | /api/event/ticket/create | Service To Create Ticket
| Get Event | GET | /api/event/get_info | Service to get event detail
| Purchase Ticket | POST | /api/transaction/purchase | Service to handle User Purchase Activity
| Transcation Detail | GET | /api/transaction/get_info	 | Service to get Detail Transaction

### Prequisite
- Import event_management.sql file to local Mysql
- Import Ticket.postman_collection.json postman
- Import Ticketing System.postman_environment.json postman

### Create Location
Prequisite : Have data on city table
To Create New Location you need Data:
- location_detail (required|text)
- id_city (required|integer|must exists in city column id)

### Create Event
Prequisite : Have data on locations table
- name (required | text)
- id_location (required | integer |must exists in location column id)
- description (required | text)
- ticket_sale_open (required|date_format:Y-m-d H:i|after_or_equal:today)
- ticket_sale_close (required|date_format:Y-m-d H:i|after:ticket_sale_open)
- event_open_time (required|date_format:Y-m-d H:i|after:ticket_sale_close)
- event_close_time (required|date_format:Y-m-d H:i|after:event_open_time)
- event_image (required|mimes:jpeg,jpg,png)
contoh :

### Create Ticket
Prequisite : Have data on event table
- id_event (required|integer|must exists in event column id)
- name (required|text)
- price (text)
- quote (numeric)

### Purchase Ticket
Prequisite : Have data on user table, event, ticket
- id_user (required | numeric | must exists in users column id)
- id_event (required | numeric | must exists in event column id)
- tickets (required | array [{ticket_id, quote}])

### Get Event
Get event Detail {{hosts}}/api/event/get_info/3

### Transcation Detail
Get transacation Detail {{hosts}}/api/transaction/get_info/1

### Tech Stack 
-  Laravel 7.24
-  Mysql 5.7
-  Postman Chrome Extension Version 5.5.5
