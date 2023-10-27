# cloud_db_mgmt_pooling_migrations

# Setup and Configuration for Azure

1. Sign into Azure account
2. Create an Azure Database for MySQL flexible server
3. Adjust all settings to whatever you want
5. Click the "create" button to finalize all changes
6. Go to homepage / overview page of the database
7. Navigate to Server Parameters on the left side. Set connect_timeout to 3, max_connections to 20, and require_secure_transport to OFF
8. Navigate to Databases on the left side. Create a database
   
# Setup and Configuration for GCP

1. Sign in GCP account
2. Go to the Navigation menu on the left and click SQL
3. Create an instance and click MySQL instance
4. Adjust all settings to whatever you want
5. Create the instance
6. Go to the SQL Navigation bar on the left side and click Database
7. Create a database
8. Go to the SQL Navigation bar on the left side and click Connections
9. Navigate to the Networking tab and add a network

# Description and Rationale of the Database Schema Structure

## Description
I created both a Patients table and a Medical Records table (before adding additional columns for Alembic). 

Patients Table:
- ID: primary key, integer
- first_name: string(50)
- last_name: string(50)
- gender: string(10)
- contact number: string(50)

Medical Records Table: 
- ID: primary key, integer
- patient_id: integer, foreign key
- diagnosis: string(100)
- admission_date: date
- discharge_date: date

I updated the Patients and Medical Records table by adding columns (not shown on Flask). 

Patients Table:
- ID: primary key, integer
- first_name: string(50)
- last_name: string(50)
- gender: string(10)
- contact number: string(50)
- insurance: string(100)

Medical Records Table: 
- ID: primary key, integer
- patient_id: integer, foreign key
- diagnosis: string(100)
- admission_date: date
- discharge_date: date
- allergies: string(100)
- pcp: string(100)

## Rationale

I chose to include all of the columns because they're all aspects of basic information that a medical provider needs in order to effectively take care of a patient. I decided to add an insurance column into the Patients table because it's vital to the means of how a patient is going to pay for their visit. It's also important to note that some patients do not have insurance. I decided to add an allergies column to the Medical Records table because taking note of a patient's allergies can affect the type of care that is given (ie: mediciations). Lastly, I decided to add a pcp column to the Medical Records Table because it's important to have a medical provider that knows the patient well enough in the event an emergency occurs or a question about care arises.

# Steps and Challenges for Database Migration Process

## Steps

1. In the console, type in:

```alembic init migrations```

2. Go to the alembic.ini file and update the sqlalchemy.url. Replace the code below with your information
   
```sqlalchemy.url = mysql+mysqlconnector://username:password@host/database_name```

3. Go to the env.py file and edit the file to point to the models created
 
```from db_schema import Base```
```target_metadata = Base.metadata```

4. In the console, create a migration by typing in:

```alembic revision --autogenerate -m "create tables"```

5. In the console, run the migration by typing in:
   
```alembic upgrade head```

6. In the console, save the migration by typing in:

  ```alembic upgrade head --sql > migration.sql``` 

## Challenges

A challenge that I had was when I was trying to run my Flask application. I kept getting an error that didn't allow my "Patients" and "Medical Records" page to load. Initially, I looked over all of my code that were in my azure.py, gcp.py, azure_populate.py, gcp_populate.py, and app.py files. I did notice I made some mistakes, so I fixed those, but the Flask application was still returning an error message. Because my app.py file with the code for Flask wasn't in a folder, I didn't realize that I had to create separate .gitignore and .env files. After thia quick fix, my Flask application was able to load all of the pages. Another challenge I faced with this assignment was the Alembic portion. I wasn't aware that there were certain lines that needed to be "commented" and other lines that needed to be "uncommented" in the env.py file in order for Alembic to work. 
