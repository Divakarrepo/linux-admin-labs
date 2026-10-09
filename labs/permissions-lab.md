# Linux File Permissions Lab

## Objective

Understand Linux file permissions and practise changing and verifying permissions using `chmod`, `ls -l`, and `stat`.

## Environment

* Operating System: Ubuntu Linux
* Working Directory: `/home/ubuntu/linux-labs/file-operations`

## 1. View File Permissions

Command:

```bash
ls -l file1.txt file1_backup.txt
```

This displays file permissions, ownership, file size, and modification time.

## 2. Change Numeric Permissions

Command:

```bash
chmod 640 file1.txt
```

Permission breakdown:

* Owner: Read and write
* Group: Read only
* Others: No permissions

Verify:

```bash
stat -c "%a %n" file1.txt
```

Expected result:

```text
640 file1.txt
```

## 3. Add Execute Permission

Command:

```bash
chmod u+x file1.txt
```

This adds execute permission for the file owner.

## 4. Remove Execute Permission

Command:

```bash
chmod u-x file1.txt
```

This removes execute permission from the file owner.

## 5. Set Read-Only Permissions

Command:

```bash
chmod 444 file1_backup.txt
```

All users receive read permission, with no write or execute permission.

## 6. Restore Backup Permissions

Command:

```bash
chmod 664 file1_backup.txt
```

This restores read and write permissions for the owner and group, and read permission for others.

## 7. Final Verification

Command:

```bash
stat -c "%A (%a) %n" file1.txt file1_backup.txt
```

Verified output:

```text
-rw-r----- (640) file1.txt
-rw-rw-r-- (664) file1_backup.txt
```

## What I Learned

* How to interpret symbolic Linux permissions.
* How numeric permissions such as `640`, `444`, and `664` work.
* How to add and remove permissions using symbolic notation.
* How to verify permissions using `ls -l` and `stat`.

## Lab Status

**Completed:** File permission changes and verification.
