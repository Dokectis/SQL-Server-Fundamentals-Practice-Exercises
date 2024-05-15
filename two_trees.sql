--this script can be run over and over if you would like to rebuild your database at anytime
use sandbox;
GO

drop table if exists [dbo].[additional_product]
drop table if exists [dbo].[additional_service]
drop table if exists [dbo].[product_order]
drop table if exists [dbo].[customer]
drop table if exists [dbo].[city_state_zip]
drop table if exists [dbo].[product]
drop table if exists [dbo].[oil_flavor]
drop table if exists [dbo].[product_type]
GO

CREATE TABLE [dbo].[additional_product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[sku] [varchar](15) NOT NULL,
	[product_name] [varchar](30) NOT NULL,
	[size_oz] [int] NOT NULL,
	[price] [decimal](5, 2) NOT NULL,
	CONSTRAINT [PK__additional_product] PRIMARY KEY CLUSTERED 
	(
		[product_id] ASC
	)
)
PRINT 'Table [additional_product] created successfully.';
GO


CREATE TABLE [dbo].[additional_service](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[sku] [varchar](15) NOT NULL,
	[srvc_name] [varchar](50) NOT NULL,
	[min_participants] [int] NULL,
	[per_person_price] [decimal](5, 2) NOT NULL,
	[min_price] [decimal](5, 2) NOT NULL,
	CONSTRAINT [PK__additional_service] PRIMARY KEY CLUSTERED 
	(
		[service_id] ASC
	)
)
PRINT 'Table additional_service created successfully.';
GO

CREATE TABLE [dbo].[city_state_zip](
	[city_state_zip_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [varchar](200) NULL,
	[state_name] [varchar](100) NULL,
	[zip] [varchar](10) NULL,
	CONSTRAINT [PK__city_state_zip] PRIMARY KEY CLUSTERED 
	(
		[city_state_zip_id] ASC
	)
)
PRINT 'Table city_state_zip created successfully.';
GO

CREATE TABLE [dbo].[customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[full_name] [varchar](200) NOT NULL,
	[phone_number] [varchar](25) NULL,
	[street_address] [varchar](250) NOT NULL,
	[city_state_zip_id] [int] NOT NULL,
	CONSTRAINT [PK__customer] PRIMARY KEY CLUSTERED 
	(
		[customer_id] ASC
	)
)
PRINT 'Table customer created successfully.';
GO

ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK__customer__city_state_zip_id] 
	FOREIGN KEY([city_state_zip_id]) REFERENCES [dbo].[city_state_zip] ([city_state_zip_id])
GO

ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK__customer__city_state_zip_id]
GO

CREATE TABLE [dbo].[oil_flavor](
	[flavor_id] [int] IDENTITY(1,1) NOT NULL,
	[flavor_name] [varchar](50) NULL,
	CONSTRAINT [PK__oil_flavor] PRIMARY KEY CLUSTERED 
	(
		[flavor_id] ASC
	)
)
PRINT 'Table oil_flavor created successfully.';
GO

CREATE TABLE [dbo].[product_type](
	[product_type_id] [int] IDENTITY(1,1) NOT NULL,
	[product_type] [varchar](50) NULL,
	CONSTRAINT [PK__product_type] PRIMARY KEY CLUSTERED 
	(
		[product_type_id] ASC
	)
)
PRINT 'Table product_type created successfully.';
GO

CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[flavor_id] [int] NULL,
	[product_type_id] [int] NULL,
	[price] [decimal](5, 2) NULL,
	CONSTRAINT [PK__product] PRIMARY KEY CLUSTERED 
	(
		[product_id] ASC
	)
)
PRINT 'Table product created successfully.';
GO

ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__flavor_id] 
	FOREIGN KEY([flavor_id]) REFERENCES [dbo].[oil_flavor] ([flavor_id])
GO

ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__flavor_id]
GO

ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__product_type] 
	FOREIGN KEY([product_type_id]) REFERENCES [dbo].[product_type] ([product_type_id])
GO

ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__product_type]
GO

