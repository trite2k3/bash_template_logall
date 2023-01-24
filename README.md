# bash_template_logall

IEEE 1003.1 compatible?

Example log output:
---
```
2023/01/24 20:12:50 DEBUG Directory files_for_processing exists. Continue.
2023/01/24 20:12:50 DEBUG Found these file: file_1.tar processing...
2023/01/24 20:12:50 DEBUG Trying to send files.
Warning: Identity file /home/user/.ssh/id_rsa not accessible: No such file or directory.
ssh: Could not resolve hostname ip.local: Name or service not known
lost connection
2023/01/24 20:12:50 DEBUG Checking file transferred status.
2023/01/24 20:12:50 ERROR Exitcode: 1 for file: file_1.tar see above loglines for stdout/stderr.
2023/01/24 20:12:50 DEBUG Found these file: file_2.json processing...
2023/01/24 20:12:50 DEBUG Trying to send files.
Warning: Identity file /home/user/.ssh/id_rsa not accessible: No such file or directory.
ssh: Could not resolve hostname ip.local: Name or service not known
lost connection
2023/01/24 20:12:50 DEBUG Checking file transferred status.
2023/01/24 20:12:50 ERROR Exitcode: 1 for file: file_2.json see above loglines for stdout/stderr.
2023/01/24 20:12:50 DEBUG Found these file: file_3.sql processing...
2023/01/24 20:12:50 DEBUG Trying to send files.
Warning: Identity file /home/user/.ssh/id_rsa not accessible: No such file or directory.
ssh: Could not resolve hostname ip.local: Name or service not known
lost connection
2023/01/24 20:12:50 DEBUG Checking file transferred status.
2023/01/24 20:12:50 ERROR Exitcode: 1 for file: file_3.sql see above loglines for stdout/stderr.
2023/01/24 20:12:50 ERROR Exitcode: 1 for file: file_3.sql see above loglines for stdout/stderr.
```
