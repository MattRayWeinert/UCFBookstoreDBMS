# UCFBookstoreDBMS
Bookstore DBMS Project

----------------------------------------------------------------------
REQUIRED JARS: 
1. SQL Connector J - https://dev.mysql.com/downloads/connector/j/

  SQL Connector J interfaces MySQL with Java.

2. javax.mail.jar - https://javaee.github.io/javamail/ 

  javax.mail interfaces Java and SMTP mailing services.

3. ctivation-1.1.1.jar (MIME Jar) - https://mvnrepository.com/artifact/javax.activation/activation/1.1.1 

  activation-1.1.1 configures us to use MIME data (Multipurpose Internet Mail Extensions data).

4. jstl-1.2.jar - https://mvnrepository.com/artifact/javax.servlet/jstl/1.2
  
  Java servlet framework that has features for looping html tags for tables

----------------------------------------------------------------------
REQUIRED SOFTWARE:
1) Eclipse IDE for Enterprise Java and Web Developers - https://www.eclipse.org/downloads/packages/release/2021-03/r/eclipse-ide-enterprise-java-and-web-developers
MOST LIKELY WILL REQUIRE THE JAVA & WEB DEVELOPERS ECLIPSE VERSION, OR YOU MIGHT BE MISSING NECESSARY FEATURES.

3) Apache Tomcat 9.0 Server - (installed within the IDE, no external download required)

5) MySQL Workbench 8.0 - https://dev.mysql.com/downloads/workbench/
----------------------------------------------------------------------

WEBCONTENT - contains the JSP view pages 

src/main/java/default - contains the servlets that handle the middleware


STEPS TO SET-UP (windows)
----------------------------------------------------------------------

Launch a new Dynamic Web Project within Eclipse
 <br/>  <br/>
![image](https://user-images.githubusercontent.com/43066793/145063192-6ffa4f25-b5ef-429f-bfb8-98a9bb9c7f8e.png)
 <br/> <br/>
Make sure the 'Dynamic Web Module Version' is set to 4.0 and click on 'New Runtime' <br/>
![image](https://user-images.githubusercontent.com/43066793/145063366-031236df-16bd-4d12-aafc-24a546a9fa47.png)
 <br/> <br/>
Select 'Apache Tomcat v9.0' and click Next > <br/>
![image](https://user-images.githubusercontent.com/43066793/145063428-98d8f45f-eb53-4aa7-abdd-95aba97153cc.png)
 <br/> <br/>
Browse for a location to download the Apache 9.0 server <br/>
![image](https://user-images.githubusercontent.com/43066793/145065500-6c24e586-d36a-4970-afe2-2573ca031923.png)
 <br/> <br/>
Download, install and finish. <br/>
![image](https://user-images.githubusercontent.com/43066793/145065644-f59e9733-39fe-4e88-a9b0-a7a9f99ac781.png)
 <br/> <br/>
Now, hit next twice <br/>
![image](https://user-images.githubusercontent.com/43066793/145065786-f050e0ce-5c2c-421c-aad5-8f530c3233f4.png)
 <br/> <br/>
Change the content directory to 'WebContent', also click the checkbox to Generate a web.xml & click finish <br/>
![image](https://user-images.githubusercontent.com/43066793/145066013-b1166847-ffa2-4c06-b7c8-0ae255ef3592.png)
 <br/> <br/>
Assuming you downloaded the jars by this point, we will now add them to the project. <br/>
Right click the project in the Project Explorer and click on Properties. <br/>
![image](https://user-images.githubusercontent.com/43066793/145066464-ea3a335b-2120-40d5-b04d-13ba50e3ecd6.png)
<br/><br/>
Within the properties, (1) click on 'Java Build Path', (2) click on 'Classpath, (3) click on 'Add External Jars' <br/>
![image](https://user-images.githubusercontent.com/43066793/145066704-6a1ab60e-d377-42cb-a0c9-e7b423fc8441.png)
<br/><br/>
Add all the jars and click Apply <br/>
![image](https://user-images.githubusercontent.com/43066793/145066884-a431a33b-2d1e-4d22-a0b1-163c799c6222.png)
<br/><br/>
Within 'Deployment Assembly', click 'Add...' <br/>
![image](https://user-images.githubusercontent.com/43066793/145066997-625f9f10-f441-47bf-957d-13002c5f0196.png)
<br/><br/>
Within 'Java Build Path Entries', select all the the Jars and click 'Finish'<br/>
![image](https://user-images.githubusercontent.com/43066793/145067174-eabca8c8-2dd0-4a86-ad14-4832203c54e3.png)
<br/><br/>
Now you can click 'Apply and Close' <br/>
![image](https://user-images.githubusercontent.com/43066793/145067438-2ddc1789-f85b-4313-a862-30c6e496806f.png)
<br/><br/>
Now we can add a server by clicking on the 'Servers' tab and Creating a new Server<br/>
![image](https://user-images.githubusercontent.com/43066793/145067654-0c403f1a-2dd3-4c43-89f0-5af70f822222.png)
<br/><br/>
Select Tomcat v9.0 Server and click Next<br/>
![image](https://user-images.githubusercontent.com/43066793/145067728-f6eadac9-0936-48c9-82dc-217a533b5790.png)
<br/><br/>
Click the Available Project you want to add, click Add >, then Finish. <br/>
![image](https://user-images.githubusercontent.com/43066793/145067901-da2ccf07-bb4b-4421-91af-e981e4effffc.png)
<br/><br/>

Now the project is setup within Eclipse. I suggest copying the files and moving them into the WebContent directory instead of replacing the WebContent folder with the already existing one with the finished code. If you do that then you are messing with the META-INF and WEB-INF which is built specific to your system, so don't replace those.
<br/><br/>
The Project Structure should be similar to:<br/>
-Src:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-main:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-java:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Default:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-(all the servlet files):<br/>
-WebContent:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-META-INF:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-WEB-INF:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-web.xml:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-(all the jsp files):<br/>
<br/>


DATABASE CONNECTION
----------------------------------------------------------------------

<br/>
In terms of the Database Connection, you can alter the <b>DatabaseConnection.java</b> file to change the database username and password. <br/>

![image](https://user-images.githubusercontent.com/43066793/145069811-0df0bff5-55e7-4a20-94e0-fb0027f5e148.png)

<br/><br/>

The Database Schema's structure is as such. <br/>
![image](https://user-images.githubusercontent.com/43066793/145069238-ac361211-3304-4d3d-8b6b-2054565e1aa1.png)
<br/><br/>

The 'useraccounts' table which accounts for the users in the database is as such. </br>
![image](https://user-images.githubusercontent.com/43066793/145069351-1d71c169-fb8b-4c52-a953-0fe5cbd7a06f.png)
<br/><br/>

The 'bookorders' table which accounts for all the book orders is as such. <br/>
![image](https://user-images.githubusercontent.com/43066793/145069432-5522a53a-b3f8-4f67-b946-6858f7f5dba6.png)
<br/><br/>

THE END
----------------------------------------------------------------------
Make sure you have a user in your database and you can test the functionality of everything.<br/>
Admin users can create new users within the website. <br/>
Faculty users can create new book orders and such on the website. <br/>
<br/>
Enjoy!
