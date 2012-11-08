javafx-add-ons
==============

Some useful (or not) add ons for javafx

Features
--------

**Dialog for javafx**

Developed by Anton Smirnov (dev@antonsmirnov.name), see https://github.com/4ntoine/JavaFxDialog.

I just made small changes.


Compilation note
----------------

You'll need javafx in your system dependencies (see pom.xml). In my case, I edit maven settings file (C:\maven\conf\settings.xml) and add :

     <profile>
          <id>javafx</id>
          <activation>
               <activebydefault>true</activebydefault>
          </activation>
          <properties>
               <javafx.rt.jar>C:\Program Files\Oracle\JavaFX 2.2 SDK\rt\lib\jfxrt.jar</javafx.rt.jar>
               <ant.javafx.jar>C:\Program Files\Oracle\JavaFX 2.2 SDK\lib\ant-javafx.jar</ant.javafx.jar>
          </properties>
     </profile>


Deployment note
---------------

     mvn -DaltDeploymentRepository=snapshot-repo::default::file:../maven-repo/snapshots clean deploy

