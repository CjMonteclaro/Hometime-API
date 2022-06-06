# Hometime API Readme

A rails api only application where you can recieve payloads in 2 different json formats. Uses MySQL database and POSTMAN to test the api.

## Install Dependencies
```
$ bundle install
```

## Create the Database
```
$ rails db:create
```

## Run the Migrations
```
$ rails db:migrate
```

## Run Server
```
$ rails s
```

## API Testing
Download POSTMAN for API testing
https://www.postman.com/downloads/

## Sending GET Request
In the workspace

1. Set your HTTP request to GET.
2. In the request URL field, input http://localhost:3000/api/v1/reservations
3. Click Send
4. You will see 200 OK Message
5. There should be a list reservation results in the body which indicates that your test has run successfully.

## Sending POST Request 

1. Set your HTTP request to POST.
2. In the request URL field, input http://localhost:3000/api/v1/reservations
3. Switch to the Body tab
4. In the Body tab, Click raw and select JSON
5. Copy and paste the JSON below for testing 
```
{
  "reservation_code": "YYY12345678",
  "start_date": "2021-04-14",
  "end_date": "2021-04-18",
  "nights": 4,
  "guests": 4,
  "adults": 2,
  "children": 2,
  "infants": 0,
  "status": "accepted",
  "guest": {
    "first_name": "Wayne",
    "last_name": "Woodbridge",
    "phone": "639123456789",
    "email": "wayne_woodbridge@bnb.com"
  },
  "currency": "AUD",
  "payout_price": "4200.00",
  "security_price": "500",
  "total_price": "4700.00"
}
```
OR
```
{
  "reservation": {
    "code": "XXX12345678",
    "start_date": "2021-03-12",
    "end_date": "2021-03-16",
    "expected_payout_amount": "3800.00",
    "guest_details": {
      "localized_description": "4 guests",
      "number_of_adults": 2,
      "number_of_children": 2,
      "number_of_infants": 0
    },
    "guest_email": "wayne_woodbridge@bnb.com",
    "guest_first_name": "Wayne",
    "guest_last_name": "Woodbridge",
    "guest_phone_numbers": [
      "639123456789",
      "639123456789"
    ],
    "listing_security_price_accurate": "500.00",
    "host_currency": "AUD",
    "nights": 4,
    "number_of_guests": 4,
    "status_type": "accepted",
    "total_paid_amount_accurate": "4300.00"
  }
}
```
6. Click Send

## Sending PATCH Request 

1. Set your HTTP request to PATCH.
2. In the request URL field, input http://localhost:3000/api/v1/reservations/1
3. Switch to the Body tab
4. In the Body tab, Click raw and select JSON
5. Copy and paste the JSON below for testing 
```
{
  "reservation_code": "YYY12345678",
  "start_date": "2021-04-14",
  "end_date": "2021-04-19",
  "nights": 5,
  "guests": 5,
  "adults": 2,
  "children": 2,
  "infants": 1,
  "status": "denied",
  "guest": {
    "first_name": "Wayne",
    "last_name": "Woodbridge",
    "phone": "639123456789",
    "email": "wayne_woodbridge@bnb.com"
  },
  "currency": "AUD",
  "payout_price": "4200.00",
  "security_price": "500",
  "total_price": "4700.00"
}
```
OR
```
{
  "reservation": {
    "code": "XXX12345678",
    "start_date": "2021-03-12",
    "end_date": "2021-03-19",
    "expected_payout_amount": "3800.00",
    "guest_details": {
      "localized_description": "7 guests",
      "number_of_adults": 5,
      "number_of_children": 2,
      "number_of_infants": 0
    },
    "guest_email": "wayne_woodbridge@bnb.com",
    "guest_first_name": "Wayne",
    "guest_last_name": "Woodbridge",
    "guest_phone_numbers": [
      "639123456789",
      "639123456789"
    ],
    "listing_security_price_accurate": "500.00",
    "host_currency": "AUD",
    "nights": 7,
    "number_of_guests": 7,
    "status_type": "accepted",
    "total_paid_amount_accurate": "4300.00"
  }
}
```
6. Click Send