#!/bin/bash

sauvegardeMariaDB() {

	mysqldump -u admin -pAdmin-P@ss exercice1 > ~/backups/mariadb_backup/exercice1_backup.sql
	tar -czvf ~/backups/mariadb_backup/exercice1_backup.tar.gz ~/backups/mariadb_backup/exercice1_backup.sql
	rsync -Pav --delete -e "ssh -i /home/ubuntu/datascientest_architecture/.vagrant/machines/client1/docker/private_key" ~/backups/mariadb_backup/exercice1_backup.tar.gz vagrant@192.168.10.11:/home/vagrant/backup/mariadb_backup/
	rm -rf ~/backups/mariadb_backup/*.tar.*

}

sauvegardeSite() {
	tar -czvf ~/backups/site_backup/drupal_backup.tar.gz /var/www/html/drupal/
        rsync -Pav --delete -e "ssh -i /home/ubuntu/datascientest_architecture/.vagrant/machines/client1/docker/private_key" ~/backups/site_backup/drupal_backup.tar.gz vagrant@192.168.10.11:/home/vagrant/backup/drupal_backup/
        rm -rf ~/backups/site_backup/*.tar.*
}

sauvegardeMariaDB
sauvegardeSite
