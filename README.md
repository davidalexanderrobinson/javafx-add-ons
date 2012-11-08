javafx-add-ons
==============

Some useful (or not) add ons for javafx

Features
--------

**Dialog for javafx**

Developed by Anton Smirnov (dev@antonsmirnov.name), see https://github.com/4ntoine/JavaFxDialog.

I just made small changes.

*Example :*

     Dialog.showInfo(properties.getProperty("information"), message, addDocumentScreen.get().getMainStage());

     Dialog.buildConfirmation(properties.getProperty("delete"), properties.getProperty("wanna_delete_item_named").replace("{0}", getString()))
     		.addYesButton(new EventHandler<ActionEvent>() {
     			@Override
     			public void handle(ActionEvent arg0) {
     				GedDocumentService.deleteDocumentFile(getFilePathFromTreeItem(getTreeItem()));
     				getTreeItem().getParent().getChildren().remove(getTreeItem());
     			}
     		})
     		.addNoButton(null)
     		.addCancelButton(null)
     		.build()
     		.show();

			
**Date picker**

Developed by Christian Schudt (http://myjavafx.blogspot.fr/).

*Example :*

     editDocumentDate = new DatePicker();
     editDocumentDate.setDateFormat(new SimpleDateFormat("dd/MM/yyyy"));
     
     editDocumentDate.getCalendarView().setShowTodayButton(true);
     editDocumentDate.getCalendarView().todayButtonTextProperty().set(properties.getProperty("today"));
     editDocumentDate.setSelectedDate(new Date());


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

