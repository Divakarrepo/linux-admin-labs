# Linux File Operations Lab

## Objective

Practice creating, listing, copying, renaming, and deleting files and directories.

## Environment

* Operating System: Ubuntu Linux
* Shell: Bash

## Tasks

### 1. Create a practice directory

```bash
mkdir -p ~/linux-labs/file-operations
cd ~/linux-labs/file-operations
```

### 2. Verify the current directory

```bash
pwd
```

Expected result: The path should end with `linux-labs/file-operations`.

### 3. Create sample files

```bash
touch notes.txt
touch backup.txt
ls -l
```

### 4. Write content to a file

```bash
echo "Linux file operations practice" > notes.txt
cat notes.txt
```

### 5. Copy a file

```bash
cp notes.txt notes-copy.txt
ls -l
```

### 6. Rename a file

```bash
mv backup.txt old-backup.txt
ls -l
```

### 7. Remove a file

```bash
rm notes-copy.txt
ls -l
```

### 8. Verify the final state

```bash
cat notes.txt
ls -la
```

## Validation

Record the actual output of the commands and verify that:

* `notes.txt` contains the expected text.
* `notes-copy.txt` no longer exists.
* `old-backup.txt` exists.

## Troubleshooting

* While creating a multiple directory, initially I was not used "-p" after I come to know it was used to create a parent & child directory.
* I missed to change working path before creating files. So, it was created in a home directory. Then I removed the file and change the directory then create a file in required directory.

## Execution Results

**Environment:** Ubuntu Linux

**Working Directory:** `/home/ubuntu/linux-labs/file-operations`

### Tasks Completed

* [x] Created practice files using `touch`
* [x] Added content using `echo` and output redirection
* [x] Copied a file using `cp`
* [x] Renamed a file using `mv`
* [x] Deleted a practice file using `rm`
* [x] Verified file content using `cat`
* [x] Compared original and backup using `diff`
* [x] Saved verification results using `tee`

### Verification

**Command:**

```bash
diff file1.txt file1_backup.txt
```

**Result:** No output was produced, confirming that both files have identical content.

**Final Status:** PASS — File operations and backup verification completed successfully.

### What I Learned

* Firstly, I checked in which path currently I am working using "pwd" command.
* I was learned through this journey how to create a single directory and multiple directories using "-p" command.
* Then I learned how move to another directories using "cd" command.
* And I created an empty file using "touch" command and add a content using "echo" command redirect into the file.
* I used "cp" & "mv" command to copy files and move or rename the file.
* Using "cat" command to view the content of the file in the terminal
* Using "rm" command removed the file 
* "ls -l" & "ls -la" is used to list the files in the directories. 
* How to perform basic Linux file operations.
* How to verify copied files using `diff`.
* How to capture command output in a file using `tee`.
* Why verification is important when performing Linux administration tasks.

  ### Terminal Screenshot

![File Operations Lab](screenshots/file-operations-lab.png)

