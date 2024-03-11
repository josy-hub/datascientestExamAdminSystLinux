#!/bin/bash

sauvegardeMariaDB() {

	mysql -u admin --password 'Admin-P@ss' exercice1 > ~/backups/mariadb_backup/exercice1_backup.SQL
	tar -czvf ~/backups/mariadb_backup/exercice1_backup.tar.gz ~/mariadb_backup/exercice1_backup.SQL
	sshpass -p "vagrant" rsync -av --delete -e ssh ~/backups/mariadb_backup/exercice1_backup.tar.gz vagrant@192.168.10.11:/home/vagrant/backup/mariadb_backup/
	#rsync -av -e ssh --delete ~/exercice1_backup.SQL/ vagrant@192.168.10.11:/home/vagrant/backup/mariadb_backup/
	rm -rf ~/backups/mariadb_backup/*.tar.*

}

sauvegardeSite() {
	tar -czvf ~/backups/site_backup/drupal_backup.tar.gz /var/www/html/drupal/
        sshpass -p "vagrant" rsync -av --delete -e ssh ~/backups/site_backup/drupal_backup.tar.gz vagrant@192.168.10.11:/home/vagrant/backup/drupal_backup/
        rm -rf ~/backups/site_backup/*.tar.*
}

sauvegardeMariaDB
sauvegardeSite
