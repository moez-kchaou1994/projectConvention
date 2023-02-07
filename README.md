# projectConvention
As part of its openness activities on the environment, the Polytechnic Institute of Advanced Sciences of Sfax (IPSAS) establishes Agreements with industrialists, university institutions, regional authorities, national authorities and international institutions. As part of this mini project, we, engineers from IPSAS.
the system that we intend to put in place should ensure the following tasks:
* Authenticate a user
* Add a convention according to its type
* Modify a convention
* Delete a convention
* Search for one or more conventions (Multi-criteria search),
* Print an agreement
*Print a statement of agreements resulting from a search
A convention is described by:
1. The type (academic – national industrial – industrial
2. Participants in a convention (Four maximum)
3. The date of its publication
4. The date of its signature by each participant
5. Its purpose
6. The date of its entry into force
7. The date of its expiry.

-Persistence will be ensured in a MySql database called GestConv
You are asked to implement the IPSAS convention management application (GestConv) according to the MVC design pattern in accordance with the JEE platform.
# Devops
* for Jenkins setup:
1. GIT path configuration: the git path is /usr/lib/git-core/git
2. Maven configuration: install automatically
3. configuration of the JDK: either give the path or leave it to automatically install java
* Docker setup
* Step 1 :
* Create and test a script that retrieves project code and builds from the git repository using maven:
* Step 2:
* add a function that calls a shell script in the pipeline: this function has the role of retrieve the build version number.
* def getVersion(){ }
* Step 3:
* Add the script that allows the launch of docker image:
* The name of the image must have the following structure:
* github_user_name/tag:version
* Step 4:
* Add a stage for the deployment (Push) of the docker image on dockerhub.
