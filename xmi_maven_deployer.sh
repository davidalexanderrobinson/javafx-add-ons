#!/bin/sh

#
# Xavier - Deploiement sur repo maven github
# Le script demandera le type de deploiement
# et mettra a jour les versions des modules
#

REPO_LOCATION=../maven-repo

################################
# @params neutral message
show_neutral_message(){ 
	echo -e "\033[0;36;40m$@\033[0m"
}
# @params error message
show_error_message(){
	echo -e "\033[7;31;47m$@\033[0m"
}
# @params information message
show_information_message(){
	echo -e "\033[7;32;40m$@\033[0m"
}
################################


select deployment in snapshot release
do
	case $deployment in
		snapshot|release)
			echo "Let's make a ${deployment} deployment"
			break
			;;
		*)
			echo "Choose one of the possible choice please"
			;;
	esac
done



# in case of snapshot, we just need to deploy current snapshot version

if [ "$deployment" == "snapshot" ]
then
	mvn -DaltDeploymentRepository=${deployement}-repo::default::file:${REPO_LOCATION}/${deployment}s clean deploy

	if [ $? -eq 0 ]
	then
		show_information_message "${deployment} deployment success, you just need to add, commit and push the git repo now"
	else 
		show_error_message "${deployment} deployment failure, fix it and try again !"
	fi
	
	exit 0
fi


# now we're in case of release

current_version=$(grep '<version>' pom.xml | head -1 | sed 's/^.*>\(.*\)<.*$/\1/')
release_version=$(echo ${current_version} | sed 's/-SNAPSHOT//')

echo "current version : ${current_version}"
show_neutral_message "release version is ${release_version}, is it right (enter to confirm) ?"
read

# update module version for release
for fich in pom.xml */pom.xml
do
	echo "Updating version in ${fich}..."
	sed -i -e "s/${current_version}/${release_version}/" ${fich}
done

# release

mvn -DaltDeploymentRepository=${deployement}-repo::default::file:${REPO_LOCATION}/${deployment}s clean deploy

if [ $? -eq 0 ]
then
	show_information_message "${deployment} deployment success, you just need to add, commit and push the git repo now"
else 
	show_error_message "${deployment} deployment failure, fix it and try again !"
	exit
fi

# move to the next snaphot version

echo "Remember that the released version was the ${release_version}"
echo "What is the next snaphsot version (without -SNAPSHOT suffix) ?"
read next_snapshot_version

if [ -z "${next_snapshot_version}" ] 
then
	show_error_message "Empty version, do it yourself !"
	exit
fi

# update module version for release
for fich in pom.xml */pom.xml
do
	echo "Updating version in ${fich}..."
	sed -i -e "s/${release_version}/${next_snapshot_version}-SNAPSHOT/" ${fich}
done

show_information_message "You can commit and push changes now, the now version is set in pom.xml"

