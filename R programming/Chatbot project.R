concert_ticket <- function() { 
  print("Welcome to K-pop concert ticket")
  print("please type username and password to purchase ticket")
  
  attemps <- 0 
  
  while (attemps < 3 ) {
    un <- readline("Username: ")
    pw <- readline("Password: ")
    attemps <- attemps + 1 
    
    if (un == "Kpopticket" & pw == "1234") {
      print("Successfully login.")
      break 
    } else {
      if (attemps == 3) {
        print("Your account is locked.")
      } else {
        print("Please try again.")
      }
    }
  }
  
  concerts <- c("BTS Worldtour", "Agust D Worldtour", "Enhypen Worldtour", "NewJeans Worldtour")
  print(concerts)
  con <- readline(" Choose concert: ")
  
  date <- c("6 Apr","7 Apr", "10 Jun","11 Jun", "28 Jan","29 Jan","1 Nov", "2 Nov")
  if (con == concerts[1]) {
    print( date[1:2])
  } else if (con == concerts[2]) {
    print (date[3:4])
  } else if (con == concerts[3]) {
    print (date[5:6])
  } else if (con == concerts[4]) {
    print (date[7:8])
  }
  da <- readline("Choose date: ")
  
  zones <- c("Standing", "First floor", "Second floor", "Third floor")
  if (da == date[1] | da == date[2] | da == date[3] | da == date[4] |
      da == date[5] | da == date[6] | da == date[7] | da == date[8]) {
    print(zones)
    zo <- readline(" Choose zone:")
  } else {
    print(da)
  }
  
  payments <- c("Credit card", "Mobile banking")
  if (zo == zones[1] | zo == zones[2] | zo == zones[3] | zo == zones[4]) {
    print(payments)
    pay <- readline(" Choose payment: ")
    print("please don't close this window while doing purchase process")
  } else {
    print(zo)
  }
  
  if (pay == payments[1] | pay == payments[2]) {
    print(paste ("Thank you your ticket", con, "is successfully complete"))
  } else {
    print(pay)
  }
  }
