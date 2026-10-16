# Bash Scripting – Linux Administration & DevOps

This directory contains practical Bash scripting projects created to automate routine Linux system administration tasks, including file backups, disk monitoring, email alerts, cron scheduling, and log management.

## Projects

| No. | Project | Description |
|---|---|---|
| 1 | [Daily Automatic Backup](./daily_automatic_backup.sh) | Creates a timestamped, compressed backup archive using `tar`. |
| 2 | [Disk Usage Alert](./disk_usage_alert.sh) | Monitors root filesystem usage and sends an email alert when usage reaches the configured threshold. |

---

## 1. Daily Automatic Backup

### Overview

This Bash script creates a compressed backup archive of the `linux-lab` directory in the user's home directory.

The archive filename includes a timestamp to distinguish backup versions. The script also displays the backup location and lists the files in the backup destination.

**Script:** [Daily Automatic Backup](./daily_automatic_backup.sh)

### How It Works

1. Defines the source directory as `$HOME/linux-lab`.
2. Defines the backup destination as `$HOME/backup`.
3. Generates a timestamp for the archive filename.
4. Creates the destination directory if it does not exist.
5. Uses `tar` with gzip compression to create the backup archive.
6. Displays the completed archive path and lists the backup destination contents.

### Configuration

| Variable | Purpose |
|---|---|
| `source` | Source directory for the backup |
| `dest` | Destination directory for backup archives |
| `Date` | Timestamp used in the archive filename |

### Commands Used

- `date` – Generates a timestamp.
- `mkdir -p` – Creates the backup directory if needed.
- `tar -czf` – Creates a gzip-compressed archive.
- `ls -lh` – Lists files with human-readable sizes.
- `echo` – Displays status information.

### Backup Location

```text
Source:      $HOME/linux-lab/
Destination: $HOME/backup/
Archive:     linux-lab-backup-TIMESTAMP.tar.gz
```

The actual timestamp is generated when the script runs.

### Manual Execution

```bash
bash "daily_automatic_backup.sh"
```

### Scheduling with Cron

If you want to schedule the backup daily at 10:00 PM, an example cron entry is:

```cron
0 22 * * * /bin/bash "/home/ubuntu/linux-admin-lab/labs/bash-scripting/daily_automatic_backup.sh"
```

Adjust the path to match your actual repository location. This is an example schedule; it does not confirm that the cron job is already configured.

### Skills Demonstrated

Bash scripting, file backup automation, timestamp generation, archive compression, directory management, and cron scheduling.

---

## 2. Disk Usage Alert

### Overview

This Bash script checks the disk usage of the root filesystem (`/`) and compares it against a configured threshold.

When disk usage reaches or exceeds the threshold, the script displays an alert and attempts to send an email using `msmtp`. Otherwise, it displays a message indicating that disk usage is below the threshold.

**Script:** [Disk Usage Alert](./disk_usage_alert.sh)

### Configuration

The current threshold is:

```bash
threshold=80
```

The script uses the following commands to retrieve disk usage:

```bash
df -h /
awk 'NR>1 {print $5}'
sed 's/%//'
```

These commands retrieve the root filesystem's usage percentage and remove the percent sign for numeric comparison.

### How It Works

1. Sets the disk usage threshold to 80%.
2. Captures the current date and time.
3. Retrieves root filesystem usage.
4. Compares the current usage with the configured threshold.
5. Displays the hostname, timestamp, current usage, and threshold.
6. Attempts to send an email alert when the threshold is reached or exceeded.
7. Displays the below-threshold status when usage is lower.

### Commands and Tools Used

| Command / Tool | Purpose |
|---|---|
| `df` | Checks filesystem disk usage |
| `awk` | Extracts the usage percentage |
| `sed` | Removes the `%` character |
| `date` | Retrieves the current timestamp |
| `hostname` | Identifies the server |
| `printf` | Formats the email message |
| `msmtp` | Sends the email alert |
| `cron` | Schedules recurring script execution |

### Email Alert

The existing script is configured to send an email to:

`example@gmail.com`

The email subject is `Disk usage alert`.

A working `msmtp` installation and email configuration are required for successful delivery.

### Cron Automation and Logging

The script is scheduled to run every minute, with its output appended to a log file.

Example cron configuration:

```cron
* * * * * /bin/bash "/home/ubuntu/linux-admin-labs/labs/bash-scripting/disk_usage_alert.sh" >> /home/ubuntu/disk-usage.log 2>&1
```

This example records standard output and error output in `/home/ubuntu/disk-usage.log`. Adjust the paths to match your actual configuration.

To inspect the log:

```bash
tail -f /home/ubuntu/disk-usage.log
```

To check the saved cron configuration:

```bash
crontab -l
```

### Testing

Check the current root filesystem usage:

```bash
df -h /
```

Run the script manually:

```bash
bash disk_usage_alert.sh
```

For threshold testing, you can temporarily lower the threshold in the script, run it, and restore the original value afterward. This may trigger a real email, so test accordingly.

### Skills Demonstrated

Linux disk monitoring, Bash conditionals, text processing, email notifications, cron automation, and log inspection.

---

## Learning Outcomes

Through these projects, I am developing practical skills in:

- Bash scripting and automation
- Linux file and directory management
- Compressed backups using `tar`
- Disk usage monitoring
- Email-based alerting
- Cron job scheduling
- Log inspection and troubleshooting

## Disclaimer

These scripts are intended for Linux administration practice and learning. Verify paths, backup archives, cron schedules, and email configuration before using them in production environments.

