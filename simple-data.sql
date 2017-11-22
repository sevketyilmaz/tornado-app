USE tornadoDB;


INSERT INTO `customer_states` (`id`, `name`) VALUES
(1, 'Active'),
(2, 'Suspend'),
(3, 'Deleted');


INSERT INTO `customers` (`id`, `birth_date`, `first_name`, `last_name`, `email`, `gsm`, `gender`, `password`, `customer_state_id`) VALUES
(1, '2001-01-01', 'david', 'john', 'rogers63@dot.com', '00905326400001','F', '321', 1),
(2, '2001-01-02', 'rogers', 'paul', 'mike28@dot.com', '00905326400002', 'M', '321', 1),
(3, '2001-01-03', 'david', 'john', 'rivera92@dot.com', '00905326400003', 'M', '321', 1),
(4, '2001-01-04', 'maria', 'sanders', 'ross95@dot.com', '00905326400004', 'M', '321', 1),
(5, '2001-01-05', 'morris', 'miller', 'paul85@dot.com', '00905326400005', 'F', '321', 1),
(6, '2001-01-06', 'daniel', 'michael', 'smith34@dot.com', '00905326400006', 'F', '321', 1),
(7, '2001-01-07', 'sanders', 'paul', 'james84@dot.com', '00905326400007', 'F', '321', 1),
(8, '2001-01-08', 'mark', 'mike', 'daniel53@dot.com', '00905326400008', 'M', '321', 1),
(9, '2001-01-09', 'morgan', 'maria', 'brooks80@dot.com', '00905326400009', 'F', '321', 1),
(10, '2001-01-10', 'paul', 'miller', 'morgan65@dot.com', '00905326400010', 'F', '321', 1),
(11, '2001-01-11', 'david', 'miller', 'sanders84@dot.com', '00905326400011', 'F', '321', 1),
(12, '2001-01-12', 'chrishaydon', 'bell', 'maria40@dot.com', '00905326400012', 'F', '321', 1);


INSERT INTO `rents` (`id`, `customer_id`) VALUES
(1, 1),
(2, 3),
(3, 7);

INSERT INTO `rent_item_states` (`id`, `name`) VALUES
(1, 'Take'),
(2, 'Drop');


INSERT INTO `bike_park_states` (`id`, `name`) VALUES
(1, 'On_Park'),
(2, 'On_Rent'),
(3, 'On_KTM'),
(4, 'On_Repair');


INSERT INTO `bike_park_details` (`id`, `name`, `bike_park_state_id`) VALUES
(1, 'Bike1', 1),
(2, 'Bike2', 1),
(3, 'Bike3', 3),
(4, 'Bike4', 4),
(5, 'Bike5', 1),
(6, 'Bike6', 1),
(7, 'Bike7', 1),
(8, 'Bike8', 1);




INSERT INTO `rent_items` (`id`, `rent_id`, `bike_park_detail_id`, `rent_item_state_id`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 2, 5, 1),
(4, 3, 8, 1),
(5, 3, 8, 2);




INSERT INTO `country_lists` (`id`, `iso`, `name`, `tr_name`, `iso3`, `phone_code`) VALUES
(1, 'TR', 'TURKEY', 'Türkiye', 'TUR', 90),
(2, 'BE', 'BELGIUM', 'Belçika', 'BEL', 32),
(3, 'DE', 'GERMANY', 'Almanya', 'DEU', 49),
(4, 'GR', 'GREECE', 'Yunanistan', 'GRC', 30),
(5, 'NL', 'NETHERLANDS', 'Hollanda', 'NLD', 31);


INSERT INTO `city_lists` (`id`, `country_list_id`, `name`, `nice_name`, `plate_number`) VALUES
(1, 1 ,'IZM', 'IZMIR', 35),
(2, 1, 'IST', 'ISTANBUL', 34),
(3, 1, 'ANK', 'ANKARA', 06);


INSERT INTO `places` (`id`, `city_list_id`, `name`) VALUES
(1, 1, 'IYTE'),
(2, 1, 'EGE');


INSERT INTO `stations` (`id`, `place_id`, `name`) VALUES
(1, 1, 'Merkezi Yemekhane'),
(2, 1, 'KYK'),
(3, 1, 'Makina Muh.'),
(4, 1, 'SKS');


INSERT INTO `parks` (`id`, `station_id`, `name`) VALUES
(1, 1, 'P1'),
(2, 1, 'P2'),
(3, 1, 'P3'),
(4, 1, 'P4'),
(5, 1, 'P5'),
(6, 1, 'P6'),
(7, 1, 'P7'),
(8, 1, 'P8'),
(9, 1, 'P9'),
(10, 1, 'P10'),
(11, 2, 'P11'),
(12, 2, 'P12'),
(13, 2, 'P13'),
(14, 2, 'P14'),
(15, 3, 'P15'),
(16, 4, 'P16'),
(17, 4, 'P17'),
(18, 4, 'P18'),
(19, 4, 'P19');


INSERT INTO `slots` (`id`, `park_id`, `name`) VALUES
(1, 1, 'S1'),
(2, 1, 'S2'),
(3, 2, 'S3'),
(4, 2, 'S4'),
(5, 3, 'S5'),
(6, 4, 'S6'),
(7, 5, 'S7'),
(8, 6, 'S8'),
(9, 7, 'S9'),
(10, 8, 'S10'),
(11, 9, 'S11'),
(12, 10, 'S12'),
(13, 11, 'S13'),
(14, 12, 'S14'),
(15, 13, 'S15'),
(16, 14, 'S16'),
(17, 15, 'S17'),
(18, 16, 'S18'),
(20, 17, 'S19'),
(21, 18, 'S20'),
(22, 19, 'S21');

