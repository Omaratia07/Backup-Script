#!/bin/bash

SOURCE_DIR="/etc"
BACKUP_DIR="/home/omar-alaa/backups"

mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
LOG_FILE="$BACKUP_DIR/backup.log"
REPORT_FILE="$BACKUP_DIR/report_$TIMESTAMP.txt"

START_TIME=$(date +%s)


if tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>>"$LOG_FILE"; then
END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
SIZE=$(du -h "$BACKUP_FILE" | cut -f1)

{
    echo "Backup Report"
    echo "====================="
    echo "Date       : $(date)"
    echo "Source     : $SOURCE_DIR"
    echo "Backup File: $BACKUP_FILE"
    echo "Size       : $SIZE"
    echo "Duration   : ${DURATION}s"
    echo "Status     :  SUCCESS"
} > "$REPORT_FILE"

TO="example@gmail.com"

 mail -s "Backup Success Report" "$TO" < "$REPORT_FILE"
 echo "$(date)  Backup succeeded  : $BACKUP_FILE" >> "$LOG_FILE"


 else
	  {
        echo " Backup Report"
        echo "====================="
        echo "Date       : $(date)"
        echo "Source     : $SOURCE_DIR"
        echo "Status     :  FAILED"
    } > "$REPORT_FILE"



  mail -s "Backup Failed Report" "$TO" < "$REPORT_FILE"
    echo "$(date)  Backup failed : $SOURCE_DIR" >> "$LOG_FILE"

fi
