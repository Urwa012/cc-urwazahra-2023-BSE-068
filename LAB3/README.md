# 🧠 Cloud Computing – Lab 3
**Fatima Jinnah Women University**

**Subject:** Cloud Computing  
**Name:** Urwa Zahra (5-B)  
**Registration Number:** 2023-BSE-068  
**Submitted To:** Sir Muhammad Shoaib  

---

## 📘 Overview
This lab demonstrates advanced Git workflows such as handling merge/rebase conflicts, `.gitignore` usage, stash, reset, amend/revert, force push, Gitea setup using Docker, and GitHub Pages deployment.  
Each task includes screenshot links with the exact filenames as provided.

---

## 🧩 Task 1 – Handling Local and Remote Commit Conflicts
[remote_edit.png task1(1)](remote_edit.png%20task1%281%29)  
[local_commit.png task1(2)](local_commit.png%20task1%282%29)  
[push_error.png task1(3)](push_error.png%20task1%283%29)  
[merge_commit.png task1(4)](merge_commit.png%20task1%284%29)  
[push_after_merge.png task1(5)](push_after_merge.png%20task1%285%29)  
[rebase_pull.png task1(6i)](rebase_pull.png%20task1%286i%29)  
[push_after_rebase.png task1(6ii)](push_after_rebase.png%20task1%286ii%29)

---

## ⚔️ Task 2 – Creating and Resolving Merge Conflicts Manually
[remote_conflict_edit.png task2(1)](remote_conflict_edit.png%20task2%281%29)  
[local_conflict_edit.png task2(2)](local_conflict_edit.png%20task2%282%29)  
[local_conflict_commit.png task2(3)](local_conflict_commit.png%20task2%283%29)  
[conflict_push_error.png task2(4)](conflict_push_error.png%20task2%284%29)  
[conflict_message.png task2(5)](conflict_message.png%20task2%285%29)  
[resolved_readme.png task2(6)](resolved_readme.png%20task2%286%29)  
[rebase_continue.png task2(7)](rebase_continue.png%20task2%287%29)  
[push_after_resolve.png task2(8)](push_after_resolve.png%20task2%288%29)

---

## 🗂️ Task 3 – Managing Ignored Files with `.gitignore`
[push_textfiles.png task3(1)](push_textfiles.png%20task3%281%29)  
[gitignore_push.png task3(2)](gitignore_push.png%20task3%282%29)  
[repo_still_has_textfiles.png task3(3)](repo_still_has_textfiles.png%20task3%283%29)  
[rm_cached_push.png task3(4)](rm_cached_push.png%20task3%284%29)  
[repo_textfiles_removed.png task3(5)](repo_textfiles_removed.png%20task3%285%29)

---

## 💾 Task 4 – Create Temporary Changes and Use `git stash`
[modified_readme.png task4(1)](modified_readme.png%20task4%281%29)  
[checkout_error.png task4(2)](checkout_error.png%20task4%282%29)  
[stash_command.png task4(3)](stash_command.png%20task4%283%29)  
[branch_switched.png task4(4)](branch_switched.png%20task4%284%29)  
[back_to_feature.png task4(5)](back_to_feature.png%20task4%285%29)  
[status_clean.png task4(6)](status_clean.png%20task4%286%29)  
[stash_pop.png task4(7)](stash_pop.png%20task4%287%29)

---

## 🧭 Task 5 – Checkout a Specific Commit Using `git log`
[log_before_checkout.png task5(1)](log_before_checkout.png%20task5%281%29)  
[detached_head.png task5(2)](detached_head.png%20task5%282%29)  
[back_to_main.png task5(3)](back_to_main.png%20task5%283%29)

---

## 🔁 Task 6 – Resetting Commits (Soft vs Hard)
[first_commit.png task6(1)](first_commit.png%20task6%281%29)  
[second_commit.png task6(2)](second_commit.png%20task6%282%29)  
[log_before_reset.png task6(3)](log_before_reset.png%20task6%283%29)  
[file_before_reset.png task6(4)](file_before_reset.png%20task6%284%29)  
[soft_reset.png task6(5)](soft_reset.png%20task6%285%29)  
[log_after_soft_reset.png task6(6)](log_after_soft_reset.png%20task6%286%29)  
[file_after_soft_reset.png task6(7)](file_after_soft_reset.png%20task6%287%29)  
[file_after_hard_reset.png task6(8)](file_after_hard_reset.png%20task6%288%29)  
[hard_reset.png task6(9)](hard_reset.png%20task6%289%29)  
[log_after_hard_reset.png task6(10)](log_after_hard_reset.png%20task6%2810%29)  
[file_after_hard_reset.png task6(11)](file_after_hard_reset.png%20task6%2811%29)

---

## 📝 Task 7 – Amending the Last Commit
[first_amend_commit.png task7(1)](first_amend_commit.png%20task7%281%29)  
[amend_commit.png task7(2)](amend_commit.png%20task7%282%29)

---

## 🧨 Task 8 – Reverting a Commit (Safe Undo)
[commit_temp_file.png task8(1)](commit_temp_file.png%20task8%281%29)  
[revert_commit.png task8(2)](revert_commit.png%20task8%282%29)  
[revert_push.png task8(3)](revert_push.png%20task8%283%29)

---

## 🚀 Task 9 – Force Push (With Caution)
[new_branch.png task9(1)](new_branch.png%20task9%281%29)  
[force_commit.png task9(2)](force_commit.png%20task9%282%29)  
[push_force_branch.png task9(3)](push_force_branch.png%20task9%283%29)  
[hard_reset_force.png task9(4)](hard_reset_force.png%20task9%284%29)  
[normal_push.png task9(5)](normal_push.png%20task9%285%29)  
[force_push.png task9(6)](force_push.png%20task9%286%29)

---

## 🐳 Task 10 – Running Gitea in GitHub Codespaces via Docker Compose
[forked_gitea.png task10(1)](forked_gitea.png%20task10%281%29)  
[codespace_loading.png task10(2)](codespace_loading.png%20task10%282%29)  
[docker_up.png task10(3)](docker_up.png%20task10%283%29)  
[gitea_install_page.png task10(4)](gitea_install_page.png%20task10%284%29)  
[admin_setup.png task10(5)](admin_setup.png%20task10%285%29)  
[gitea_dashboard.png task10(6)](gitea_dashboard.png%20task10%286%29)  
[gitea_new_repo.png task10(7)](gitea_new_repo.png%20task10%287%29)

---

## 🌐 Task 11 – Creating a GitHub Pages Portfolio Site
[github_pages_repo.png task11(1)](github_pages_repo.png%20task11%281%29)  
[local_static_site.png task11(2)](local_static_site.png%20task11%282%29)  
[push_static_site.png task11(3)](push_static_site.png%20task11%283%29)  
[github_pages_settings.png task11(4)](github_pages_settings.png%20task11%284%29)  
[live_site.png task11(5)](live_site.png%20tsk11%285%29)

