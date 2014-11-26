dpAssignment
============
A RESTful API using the Laravel 5 Dev framework and mysql

**To launch:**

/path/to/php -S localhost:8000 -t ~/path/to/folder/called/ **project/public**

**API accessible from:**

localhost:chosen_port/


**Usage:**
===
**/cinemas** lists cinemas with optional pagination parameters

**/cinemas/{name}** shows the details of the cinema

**/movies/{name}** shows details of a particular movie

**/movies/sessions/{name}** shows all upcoming sessions for a movie with optional pagination parameters

**/upcoming** shows all upcoming sessions with optional pagination parameters

**/past** shows all the past sessions with optional pagination parameters

**optional get url variables are**:
===
-  _**results_per_page**_ which sets the number of cinema results to display per page (default5)
-  _**page**_ which sets the page to return (default 1)

**/cinemas/{name}**
shows details about a particular cinema

**Requires:**
===
- phpbrew install 5.6.3 +mysql +pdo +default
- mysql server on localhost
- (optional)importation of database.sql data
