# Linux Log Troubleshooting Lab

## Objective

Practise searching, filtering, counting, and saving error messages from Linux log files using `grep`, `wc`, and output redirection.

## Environment

- Operating System: Ubuntu Linux
- Working Directory: `/home/ubuntu/linux-labs/file-operations`

## 1. Create a Sample Application Log

```bash
printf "INFO: Application started\nERROR: Database connection failed\nWARNING: High memory usage\nerror: Request timeout\nINFO: Application stopped\n" > app.log
```

This creates a sample application log containing informational messages, a warning, and two errors.

## 2. Search for Errors

```bash
grep -i "error" app.log
```

The `-i` option makes the search case-insensitive.

## 3. Display Line Numbers

```bash
grep -in "error" app.log
```

The `-n` option displays the line number of each matching entry.

## 4. Count Error Messages

```bash
grep -ic "error" app.log
```

The `-c` option counts matching lines.

Verified result: `2`

## 5. Search for Warnings

```bash
grep -in "warning" app.log
```

This locates warning messages and displays their line numbers.

## 6. Display Context Around Errors

```bash
grep -in -C 1 "error" app.log
```

The `-C 1` option displays one line before and one line after each match.

## 7. Save Errors to a Separate File

```bash
grep -i "error" app.log > error.log
```

The `>` operator saves matching lines into `error.log`, replacing its contents if the file already exists.

## 8. Count Saved Error Lines

```bash
wc -l error.log
```

Verified result:

```text
2 error.log
```

## What I Learned

- How to search log files using `grep`.
- How to find matching lines without case sensitivity.
- How to display line numbers and surrounding context.
- How to count matching messages.
- How to redirect filtered output to a separate file.
- How to verify the number of saved log entries.

## Lab Status

**Completed:** Sample log filtering and error verification.
