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

----------------------------------------------------------------------

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
Change the content directory to 'WebContent', also click the checkbox to Generate a web.xml <br/>
![image](https://user-images.githubusercontent.com/43066793/145066013-b1166847-ffa2-4c06-b7c8-0ae255ef3592.png)
 <br/> <br/>
