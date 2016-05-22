#!/bin/bash
tar -zcvpf /media/craig/Portable/linux_backups/fullbackup.tar.gz --directory=/ --exclude=proc --exclude=sys --exclude=dev/pts --exclude=media .
