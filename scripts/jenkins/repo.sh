#! /bin/bash
PROJECT=$(gcloud info --format='value(config.project)')

gcloud source repos create repo-sura
cd ../../nodeCode/app/appengine/standard
git init
git config credential.helper gcloud.sh
git remote add origin https://source.developers.google.com/p/${PROJECT}/r/repo-sura

while [ "${email}" = '' ]; do
		echo -n "Ingresa tu email: "
		read email
done

git config --global user.email "${email}"

while [ "${username}" = '' ]; do
		echo -n "Ingresa tu nombre de usuario: "
		read username
done

git config --global user.name "${username}"

git add .

git commit -m "Initial commit"

git push origin master