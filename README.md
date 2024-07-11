**Freight Director**
=====================

### Overview
Freight Director is a web-based freight management system designed to streamline the management of freight, connecting Controllers, Drivers, and Shippers seamlessly. By enhancing communication and reducing errors, it significantly improves efficiency in freight logistics.

### Key Features

#### For Shippers
* Initiate load requests with detailed information about the shipment, including goods description, collection and drop-off locations, and preferred delivery times.
* Receive real-time updates on shipment status for visibility and control over the transportation process.
* Report damages and incidents related to shipments for prompt resolution and claims processing.

#### For Drivers
* Access load information, including departure and destination details, goods in transit, and specific instructions or requirements.
* Report incidents and damages to Controllers and Shippers for prompt resolution.
* Update personal information, such as contact details and passwords, to maintain accurate records.

#### For Controllers
* Efficiently allocate loads to available Drivers based on various parameters, such as location, vehicle capacity, and delivery timeframes.
* Monitor the progress of loads in real-time for informed decision-making and adaptability to unforeseen circumstances.
* Receive incident reports and damage notifications for quick responses.

### System Requirements

The system consists of several tables that store data related to Controllers, Shippers, Drivers, Damages, Fleets, Incidents, and Loads. The database structure is as follows:

### Database Tables

1. **Fleet_Controller**
	* controllerID (primary key)
	* controllerFName
	* controllerLName
	* controllerUsername
	* controllerPwd
	* controllerPhone
2. **Shipper**
	* shipperID (primary key)
	* loadID
	* shipperFName
	* shipperLName
	* shipperUsername
	* shipperAge
	* shipperPwd
	* shipperPhone
3. **Driver**
	* driverID (primary key)
	* driverFName
	* driverLName
	* driverUsername
	* driverPwd
	* driverPhone
	* currentLoad (foreign key referencing the Load table)
4. **Damage**
	* damageID (primary key)
	* description
	* loadID (foreign key referencing the Load table)
	* shipperID (foreign key referencing the Shipper table)
	* comment
5. **Fleet**
	* fleetID (primary key)
	* fleetContact
	* vehicleMakeModel
	* fleetRegistration
	* trailer1Registration
	* trailer2Registration
6. **Incident**
	* incidentID (primary key)
	* loadID (foreign key referencing the Load table)
	* driverID (foreign key referencing the Driver table)
	* description
	* comment
7. **Load**
	* loadID (primary key)
	* shipperID (foreign key referencing the Shipper table)
	* driverID (foreign key referencing the Driver table)
	* fleetID (foreign key referencing the Fleet table)
	* controllerID (foreign key referencing the Fleet_Controller table)
	* goodsDescription
	* collectionDate
	* collectionLocation
	* dropOffDate
	* dropOffLocation
	* loadStatus
	* incidentContact
	* damageContact
	* deliveryContact

### Development Skills

The skills used to create this system were acquired through various university modules:

### Web Systems

https://www.mandela.ac.za/Study-at-Mandela/Discovery/Module-browser?mid=WRWV201
https://www.mandela.ac.za/Study-at-Mandela/Discovery/Module-browser?mid=WRWV202

### Database Systems

https://www.mandela.ac.za/Study-at-Mandela/Discovery/Module-browser?mid=WRDV301

### Information Systems

https://www.mandela.ac.za/Study-at-Mandela/Discovery/Module-browser?mid=WRIV201
https://www.mandela.ac.za/Study-at-Mandela/Discovery/Module-browser?mid=WRIV202

### Third Year Project Management

https://www.mandela.ac.za/Study-at-Mandela/Discovery/Module-browser?mid=WRRV301
https://www.mandela.ac.za/Study-at-Mandela/Discovery/Module-browser?mid=WUIV302
