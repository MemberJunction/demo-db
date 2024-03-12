# demo-db
This repository contains a full installation of MemberJunction along with a completely mocked up sample databsae. The sample database does have real company data from the IRS 990 tax return data including 1,000+ real non-profit associations in its data set. However, the rest of the data is completely synthetic. 

We used a mixture of GPT-4 and some custom scripting to generate the data first. After that, we installed MemberJunction on a copy of the database and this repository represents the fully configured environment. If you want to intsall this system, go to the SQL Scripts/install directory in this repo and use the _STRUCTURE and _DATA scripts (in that order) on a fresh SQL Server database and then run the full MemberJunction install process from there
