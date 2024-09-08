def calculate_fare(vehicale_type, distance, is_discount):
    base_fare = 13
    van_fare = 15
    km_fare = 1.8

    if vehicale_type == "jeep":
        fare = base_fare
    elif vehicale_type == "van":
        base_fare = van_fare
    else:
        print("Invalid input")
        return 0
    
    if distance <= 4:
        fare = base_fare
    else:
        fare = base_fare + (distance - 4) * km_fare

    if is_discount: 
        discount_amount = fare *0.2 
        fare -= discount_amount

    return fare