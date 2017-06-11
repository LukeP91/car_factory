Job.create(name: "Inwentaryzacja", start_date: Date.new(2017,1,2), end_date: Date.new(2017,01,04))

User.create(first_name: "John", last_name: "Doe", email: "john_doe@example.com")

user_with_phone_not_accepted = User.create(first_name: "Josheph",
                                           last_name: "Doe",
                                           email: "joseph_doe@example.com")
Profile.create(user_id: user_with_phone_not_accepted.id,
               phone_number: "555123123",
               accepted_at: nil)

user_with_phone_accepted_1 = User.create(first_name: "John",
                                         last_name: "John",
                                         email: "john_john@example.com")
Profile.create(user_id: user_with_phone_accepted_1.id,
               phone_number: "555124124",
               accepted_at: Date.current)

user_with_phone_accepted_2 = User.create(first_name: "John",
                                         last_name: "Does",
                                         email: "john_does@example.com")
Profile.create(user_id: user_with_phone_accepted_2.id,
               phone_number: "555456445",
               accepted_at: Date.current)
Availability.create(user_id: user_with_phone_accepted_2.id,
                    day_off: Date.new(2017,1,1))
Availability.create(user_id: user_with_phone_accepted_2.id,
                    day_off: Date.new(2017,1,5))

user_with_phone_accepted_3 = User.create(first_name: "Paul",
                                         last_name: "Doe",
                                         email: "paul_doe@example.com")
Profile.create(user_id: user_with_phone_accepted_3.id,
               phone_number: "555789789",
               accepted_at: Date.current)
Availability.create(user_id: user_with_phone_accepted_3.id,
                    day_off: Date.new(2017,1,2))
Availability.create(user_id: user_with_phone_accepted_3.id,
                    day_off: Date.new(2017,1,10))