def calculate_fare():
    type_of_vehicle = input("What type of vehicle are you on (jeep (1)/van (2): ")
    distance = (int(input("how far is your destination: ")))
    distance2 = float(distance)
    discount = input("Are you a student/PWD/senior citizen (y/n): ")
    base_fare = 13
    van_fare = 15
    km_fare = 1.8

    if type_of_vehicle == "1":
        fare = base_fare
    
    elif type_of_vehicle == "2":
        base_fare = van_fare
    
    else:
        print("Invalid input")
        return 
    
    if distance2 <= 4:
        fare = base_fare
    else:
        fare = base_fare + (distance2 - 4) * km_fare

    if discount.lower() == "y":  # Check for "yes" in any case
        discount_amount = fare * 0.2  # Calculate 20% discount
        fare -= discount_amount  # Apply the discount
        print("Discount applied: ₱", discount_amount)


    print("Your fare is: ₱", int(fare))

calculate_fare()