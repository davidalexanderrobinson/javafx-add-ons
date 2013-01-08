javafx-add-ons
==============

Some useful (or not) add ons for javafx

How to...
---------

**Use this repo ?**

Add in your pom.xml :

     <repositories>
     	<!-- 
     	<repository>
     		<id>xaviermichel-snapshots</id>
     		<url>https://github.com/xaviermichel/maven-repo/raw/master/snapshots</url>
     	</repository>
     	-->
     	<repository>
     		<id>xaviermichel-releases</id>
     		<url>https://github.com/xaviermichel/maven-repo/raw/master/releases</url>
     	</repository>
     </repositories>


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

			
*Wanna use it ?*

     <dependency>
     	<groupId>fr.xmichel.javafx</groupId>
     	<artifactId>javafx-dialog</artifactId>
     	<version>1.0.2</version>
     </dependency>

			
**Date picker**

Developed by Christian Schudt (http://myjavafx.blogspot.fr/).

*Example :*

     // load css
	 scene.getStylesheets().addAll("templates/tools/calendarstyle.css");

     editDocumentDate = new DatePicker();
     editDocumentDate.setDateFormat(new SimpleDateFormat("dd/MM/yyyy"));
     
     editDocumentDate.getCalendarView().setShowTodayButton(true);
     editDocumentDate.getCalendarView().todayButtonTextProperty().set(properties.getProperty("today"));
     editDocumentDate.setSelectedDate(new Date());

*Wanna use it ?*

     <dependency>
     	<groupId>fr.xmichel.javafx</groupId>
     	<artifactId>javafx-calendar</artifactId>
     	<version>1.0.2</version>
     </dependency>

	 
**Fieldset**

Developed by Sai Dandem (see http://code.google.com/p/javafx-demos/source/browse/trunk/javafx-demos/src/main/java/com/ezest/javafx/demogallery/FieldSetDemo.java)

*Example :*

     // load css
	 scene.getStylesheets().addAll("templates/tools/fieldset.css");

     VBox fieldSetPrinterBox = new VBox();
     fieldSetPrinterBox.setSpacing(10);
     FxFieldSet fieldSetPrinter = new FxFieldSet(fieldSetPrinterBox);
     fieldSetPrinter.setStyleClassForBorder("fieldSet");
     fieldSetPrinterBox.getChildren().addAll(new Label(properties.getProperty("question_printer")), comboPrinter);
	 
*Wanna use it ?*

     <dependency>
     	<groupId>fr.xmichel.javafx</groupId>
     	<artifactId>javafx-fieldset</artifactId>
     	<version>1.0.2</version>
     </dependency>
	  

**File selector**

That's the result of my work :p

*Example :*

     libraryLocationSelector = new DirectorySelector(properties.getProperty("select_root_library_directory"));
     libraryLocationSelector.setCurrentFilePath(Profile.getInstance().getLibraryRoot());
     libraryLocationSelector.addFileChangedListener(eventHandler);
	 
*Wanna use it ?*

     <dependency>
     	<groupId>fr.xmichel.javafx</groupId>
     	<artifactId>javafx-fileselector</artifactId>
     	<version>1.0.2</version>
     </dependency>

	 
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

Use xmi_maven_deployer.sh, it better ! :-)