CREATE TABLE [dbo].[product_order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [date] NULL,
	[customer_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[order_total] [decimal](6, 2) NULL,
	CONSTRAINT [PK__product_order] PRIMARY KEY CLUSTERED 
	(
		[order_id] ASC
	)
)
PRINT 'Table product_order created successfully.';
GO

ALTER TABLE [dbo].[product_order]  WITH CHECK ADD  CONSTRAINT [FK__product_order__customer_id] 
	FOREIGN KEY([customer_id]) REFERENCES [dbo].[customer] ([customer_id])
GO

ALTER TABLE [dbo].[product_order] CHECK CONSTRAINT [FK__product_order__customer_id]
GO

ALTER TABLE [dbo].[product_order]  WITH CHECK ADD  CONSTRAINT [FK__product_order__product_id] 
	FOREIGN KEY([product_id]) REFERENCES [dbo].[product] ([product_id])
GO

ALTER TABLE [dbo].[product_order] CHECK CONSTRAINT [FK__product_order__product_id]
GO

set nocount on 

SET IDENTITY_INSERT [dbo].[city_state_zip] ON 
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (1, N'Anaheim', N'California', N'92812')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (2, N'Anchorage', N'Alaska', N'99512')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (3, N'Appleton', N'Wisconsin', N'54915')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (4, N'Arvada', N'Colorado', N'80005')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (5, N'Atlanta', N'Georgia', N'31106')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (6, N'Baltimore', N'Maryland', N'21275')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (7, N'Birmingham', N'Alabama', N'35225')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (8, N'Bismarck', N'North Dakota', N'58505')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (9, N'Boston', N'Massachusetts', N'02203')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (10, N'Boston', N'Massachusetts', N'02216')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (11, N'Brea', N'California', N'92822')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (12, N'Brooklyn', N'New York', N'11205')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (13, N'Brooklyn', N'New York', N'11210')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (14, N'Chattanooga', N'Tennessee', N'37405')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (15, N'Chicago', N'Illinois', N'60604')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (16, N'Chicago', N'Illinois', N'60641')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (17, N'Cincinnati', N'Ohio', N'45999')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (18, N'Cleveland', N'Ohio', N'44118')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (19, N'Columbia', N'South Carolina', N'29208')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (20, N'Columbus', N'Georgia', N'31914')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (21, N'Columbus', N'Ohio', N'43204')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (22, N'Corpus Christi', N'Texas', N'78475')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (23, N'Dallas', N'Texas', N'75358')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (24, N'Davenport', N'Iowa', N'52804')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (25, N'Dayton', N'Ohio', N'45454')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (26, N'Des Moines', N'Iowa', N'50330')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (27, N'Duluth', N'Minnesota', N'55805')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (28, N'El Paso', N'Texas', N'88563')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (29, N'Fresno', N'California', N'93715')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (30, N'Gadsden', N'Alabama', N'35905')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (31, N'Garden Grove', N'California', N'92844')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (32, N'Greensboro', N'North Carolina', N'27404')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (33, N'Greensboro', N'North Carolina', N'27499')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (34, N'Helena', N'Montana', N'59623')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (35, N'Huntsville', N'Alabama', N'35815')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (36, N'Indianapolis', N'Indiana', N'46278')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (37, N'Jamaica', N'New York', N'11470')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (38, N'Jamaica', N'New York', N'11480')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (39, N'Lansing', N'Michigan', N'48930')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (40, N'Lansing', N'Michigan', N'48956')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (41, N'Los Angeles', N'California', N'90040')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (42, N'Louisville', N'Kentucky', N'40287')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (43, N'Memphis', N'Tennessee', N'38114')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (44, N'Merrifield', N'Virginia', N'22119')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (45, N'Minneapolis', N'Minnesota', N'55441')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (46, N'New Haven', N'Connecticut', N'06510')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (47, N'New Orleans', N'Louisiana', N'70174')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (48, N'New York City', N'New York', N'10039')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (49, N'Norfolk', N'Virginia', N'23520')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (50, N'Oklahoma City', N'Oklahoma', N'73124')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (51, N'Orlando', N'Florida', N'32858')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (52, N'Pensacola', N'Florida', N'32505')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (53, N'Peoria', N'Illinois', N'61629')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (54, N'Philadelphia', N'Pennsylvania', N'19146')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (55, N'Pittsburgh', N'Pennsylvania', N'15235')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (56, N'Port Charlotte', N'Florida', N'33954')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (57, N'Pueblo', N'Colorado', N'81015')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (58, N'Raleigh', N'North Carolina', N'27658')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (59, N'Reno', N'Nevada', N'89505')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (60, N'Richmond', N'Virginia', N'23242')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (61, N'Sacramento', N'California', N'95823')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (62, N'Saint Paul', N'Minnesota', N'55108')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (63, N'Saint Petersburg', N'Florida', N'33731')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (64, N'San Antonio', N'Texas', N'78240')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (65, N'San Antonio', N'Texas', N'78260')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (66, N'San Antonio', N'Texas', N'78285')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (67, N'San Bernardino', N'California', N'92415')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (68, N'San Diego', N'California', N'92153')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (69, N'San Diego', N'California', N'92186')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (70, N'San Francisco', N'California', N'94154')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (71, N'San Francisco', N'California', N'94177')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (72, N'San Luis Obispo', N'California', N'93407')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (73, N'Santa Barbara', N'California', N'93150')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (74, N'Santa Rosa', N'California', N'95405')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (75, N'Scottsdale', N'Arizona', N'85255')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (76, N'Silver Spring', N'Maryland', N'20918')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (77, N'Sioux City', N'Iowa', N'51105')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (78, N'Tampa', N'Florida', N'33661')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (79, N'Temple', N'Texas', N'76505')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (80, N'Topeka', N'Kansas', N'66606')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (81, N'Topeka', N'Kansas', N'66642')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (82, N'Trenton', N'New Jersey', N'08619')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (83, N'Tulsa', N'Oklahoma', N'74141')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (84, N'Vero Beach', N'Florida', N'32964')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (85, N'Waco', N'Texas', N'76796')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (86, N'Washington', N'District of Columbia', N'20036')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (87, N'Washington', N'District of Columbia', N'20420')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (88, N'Washington', N'District of Columbia', N'20525')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (89, N'Washington', N'District of Columbia', N'20557')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (90, N'White Plains', N'New York', N'10606')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (91, N'Wichita', N'Kansas', N'67230')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (92, N'Winston Salem', N'North Carolina', N'27116')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (93, N'Winston Salem', N'North Carolina', N'27157')
GO
INSERT [dbo].[city_state_zip] ([city_state_zip_id], [city_name], [state_name], [zip]) VALUES (94, N'Young America', N'Minnesota', N'55557')
GO
SET IDENTITY_INSERT [dbo].[city_state_zip] OFF
GO
SET IDENTITY_INSERT [dbo].[customer] ON 
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (1, N'Cally', N'Reynolds', N'Cally Reynolds', N'(901) 166-8355', N'556 Lakewood Park', 8)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (2, N'Sydney', N'Bartlett', N'Sydney Bartlett', N'(982) 231-7357', N'4829 Badeau Parkway', 14)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (3, N'Hunter', N'Newton', N'Hunter Newton', N'(831) 996-1240', N'2 Rockefeller Avenue', 85)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (4, N'Brooke', N'Perkins', N'Brooke Perkins', N'(340) 732-9367', N'87 Brentwood Park', 23)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (5, N'Nolan', N'Slater', N'Nolan Slater', N'(540) 487-5928', N'99 Sage Street', 59)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (6, N'Germaine', N'Green', N'Germaine Green', N'(466) 455-4160', N'6 Jana Park', 64)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (7, N'Medge', N'Ratliff', N'Medge Ratliff', N'(358) 751-8227', N'75 Erie Terrace', 25)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (8, N'Nash', N'Vasquez', N'Nash Vasquez', N'(989) 937-6199', N'39464 Debra Lane', 94)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (9, N'Michael', N'Rutledge', N'Michael Rutledge', N'(366) 822-4574', N'8231 Crowley Crossing', 17)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (10, N'Guy', N'Ochoa', N'Guy Ochoa', N'(720) 242-4596', N'92483 Doe Crossing Drive', 40)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (11, N'Coby', N'Lucas', N'Coby Lucas', N'(177) 816-3420', N'7316 Dryden Road', 43)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (12, N'Merrill', N'Freeman', N'Merrill Freeman', N'(838) 734-1768', N'7746 Mitchell Point', 46)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (13, N'Rae', N'Hawkins', N'Rae Hawkins', N'(484) 158-4493', N'181 Packers Way', 10)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (14, N'Sade', N'Santiago', N'Sade Santiago', N'(497) 492-4618', N'2 Farragut Crossing', 2)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (15, N'Judith', N'Leonard', N'Judith Leonard', N'(549) 439-1744', N'2 Namekagon Trail', 82)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (16, N'Malik', N'Faulkner', N'Malik Faulkner', N'(186) 520-2519', N'8 Gerald Point', 51)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (17, N'Benjamin', N'Miranda', N'Benjamin Miranda', N'(992) 329-4925', N'40 Lighthouse Bay Circle', 63)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (18, N'Rhona', N'Stanley', N'Rhona Stanley', N'(237) 294-5071', N'992 Haas Avenue', 69)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (19, N'Amena', N'Petersen', N'Amena Petersen', N'(383) 554-7219', N'6625 Lukken Circle', 12)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (20, N'Lucas', N'Trevino', N'Lucas Trevino', N'(176) 773-9482', N'78 Summer Ridge Alley', 27)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (21, N'Dorian', N'Dale', N'Dorian Dale', N'(311) 929-6026', N'9843 Graceland Point', 39)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (22, N'Shellie', N'Velez', N'Shellie Velez', N'(197) 282-8671', N'5204 Beilfuss Place', 21)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (23, N'Rhonda', N'Wilder', N'Rhonda Wilder', N'(653) 854-3876', N'92 Northfield Terrace', 42)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (24, N'Tyrone', N'Powell', N'Tyrone Powell', N'(113) 724-9255', N'91955 Mosinee Parkway', 36)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (25, N'Raja', N'Wells', N'Raja Wells', N'(244) 178-1821', N'62 Warner Place', 88)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (26, N'Adara', N'Langley', N'Adara Langley', N'(696) 810-8990', N'88 Burning Wood Junction', 1)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (27, N'Jerry', N'Gill', N'Jerry Gill', N'(491) 955-1047', N'229 Golden Leaf Road', 30)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (28, N'Arden', N'Bennett', N'Arden Bennett', N'(959) 194-1875', N'6502 Montana Junction', 47)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (29, N'Philip', N'Ware', N'Philip Ware', N'(615) 720-3672', N'58034 Nelson Street', 86)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (30, N'Clementine', N'Oliver', N'Clementine Oliver', N'(603) 332-7827', N'6 Granby Drive', 80)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (31, N'Iliana', N'Hester', N'Iliana Hester', N'(716) 866-7734', N'3409 Oriole Point', 53)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (32, N'Francesca', N'Hodges', N'Francesca Hodges', N'(324) 686-7614', N'609 Everett Avenue', 26)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (33, N'Sydney', N'Robertson', N'Sydney Robertson', N'(304) 577-5758', N'3061 Sachs Lane', 75)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (34, N'Amery', N'Washington', N'Amery Washington', N'(191) 476-0002', N'710 Old Gate Circle', 16)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (35, N'Barrett', N'Howell', N'Barrett Howell', N'(538) 115-5665', N'0864 Bluestem Center', 61)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (36, N'Lunea', N'Rios', N'Lunea Rios', N'(311) 982-5690', N'289 Porter Crossing', 76)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (37, N'Wynter', N'Roberts', N'Wynter Roberts', N'(721) 262-6519', N'89318 Heffernan Crossing', 73)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (38, N'Melyssa', N'Gates', N'Melyssa Gates', N'(263) 976-2589', N'419 Tennyson Court', 72)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (39, N'Quail', N'Vance', N'Quail Vance', N'(229) 484-5107', N'25 Green Plaza', 24)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (40, N'Rose', N'Holcomb', N'Rose Holcomb', N'(129) 823-5800', N'6755 Burrows Center', 20)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (41, N'Ayanna', N'Foreman', N'Ayanna Foreman', N'(146) 146-9356', N'30 Gulseth Junction', 70)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (42, N'Jael', N'Rice', N'Jael Rice', N'(394) 444-6027', N'68316 Emmet Trail', 68)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (43, N'Anastasia', N'Owens', N'Anastasia Owens', N'(423) 401-3016', N'86432 Westridge Alley', 91)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (44, N'Zephr', N'Mcgee', N'Zephr Mcgee', N'(708) 764-4578', N'2 Nevada Junction', 55)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (45, N'Roth', N'Black', N'Roth Black', N'(330) 983-4433', N'605 Bunting Road', 90)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (46, N'Calvin', N'Henry', N'Calvin Henry', N'(327) 821-0113', N'52 Sachtjen Avenue', 78)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (47, N'Joshua', N'Delaney', N'Joshua Delaney', N'(838) 282-2276', N'62 Karstens Junction', 83)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (48, N'Laith', N'Jordan', N'Laith Jordan', N'(868) 659-6715', N'7468 Talmadge Junction', 6)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (49, N'Blaine', N'Ashley', N'Blaine Ashley', N'(261) 759-5806', N'561 Basil Court', 32)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (50, N'Mollie', N'Meyers', N'Mollie Meyers', N'(309) 329-9140', N'4276 Hallows Terrace', 65)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (51, N'Oleg', N'Merritt', N'Oleg Merritt', N'(513) 912-4721', N'874 Leroy Hill', 74)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (52, N'Zephr', N'Fry', N'Zephr Fry', N'(166) 472-2547', N'6 Manitowish Trail', 81)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (53, N'Nolan', N'Robertson', N'Nolan Robertson', N'(822) 296-4465', N'8698 Crest Line Parkway', 19)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (54, N'Astra', N'Edwards', N'Astra Edwards', N'(177) 600-1729', N'5733 Walton Center', 37)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (55, N'Adena', N'Jenkins', N'Adena Jenkins', N'(342) 731-9079', N'22577 Starling Lane', 15)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (56, N'Sasha', N'King', N'Sasha King', N'(733) 104-5058', N'86073 Sloan Way', 57)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (57, N'Kenneth', N'Potts', N'Kenneth Potts', N'(976) 544-1168', N'1 Springview Circle', 34)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (58, N'Roanna', N'Acevedo', N'Roanna Acevedo', N'(868) 464-7466', N'7 Cottonwood Plaza', 52)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (59, N'Debra', N'Finley', N'Debra Finley', N'(542) 954-1230', N'3627 Pine View Circle', 18)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (60, N'Shay', N'Davidson', N'Shay Davidson', N'(934) 777-4129', N'423 Kenwood Park', 79)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (61, N'Kyla', N'Hebert', N'Kyla Hebert', N'(715) 654-8147', N'4 Manufacturers Pass', 33)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (62, N'Josiah', N'Wagner', N'Josiah Wagner', N'(700) 742-7671', N'58 Melvin Pass', 35)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (63, N'Hadley', N'Sosa', N'Hadley Sosa', N'(222) 150-9436', N'95567 Browning Crossing', 84)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (64, N'Karly', N'Hardin', N'Karly Hardin', N'(106) 281-7513', N'9776 Beilfuss Parkway', 18)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (65, N'Molly', N'Grant', N'Molly Grant', N'(689) 843-0460', N'791 Cherokee Court', 44)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (66, N'Jaime', N'Craig', N'Jaime Craig', N'(375) 915-2089', N'7189 Pankratz Point', 25)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (67, N'Wesley', N'Rush', N'Wesley Rush', N'(722) 576-0563', N'24812 Cordelia Trail', 22)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (68, N'Dustin', N'Daugherty', N'Dustin Daugherty', N'(951) 720-1227', N'207 Bunting Street', 77)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (69, N'Kyle', N'Keith', N'Kyle Keith', N'(578) 125-5684', N'795 Troy Terrace', 5)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (70, N'Chester', N'Best', N'Chester Best', N'(608) 587-5791', N'102 Fallview Terrace', 45)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (71, N'Kaden', N'Sharpe', N'Kaden Sharpe', N'(246) 987-2818', N'99 Hanson Way', 60)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (72, N'Shafira', N'Bennett', N'Shafira Bennett', N'(279) 911-0843', N'9 Roth Place', 25)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (73, N'Zena', N'Washington', N'Zena Washington', N'(921) 805-5150', N'823 Glacier Hill Point', 67)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (74, N'Eric', N'Donaldson', N'Eric Donaldson', N'(714) 520-4254', N'62597 Lighthouse Bay Drive', 56)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (75, N'Indira', N'Odom', N'Indira Odom', N'(714) 947-5101', N'2 Hovde Plaza', 62)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (76, N'Savannah', N'Conner', N'Savannah Conner', N'(361) 128-7285', N'52509 Almo Lane', 58)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (77, N'Graham', N'Frederick', N'Graham Frederick', N'(707) 474-5854', N'22 Superior Way', 9)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (78, N'Chastity', N'Charles', N'Chastity Charles', N'(186) 176-2590', N'22278 Waubesa Road', 7)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (79, N'Leslie', N'Pace', N'Leslie Pace', N'(623) 686-1821', N'839 Pepper Wood Street', 28)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (80, N'Nasim', N'Sheppard', N'Nasim Sheppard', N'(930) 295-6752', N'5 Melvin Street', 48)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (81, N'Yoko', N'Travis', N'Yoko Travis', N'(818) 864-3843', N'3149 Kinsman Court', 92)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (82, N'Brody', N'Love', N'Brody Love', N'(360) 338-4848', N'96 Eliot Way', 29)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (83, N'Mona', N'Matthews', N'Mona Matthews', N'(723) 808-1834', N'32174 Ridge Oak Plaza', 71)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (84, N'Jenna', N'Hendricks', N'Jenna Hendricks', N'(840) 746-9696', N'33837 Independence Place', 50)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (85, N'Sydney', N'Dejesus', N'Sydney Dejesus', N'(110) 771-1999', N'3 Morning Circle', 71)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (86, N'Hedy', N'Vang', N'Hedy Vang', N'(383) 134-3234', N'1876 Petterle Court', 11)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (87, N'Gray', N'Gutierrez', N'Gray Gutierrez', N'(496) 849-2265', N'7271 Ramsey Way', 87)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (88, N'Cailin', N'Alford', N'Cailin Alford', N'(368) 400-8301', N'282 Acker Terrace', 93)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (89, N'Erasmus', N'Neal', N'Erasmus Neal', N'(774) 548-5638', N'907 Briar Crest Terrace', 73)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (90, N'Derek', N'Conrad', N'Derek Conrad', N'(275) 477-2907', N'6 Carioca Crossing', 4)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (91, N'Melinda', N'Price', N'Melinda Price', N'(748) 701-8010', N'318 Park Meadow Hill', 66)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (92, N'Rebekah', N'Nelson', N'Rebekah Nelson', N'(447) 121-6473', N'8117 Straubel Plaza', 38)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (93, N'Ronan', N'Mendez', N'Ronan Mendez', N'(302) 847-0643', N'3849 Northport Parkway', 3)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (94, N'Brock', N'Case', N'Brock Case', N'(544) 534-1984', N'602 Sommers Parkway', 49)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (95, N'Theodore', N'Brock', N'Theodore Brock', N'(662) 476-0315', N'400 Summit Lane', 13)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (96, N'Serena', N'Malone', N'Serena Malone', N'(137) 440-1643', N'30 Onsgard Crossing', 41)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (97, N'Eagan', N'Bray', N'Eagan Bray', N'(529) 738-3373', N'55617 Straubel Drive', 54)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (98, N'Nicole', N'Mcconnell', N'Nicole Mcconnell', N'(892) 616-0264', N'8 Delaware Hill', 31)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (99, N'Kamal', N'Newton', N'Kamal Newton', N'(704) 685-9968', N'718 Lakewood Parkway', 3)
GO
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [full_name], [phone_number], [street_address], [city_state_zip_id]) VALUES (100, N'Quentin', N'Marshall', N'Quentin Marshall', N'(203) 755-9348', N'100 Bunting Drive', 89)
GO
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[product_type] ON 
GO
INSERT [dbo].[product_type] ([product_type_id], [product_type]) VALUES (1, N'Bottle')
GO
INSERT [dbo].[product_type] ([product_type_id], [product_type]) VALUES (2, N'Case')
GO
SET IDENTITY_INSERT [dbo].[product_type] OFF
GO
SET IDENTITY_INSERT [dbo].[oil_flavor] ON 
GO
INSERT [dbo].[oil_flavor] ([flavor_id], [flavor_name]) VALUES (1, N'Assortment ')
GO
INSERT [dbo].[oil_flavor] ([flavor_id], [flavor_name]) VALUES (2, N'Basil ')
GO
INSERT [dbo].[oil_flavor] ([flavor_id], [flavor_name]) VALUES (3, N'Chili ')
GO
INSERT [dbo].[oil_flavor] ([flavor_id], [flavor_name]) VALUES (4, N'Garlic ')
GO
INSERT [dbo].[oil_flavor] ([flavor_id], [flavor_name]) VALUES (5, N'Lemon ')
GO
INSERT [dbo].[oil_flavor] ([flavor_id], [flavor_name]) VALUES (6, N'Rosemary ')
GO
SET IDENTITY_INSERT [dbo].[oil_flavor] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 
GO
INSERT [dbo].[product] ([product_id], [flavor_id], [product_type_id], [price]) VALUES (1, 1, 2, CAST(82.95 AS Decimal(5, 2)))
GO
INSERT [dbo].[product] ([product_id], [flavor_id], [product_type_id], [price]) VALUES (2, 2, 1, CAST(13.95 AS Decimal(5, 2)))
GO
INSERT [dbo].[product] ([product_id], [flavor_id], [product_type_id], [price]) VALUES (3, 2, 2, CAST(82.95 AS Decimal(5, 2)))
GO
INSERT [dbo].[product] ([product_id], [flavor_id], [product_type_id], [price]) VALUES (4, 3, 1, CAST(13.95 AS Decimal(5, 2)))
GO
INSERT [dbo].[product] ([product_id], [flavor_id], [product_type_id], [price]) VALUES (5, 3, 2, CAST(82.95 AS Decimal(5, 2)))
GO
INSERT [dbo].[product] ([product_id], [flavor_id], [product_type_id], [price]) VALUES (6, 4, 1, CAST(13.95 AS Decimal(5, 2)))
GO
INSERT [dbo].[product] ([product_id], [flavor_id], [product_type_id], [price]) VALUES (7, 4, 2, CAST(82.95 AS Decimal(5, 2)))
GO
INSERT [dbo].[product] ([product_id], [flavor_id], [product_type_id], [price]) VALUES (8, 5, 1, CAST(13.95 AS Decimal(5, 2)))
GO
INSERT [dbo].[product] ([product_id], [flavor_id], [product_type_id], [price]) VALUES (9, 5, 2, CAST(82.95 AS Decimal(5, 2)))
GO
INSERT [dbo].[product] ([product_id], [flavor_id], [product_type_id], [price]) VALUES (10, 6, 1, CAST(13.95 AS Decimal(5, 2)))
GO
INSERT [dbo].[product] ([product_id], [flavor_id], [product_type_id], [price]) VALUES (11, 6, 2, CAST(82.95 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[product_order] ON 
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (1, CAST(N'2019-10-01' AS Date), 23, 1, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (2, CAST(N'2019-10-02' AS Date), 4, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (3, CAST(N'2019-10-03' AS Date), 49, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (4, CAST(N'2019-10-03' AS Date), 41, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (5, CAST(N'2019-10-04' AS Date), 42, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (6, CAST(N'2019-10-05' AS Date), 94, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (7, CAST(N'2019-10-08' AS Date), 70, 2, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (8, CAST(N'2019-10-10' AS Date), 10, 3, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (9, CAST(N'2019-10-12' AS Date), 68, 1, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (10, CAST(N'2019-10-12' AS Date), 75, 10, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (11, CAST(N'2019-10-13' AS Date), 18, 9, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (12, CAST(N'2019-10-17' AS Date), 19, 4, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (13, CAST(N'2019-10-18' AS Date), 3, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (14, CAST(N'2019-10-18' AS Date), 40, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (15, CAST(N'2019-10-18' AS Date), 57, 2, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (16, CAST(N'2019-10-18' AS Date), 81, 10, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (17, CAST(N'2019-10-18' AS Date), 14, 10, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (18, CAST(N'2019-10-19' AS Date), 50, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (19, CAST(N'2019-10-19' AS Date), 91, 2, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (20, CAST(N'2019-10-20' AS Date), 83, 6, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (21, CAST(N'2019-10-21' AS Date), 54, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (22, CAST(N'2019-10-21' AS Date), 76, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (23, CAST(N'2019-10-21' AS Date), 78, 9, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (24, CAST(N'2019-10-24' AS Date), 24, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (25, CAST(N'2019-10-26' AS Date), 2, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (26, CAST(N'2019-10-28' AS Date), 28, 4, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (27, CAST(N'2019-10-28' AS Date), 42, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (28, CAST(N'2019-10-28' AS Date), 44, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (29, CAST(N'2019-10-28' AS Date), 78, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (30, CAST(N'2019-11-01' AS Date), 66, 2, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (31, CAST(N'2019-11-02' AS Date), 35, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (32, CAST(N'2019-11-02' AS Date), 47, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (33, CAST(N'2019-11-03' AS Date), 61, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (34, CAST(N'2019-11-06' AS Date), 11, 9, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (35, CAST(N'2019-11-08' AS Date), 77, 2, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (36, CAST(N'2019-11-09' AS Date), 25, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (37, CAST(N'2019-11-11' AS Date), 11, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (38, CAST(N'2019-11-11' AS Date), 37, 10, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (39, CAST(N'2019-11-12' AS Date), 13, 7, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (40, CAST(N'2019-11-13' AS Date), 5, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (41, CAST(N'2019-11-15' AS Date), 28, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (42, CAST(N'2019-11-17' AS Date), 73, 6, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (43, CAST(N'2019-11-18' AS Date), 5, 2, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (44, CAST(N'2019-11-18' AS Date), 19, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (45, CAST(N'2019-11-19' AS Date), 46, 4, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (46, CAST(N'2019-11-20' AS Date), 73, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (47, CAST(N'2019-11-20' AS Date), 78, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (48, CAST(N'2019-11-25' AS Date), 70, 1, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (49, CAST(N'2019-11-26' AS Date), 90, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (50, CAST(N'2019-11-26' AS Date), 92, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (51, CAST(N'2019-11-27' AS Date), 36, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (52, CAST(N'2019-11-27' AS Date), 40, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (53, CAST(N'2019-11-29' AS Date), 30, 11, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (54, CAST(N'2019-12-04' AS Date), 65, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (55, CAST(N'2019-12-10' AS Date), 66, 4, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (56, CAST(N'2019-12-11' AS Date), 46, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (57, CAST(N'2019-12-11' AS Date), 47, 3, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (58, CAST(N'2019-12-11' AS Date), 94, 1, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (59, CAST(N'2019-12-12' AS Date), 40, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (60, CAST(N'2019-12-16' AS Date), 87, 11, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (61, CAST(N'2019-12-16' AS Date), 17, 2, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (62, CAST(N'2019-12-18' AS Date), 25, 4, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (63, CAST(N'2019-12-19' AS Date), 67, 6, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (64, CAST(N'2019-12-25' AS Date), 89, 10, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (65, CAST(N'2019-12-27' AS Date), 2, 2, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (66, CAST(N'2019-12-27' AS Date), 26, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (67, CAST(N'2019-12-29' AS Date), 69, 9, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (68, CAST(N'2020-01-01' AS Date), 42, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (69, CAST(N'2020-01-01' AS Date), 77, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (70, CAST(N'2020-01-02' AS Date), 20, 2, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (71, CAST(N'2020-01-05' AS Date), 73, 9, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (72, CAST(N'2020-01-05' AS Date), 5, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (73, CAST(N'2020-01-11' AS Date), 82, 6, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (74, CAST(N'2020-01-12' AS Date), 74, 4, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (75, CAST(N'2020-01-15' AS Date), 65, 6, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (76, CAST(N'2020-01-15' AS Date), 49, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (77, CAST(N'2020-01-16' AS Date), 12, 10, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (78, CAST(N'2020-01-17' AS Date), 7, 6, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (79, CAST(N'2020-01-18' AS Date), 1, 7, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (80, CAST(N'2020-01-19' AS Date), 94, 2, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (81, CAST(N'2020-01-19' AS Date), 39, 10, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (82, CAST(N'2020-01-20' AS Date), 95, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (83, CAST(N'2020-01-21' AS Date), 64, 6, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (84, CAST(N'2020-01-21' AS Date), 97, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (85, CAST(N'2020-01-22' AS Date), 51, 1, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (86, CAST(N'2020-01-24' AS Date), 45, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (87, CAST(N'2020-01-26' AS Date), 21, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (88, CAST(N'2020-01-26' AS Date), 24, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (89, CAST(N'2020-01-26' AS Date), 96, 4, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (90, CAST(N'2020-02-04' AS Date), 66, 9, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (91, CAST(N'2020-02-06' AS Date), 62, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (92, CAST(N'2020-02-06' AS Date), 84, 10, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (93, CAST(N'2020-02-08' AS Date), 80, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (94, CAST(N'2020-02-08' AS Date), 28, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (95, CAST(N'2020-02-09' AS Date), 36, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (96, CAST(N'2020-02-10' AS Date), 25, 1, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (97, CAST(N'2020-02-12' AS Date), 47, 2, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (98, CAST(N'2020-02-14' AS Date), 67, 7, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (99, CAST(N'2020-02-14' AS Date), 79, 2, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (100, CAST(N'2020-02-16' AS Date), 60, 2, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (101, CAST(N'2020-02-18' AS Date), 27, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (102, CAST(N'2020-02-22' AS Date), 11, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (103, CAST(N'2020-02-22' AS Date), 60, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (104, CAST(N'2020-02-22' AS Date), 73, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (105, CAST(N'2020-02-23' AS Date), 47, 1, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (106, CAST(N'2020-02-23' AS Date), 93, 2, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (107, CAST(N'2020-02-23' AS Date), 57, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (108, CAST(N'2020-02-24' AS Date), 39, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (109, CAST(N'2020-02-24' AS Date), 65, 9, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (110, CAST(N'2020-02-25' AS Date), 38, 2, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (111, CAST(N'2020-02-27' AS Date), 72, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (112, CAST(N'2020-03-06' AS Date), 100, 1, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (113, CAST(N'2020-03-07' AS Date), 40, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (114, CAST(N'2020-03-11' AS Date), 44, 2, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (115, CAST(N'2020-03-11' AS Date), 65, 7, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (116, CAST(N'2020-03-11' AS Date), 97, 10, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (117, CAST(N'2020-03-12' AS Date), 34, 6, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (118, CAST(N'2020-03-14' AS Date), 10, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (119, CAST(N'2020-03-15' AS Date), 14, 1, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (120, CAST(N'2020-03-16' AS Date), 2, 9, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (121, CAST(N'2020-03-16' AS Date), 4, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (122, CAST(N'2020-03-16' AS Date), 43, 1, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (123, CAST(N'2020-03-17' AS Date), 27, 6, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (124, CAST(N'2020-03-17' AS Date), 90, 11, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (125, CAST(N'2020-03-18' AS Date), 11, 6, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (126, CAST(N'2020-03-21' AS Date), 63, 3, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (127, CAST(N'2020-03-22' AS Date), 95, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (128, CAST(N'2020-03-23' AS Date), 67, 7, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (129, CAST(N'2020-03-23' AS Date), 81, 7, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (130, CAST(N'2020-03-27' AS Date), 23, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (131, CAST(N'2020-03-28' AS Date), 22, 4, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (132, CAST(N'2020-03-29' AS Date), 48, 4, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (133, CAST(N'2020-03-29' AS Date), 87, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (134, CAST(N'2020-04-01' AS Date), 34, 2, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (135, CAST(N'2020-04-01' AS Date), 98, 6, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (136, CAST(N'2020-04-02' AS Date), 4, 1, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (137, CAST(N'2020-04-03' AS Date), 1, 3, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (138, CAST(N'2020-04-04' AS Date), 30, 10, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (139, CAST(N'2020-04-05' AS Date), 71, 7, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (140, CAST(N'2020-04-06' AS Date), 93, 2, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (141, CAST(N'2020-04-08' AS Date), 42, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (142, CAST(N'2020-04-09' AS Date), 12, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (143, CAST(N'2020-04-09' AS Date), 54, 9, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (144, CAST(N'2020-04-10' AS Date), 23, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (145, CAST(N'2020-04-13' AS Date), 55, 6, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (146, CAST(N'2020-04-14' AS Date), 28, 1, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (147, CAST(N'2020-04-16' AS Date), 50, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (148, CAST(N'2020-04-17' AS Date), 86, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (149, CAST(N'2020-04-18' AS Date), 78, 4, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (150, CAST(N'2020-04-19' AS Date), 99, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (151, CAST(N'2020-04-23' AS Date), 21, 2, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (152, CAST(N'2020-04-24' AS Date), 59, 9, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (153, CAST(N'2020-04-28' AS Date), 74, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (154, CAST(N'2020-04-29' AS Date), 44, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (155, CAST(N'2020-04-30' AS Date), 84, 3, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (156, CAST(N'2020-05-01' AS Date), 17, 9, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (157, CAST(N'2020-05-02' AS Date), 12, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (158, CAST(N'2020-05-02' AS Date), 94, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (159, CAST(N'2020-05-03' AS Date), 93, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (160, CAST(N'2020-05-04' AS Date), 17, 10, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (161, CAST(N'2020-05-05' AS Date), 41, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (162, CAST(N'2020-05-06' AS Date), 29, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (163, CAST(N'2020-05-10' AS Date), 1, 9, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (164, CAST(N'2020-05-11' AS Date), 46, 2, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (165, CAST(N'2020-05-11' AS Date), 96, 4, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (166, CAST(N'2020-05-12' AS Date), 86, 4, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (167, CAST(N'2020-05-14' AS Date), 14, 2, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (168, CAST(N'2020-05-14' AS Date), 32, 4, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (169, CAST(N'2020-05-14' AS Date), 57, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (170, CAST(N'2020-05-14' AS Date), 16, 1, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (171, CAST(N'2020-05-15' AS Date), 96, 10, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (172, CAST(N'2020-05-16' AS Date), 1, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (173, CAST(N'2020-05-16' AS Date), 50, 4, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (174, CAST(N'2020-05-17' AS Date), 41, 9, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (175, CAST(N'2020-05-19' AS Date), 32, 2, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (176, CAST(N'2020-05-19' AS Date), 5, 10, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (177, CAST(N'2020-05-19' AS Date), 24, 7, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (178, CAST(N'2020-05-20' AS Date), 26, 2, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (179, CAST(N'2020-05-22' AS Date), 25, 2, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (180, CAST(N'2020-05-24' AS Date), 60, 10, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (181, CAST(N'2020-05-25' AS Date), 2, 11, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (182, CAST(N'2020-05-29' AS Date), 17, 6, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (183, CAST(N'2020-05-30' AS Date), 56, 6, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (184, CAST(N'2020-06-02' AS Date), 3, 4, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (185, CAST(N'2020-06-05' AS Date), 22, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (186, CAST(N'2020-06-05' AS Date), 94, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (187, CAST(N'2020-06-06' AS Date), 46, 11, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (188, CAST(N'2020-06-07' AS Date), 83, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (189, CAST(N'2020-06-08' AS Date), 8, 9, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (190, CAST(N'2020-06-09' AS Date), 42, 4, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (191, CAST(N'2020-06-10' AS Date), 15, 11, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (192, CAST(N'2020-06-10' AS Date), 35, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (193, CAST(N'2020-06-12' AS Date), 49, 6, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (194, CAST(N'2020-06-13' AS Date), 51, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (195, CAST(N'2020-06-16' AS Date), 17, 3, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (196, CAST(N'2020-06-17' AS Date), 13, 7, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (197, CAST(N'2020-06-17' AS Date), 79, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (198, CAST(N'2020-06-17' AS Date), 82, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (199, CAST(N'2020-06-19' AS Date), 88, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (200, CAST(N'2020-06-23' AS Date), 36, 10, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (201, CAST(N'2020-06-23' AS Date), 66, 1, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (202, CAST(N'2020-06-25' AS Date), 12, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (203, CAST(N'2020-06-25' AS Date), 40, 10, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (204, CAST(N'2020-06-25' AS Date), 2, 10, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (205, CAST(N'2020-06-28' AS Date), 86, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (206, CAST(N'2020-07-01' AS Date), 79, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (207, CAST(N'2020-07-01' AS Date), 24, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (208, CAST(N'2020-07-02' AS Date), 26, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (209, CAST(N'2020-07-06' AS Date), 42, 10, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (210, CAST(N'2020-07-09' AS Date), 11, 2, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (211, CAST(N'2020-07-11' AS Date), 8, 11, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (212, CAST(N'2020-07-11' AS Date), 36, 3, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (213, CAST(N'2020-07-13' AS Date), 31, 10, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (214, CAST(N'2020-07-14' AS Date), 50, 3, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (215, CAST(N'2020-07-15' AS Date), 88, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (216, CAST(N'2020-07-16' AS Date), 98, 10, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (217, CAST(N'2020-07-17' AS Date), 34, 1, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (218, CAST(N'2020-07-17' AS Date), 28, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (219, CAST(N'2020-07-18' AS Date), 80, 5, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (220, CAST(N'2020-07-18' AS Date), 10, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (221, CAST(N'2020-07-23' AS Date), 28, 10, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (222, CAST(N'2020-07-24' AS Date), 37, 6, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (223, CAST(N'2020-07-24' AS Date), 44, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (224, CAST(N'2020-07-25' AS Date), 77, 9, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (225, CAST(N'2020-07-26' AS Date), 54, 1, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (226, CAST(N'2020-07-26' AS Date), 77, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (227, CAST(N'2020-07-27' AS Date), 46, 4, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (228, CAST(N'2020-07-28' AS Date), 28, 2, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (229, CAST(N'2020-07-29' AS Date), 74, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (230, CAST(N'2020-07-29' AS Date), 78, 4, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (231, CAST(N'2020-07-30' AS Date), 32, 2, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (232, CAST(N'2020-07-31' AS Date), 34, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (233, CAST(N'2020-07-31' AS Date), 90, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (234, CAST(N'2020-08-01' AS Date), 39, 5, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (235, CAST(N'2020-08-02' AS Date), 37, 6, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (236, CAST(N'2020-08-03' AS Date), 16, 6, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (237, CAST(N'2020-08-03' AS Date), 74, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (238, CAST(N'2020-08-03' AS Date), 90, 2, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (239, CAST(N'2020-08-05' AS Date), 26, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (240, CAST(N'2020-08-06' AS Date), 26, 4, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (241, CAST(N'2020-08-08' AS Date), 69, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (242, CAST(N'2020-08-12' AS Date), 6, 1, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (243, CAST(N'2020-08-13' AS Date), 38, 10, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (244, CAST(N'2020-08-17' AS Date), 30, 8, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (245, CAST(N'2020-08-21' AS Date), 64, 4, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (246, CAST(N'2020-08-22' AS Date), 11, 5, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (247, CAST(N'2020-08-23' AS Date), 36, 2, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (248, CAST(N'2020-08-25' AS Date), 44, 1, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (249, CAST(N'2020-08-25' AS Date), 59, 4, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (250, CAST(N'2020-08-25' AS Date), 63, 4, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (251, CAST(N'2020-08-26' AS Date), 9, 11, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (252, CAST(N'2020-08-29' AS Date), 16, 2, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (253, CAST(N'2020-08-30' AS Date), 39, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (254, CAST(N'2020-08-30' AS Date), 61, 11, 2, CAST(165.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (255, CAST(N'2020-08-30' AS Date), 100, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (256, CAST(N'2020-08-31' AS Date), 59, 8, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (257, CAST(N'2020-09-02' AS Date), 65, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (258, CAST(N'2020-09-03' AS Date), 94, 6, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (259, CAST(N'2020-09-04' AS Date), 98, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (260, CAST(N'2020-09-06' AS Date), 58, 4, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (261, CAST(N'2020-09-07' AS Date), 30, 8, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (262, CAST(N'2020-09-08' AS Date), 97, 2, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (263, CAST(N'2020-09-12' AS Date), 25, 2, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (264, CAST(N'2020-09-13' AS Date), 74, 6, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (265, CAST(N'2020-09-13' AS Date), 13, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (266, CAST(N'2020-09-16' AS Date), 91, 10, 4, CAST(55.80 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (267, CAST(N'2020-09-17' AS Date), 93, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (268, CAST(N'2020-09-17' AS Date), 59, 3, 1, CAST(82.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (269, CAST(N'2020-09-18' AS Date), 31, 10, 1, CAST(13.95 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (270, CAST(N'2020-09-26' AS Date), 75, 6, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (271, CAST(N'2020-09-28' AS Date), 47, 8, 3, CAST(41.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (272, CAST(N'2020-09-28' AS Date), 22, 9, 3, CAST(248.85 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (273, CAST(N'2020-09-28' AS Date), 95, 6, 2, CAST(27.90 AS Decimal(6, 2)))
GO
INSERT [dbo].[product_order] ([order_id], [order_date], [customer_id], [product_id], [quantity], [order_total]) VALUES (274, CAST(N'2020-09-29' AS Date), 20, 4, 2, CAST(27.90 AS Decimal(6, 2)))
GO
SET IDENTITY_INSERT [dbo].[product_order] OFF
GO
SET IDENTITY_INSERT [dbo].[additional_product] ON 
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (1, N'ALB008', N'Delicate', 8, CAST(10.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (2, N'ALB032', N'Delicate', 32, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (3, N'ALB064', N'Delicate', 64, CAST(22.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (4, N'ALB128', N'Delicate', 128, CAST(26.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (5, N'EV008', N'Extra Virgin', 8, CAST(8.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (6, N'EV016', N'Extra Virgin', 16, CAST(12.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (7, N'EV032', N'Extra Virgin', 32, CAST(16.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (8, N'EV064', N'Extra Virgin', 64, CAST(20.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (9, N'EV128', N'Extra Virgin', 128, CAST(24.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (10, N'FCP008', N'First Cold Press', 8, CAST(8.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (11, N'FCP016', N'First Cold Press', 16, CAST(12.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (12, N'FCP032', N'First Cold Press', 32, CAST(16.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (13, N'FCP064', N'First Cold Press', 64, CAST(20.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (14, N'FCP128', N'First Cold Press', 128, CAST(24.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (15, N'FR008', N'Frantoio', 8, CAST(10.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (16, N'FR016', N'Frantoio', 16, CAST(14.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (17, N'FR032', N'Frantoio', 32, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (18, N'FR064', N'Frantoio', 64, CAST(22.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (19, N'FR128', N'Frantoio', 128, CAST(26.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (20, N'HOJ008', N'Bold', 8, CAST(11.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (21, N'HOJ016', N'Bold', 16, CAST(15.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (22, N'HOJ032', N'Bold', 32, CAST(19.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (23, N'HOJ064', N'Bold', 64, CAST(23.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (24, N'HOJ128', N'Bold', 128, CAST(27.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (25, N'KRN008', N'Koroneiki', 8, CAST(10.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (26, N'KRN016', N'Koroneiki', 16, CAST(14.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (27, N'KRN032', N'Koroneiki', 32, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (28, N'KRN064', N'Koroneiki', 64, CAST(22.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (29, N'KRN128', N'Koroneiki', 128, CAST(26.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (30, N'LEC008', N'Leccino', 8, CAST(10.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (31, N'LEC016', N'Leccino', 16, CAST(14.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (32, N'LEC032', N'Leccino', 32, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (33, N'LEC064', N'Leccino', 64, CAST(22.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (34, N'LEC064', N'Leccino', 64, CAST(23.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (35, N'LEC128', N'Leccino', 128, CAST(26.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (36, N'LGT008', N'Light', 8, CAST(8.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (37, N'LGT016', N'Light', 16, CAST(12.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (38, N'LGT032', N'Light', 32, CAST(16.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (39, N'LGT064', N'Light', 64, CAST(20.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (40, N'LGT128', N'Light', 128, CAST(24.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (41, N'MAN008', N'Manzanilla', 8, CAST(10.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (42, N'MAN016', N'Manzanilla', 16, CAST(14.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (43, N'MAN032', N'Manzanilla', 32, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (44, N'MAN064', N'Manzanilla', 64, CAST(22.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (45, N'MAN128', N'Manzanilla', 128, CAST(26.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (46, N'MIS008', N'Mission', 8, CAST(10.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (47, N'MIS016', N'Mission', 16, CAST(14.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (48, N'MIS032', N'Mission', 32, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (49, N'MIS064', N'Mission', 64, CAST(22.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (50, N'MIS128', N'Mission', 128, CAST(26.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (51, N'MOR008', N'Moraiolo', 8, CAST(10.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (52, N'MOR016', N'Moraiolo', 16, CAST(14.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (53, N'MOR032', N'Moraiolo', 32, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (54, N'MOR064', N'Moraiolo', 64, CAST(22.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (55, N'MOR128', N'Moraiolo', 128, CAST(26.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (56, N'OBL008', N'Oblica', 8, CAST(11.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (57, N'OBL016', N'Oblica', 16, CAST(15.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (58, N'OBL032', N'Oblica', 32, CAST(19.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (59, N'OBL064', N'Oblica', 64, CAST(22.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (60, N'OBL128', N'Oblica', 128, CAST(27.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (61, N'PEN008', N'Pendolino', 8, CAST(10.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (62, N'PEN016', N'Pendolino', 16, CAST(14.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (63, N'PEN032', N'Pendolino', 32, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (64, N'PEN064', N'Pendolino', 64, CAST(22.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (65, N'PEN128', N'Pendolino', 128, CAST(26.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (66, N'PCH008', N'Picholine', 8, CAST(11.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (67, N'PCH016', N'Picholine', 16, CAST(15.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (68, N'PCH032', N'Picholine', 32, CAST(19.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (69, N'PCH064', N'Picholine', 64, CAST(23.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (70, N'PCH128', N'Picholine', 128, CAST(27.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (71, N'PIC008', N'Picual', 8, CAST(10.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (72, N'PIC016', N'Picual', 16, CAST(14.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (73, N'PIC032', N'Picual', 32, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (74, N'PIC064', N'Picual', 64, CAST(22.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (75, N'PIC128', N'Picual', 128, CAST(26.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (76, N'PUR008', N'Pure', 8, CAST(8.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (77, N'PUR016', N'Pure', 16, CAST(12.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (78, N'PUR032', N'Pure', 32, CAST(16.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (79, N'PUR064', N'Pure', 64, CAST(20.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (80, N'PUR128', N'Pure', 128, CAST(24.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (81, N'REF008', N'Refined', 8, CAST(8.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (82, N'REF016', N'Refined', 16, CAST(12.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (83, N'REF032', N'Refined', 32, CAST(16.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (84, N'REF064', N'Refined', 64, CAST(20.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (85, N'REF128', N'Refined', 128, CAST(24.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (86, N'V008', N'Virgin', 8, CAST(8.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (87, N'V016', N'Virgin', 16, CAST(12.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (88, N'V032', N'Virgin', 32, CAST(16.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (89, N'V064', N'Virgin', 64, CAST(20.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (90, N'V128', N'Virgin', 128, CAST(24.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (91, N'MI008', N'Mandarin-Infused EVO', 8, CAST(8.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (92, N'MI016', N'Mandarin-Infused EVO', 16, CAST(12.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (93, N'MI032', N'Mandarin-Infused EVO', 32, CAST(16.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (94, N'LI008', N'Lemon-Infused EVO', 8, CAST(8.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (95, N'LI016', N'Lemon-Infused EVO', 16, CAST(12.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (96, N'LI032', N'Lemon-Infused EVO', 32, CAST(16.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (97, N'BI008', N'Basil-Infused EVO', 8, CAST(10.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (98, N'BI016', N'Basil-Infused EVO', 16, CAST(14.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (99, N'BI032', N'Basil-Infused EVO', 32, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (100, N'RI008', N'Rosemary-Infused EVO', 8, CAST(10.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (101, N'RI016', N'Rosemary-Infused EVO', 16, CAST(14.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (102, N'RI032', N'Rosemary-Infused EVO', 32, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (103, N'GI008', N'Garlic-Infused EVO', 8, CAST(11.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (104, N'GI016', N'Garlic-Infused EVO', 16, CAST(15.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (105, N'GI032', N'Garlic-Infused EVO', 32, CAST(19.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (106, N'JI008', N'Chili-Infused EVO', 8, CAST(11.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (107, N'JI016', N'Chili-Infused EVO', 16, CAST(15.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (108, N'JI032', N'Chili-Infused EVO', 32, CAST(19.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (109, N'OGEC004', N'Olive Glow eye cream ', 4, CAST(18.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (110, N'OGFL006', N'Olive Glow face lotion', 6, CAST(14.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (111, N'OGBL012', N'Olive Glow body lotion', 12, CAST(12.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (112, N'OGFT006', N'Olive Glow foot treatment', 6, CAST(7.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (113, N'OGNR004', N'Olive Glow night repair', 4, CAST(21.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (114, N'OGBG016', N'Olive Glow bath gel', 16, CAST(9.99 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_product] ([product_id], [sku], [product_name], [size_oz], [price]) VALUES (115, N'OGHS006', N'Olive Glow hand soap', 6, CAST(6.99 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[additional_product] OFF
GO
SET IDENTITY_INSERT [dbo].[additional_service] ON 
GO
INSERT [dbo].[additional_service] ([service_id], [sku], [srvc_name], [min_participants], [per_person_price], [min_price]) VALUES (1, N'TP012', N'Two Trees Tasting Party', 12, CAST(15.00 AS Decimal(5, 2)), CAST(180.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_service] ([service_id], [sku], [srvc_name], [min_participants], [per_person_price], [min_price]) VALUES (2, N'OGP006', N'Olive Glow Beauty Party', 6, CAST(25.00 AS Decimal(5, 2)), CAST(150.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_service] ([service_id], [sku], [srvc_name], [min_participants], [per_person_price], [min_price]) VALUES (3, N'CAT002', N'Catering - Italian Romance for Two', 2, CAST(35.00 AS Decimal(5, 2)), CAST(70.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_service] ([service_id], [sku], [srvc_name], [min_participants], [per_person_price], [min_price]) VALUES (4, N'CAT00L', N'Catering - Lunch', 5, CAST(20.00 AS Decimal(5, 2)), CAST(100.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_service] ([service_id], [sku], [srvc_name], [min_participants], [per_person_price], [min_price]) VALUES (5, N'CAT00D', N'Catering  - Dinner', 8, CAST(35.00 AS Decimal(5, 2)), CAST(280.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_service] ([service_id], [sku], [srvc_name], [min_participants], [per_person_price], [min_price]) VALUES (6, N'DEL00S', N'Gift Basket Delivery - Small', NULL, CAST(45.00 AS Decimal(5, 2)), CAST(45.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_service] ([service_id], [sku], [srvc_name], [min_participants], [per_person_price], [min_price]) VALUES (7, N'DEL00M', N'Gift Basket Delivery - Medium', NULL, CAST(85.00 AS Decimal(5, 2)), CAST(85.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[additional_service] ([service_id], [sku], [srvc_name], [min_participants], [per_person_price], [min_price]) VALUES (8, N'DEL00L', N'Gift Basket Delivery - Large', NULL, CAST(125.00 AS Decimal(5, 2)), CAST(125.00 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[additional_service] OFF
GO

set nocount off 














