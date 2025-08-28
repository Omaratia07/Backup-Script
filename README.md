#Backup Script
---

````markdown
# 🗂️ Backup Script

## 📌 Features
- Create compressed backups (`.tar.gz`) of any directory.  
- Generate a detailed **report file** for each backup.  
- Maintain a **log file** of all backup operations.  
- Optional **email notifications** with the report.  
- Easy to automate with **cron jobs**.  

---

## 📋 Prerequisites
- Linux environment (tested on Ubuntu).  
- `tar` (usually installed by default).  
- `mail` or `mailutils` (for email notifications, optional).  

---

## ⚙️ Configuration (Important!)
Before running the script, edit the following variables inside `backup.sh`:  

```bash
SOURCE_DIR="/etc"                   # Directory you want to back up
BACKUP_DIR="/home/omar-alaa/backups" # Folder where backups will be stored
TO="your-email@example.com"          # Email address for reports (leave "" to disable)
````

👉 **Note:** You must change these paths/emails to fit your environment.
If you don’t need email reports, simply set `TO=""`.

---

## ▶️ Example Commands

### 1. Make the script executable:

```bash
chmod +x backup.sh
```

### 2. Run the script manually:

```bash
./backup.sh
```

---

## 📑 Report Output

Each run generates a report file, for example:

```
$BACKUP_DIR/report_2025-08-28_17-43-03.txt
```

---

## 📂 Example Output

Sample successful report:

```
Backup Report
=====================
Date       : Thu Aug 28 17:43:03 EEST 2025
Source     : /etc
Backup File: /home/omar-alaa/backups/backup_2025-08-28_17-43-03.tar.gz
Size       : 120M
Duration   : 18s
Status     : SUCCESS
```

---

## 📧 Email Notification

If `TO` is set, the report will be emailed:

* **Subject:** `Backup Success Report` or `Backup Failed Report`.
* **Body:** Contents of the report file.

If no email is required, set:

```bash
TO=""
```

---

## ⏰ Automate the Script with Cron Job

You can schedule automatic backups using **cron**.

Edit the crontab:

```bash
crontab -e
```

### Example: Run the script every day at 2 AM

```
0 2 * * * /path/to/backup.sh
```

### This cron job will:

* Create a new backup of your chosen directory every day at 2 AM.
* Store the backup in `$BACKUP_DIR`.
* Log the operation into `backup.log`.
* Generate a report file.
* (Optional) Send the report to your email if configured.

