# 🌩️ Cloud Computing – Lab 05

**Fatima Jinnah Women University**

**Subject:** Cloud Computing  
**Name:** Urwa Zahra (5-B)  
**Registration Number:** 2023-BSE-068  
**Submitted To:** Sir Muhammad Shoaib  

---

## 📘 Overview

This lab focuses on advanced Ubuntu server administration, package management, GUI setup, and Vim practice.  
It covers installation using `apt`, `apt-get`, `snap`, GUI configuration (XFCE & LightDM), Chrome setup, PPA installations,  
and Kubernetes YAML editing using Vim. Each task includes screenshots of commands and results.

---

## 🧩 Task 1: Discover Missing Command & Install Java using apt

Installed Java using apt suggestion, verified version, removed it, and cleared shell cache.  
![Hash Clear](task1_hash_clear(6).png)  
![Java Suggestion](task1_java_suggestion(1).png)  
![Java Install](task1_java_install(2).png)  
![Java Version](task1_java_version(3).png)  
![Java Remove](task1_java_remove(4).png)  
![Java Not Found](task1_java_not_found(5).png)

---

## 🧩 Task 2: Install & Remove Java using apt-get

Installed and removed Java explicitly using `apt-get`, and confirmed removal.  
![apt-get Install](task2_aptget_install(1).png)  
![Java Version Check](task2_java_version_after_aptget(2).png)  
![apt-get Remove](task2_aptget_remove(3).png)  
![Hash Remove](task2_hash_after_remove(4).png)

---

## 🧩 Task 3: apt update vs apt upgrade

Explored difference between `apt update` (updates package lists) and `apt upgrade` (installs updates).  
![apt Update](task3_apt_update(1).png)  
![apt Upgrade](task3_apt_upgrade(2).png)  
![Explanation File](task3_explanation(3).png)

---

## 🧩 Task 4: Install VS Code via Snap

Installed and verified Visual Studio Code via `snap`.  
![Snap Install](task4_snap_install(1).png)  
![Snap List](task4_snap_list(2).png)  
![Code Version Info](task4_code_version_or_info(3).png)  
![Snap Binary Location](task4_snap_bin_location(4).png)

---

## 🧩 Task 5: Install XFCE GUI + XRDP

Installed lightweight XFCE GUI, configured XRDP for remote access, and verified RDP connection.  
![System Update](task5_update(1).png)  
![XFCE Install](task5_xfce_install(2).png)  
![XRDP Enable](task5_xrdp_enable(3).png)  
![XRDP Status](task5_xrdp_status(4).png)  
![XSession Config](task5_xsession(5).png)  
![RDP Connection](task5_rdp_connect(6).png)

---

## 🧩 Task 6: Install LightDM + GUI Verification

Configured LightDM greeter, verified GUI login screen, and toggled between GUI/CLI boot modes.  
![LightDM Install](task6_lightdm_install(1).png)  
![LightDM Config](task6_lightdm_config(2).png)  
![Cleanup](task6_lightdm_cleanup(3).png)  
![Restart](task6_lightdm_restart(5).png)  
![After Reboot CLI](task6_after_reboot_cli(6).png)  
![After Reboot GUI](task6_after_reboot_gui(7).png)  
![Enable GUI Boot](task6_gui_enable_boot(5).png)  
![Disable GUI Boot](task6_gui_disable_boot(8).png)  
![Start GUI](task6_gui_start_command(11).png)  
![Stop GUI](task6_gui_stop(10).png)

---

## 🧩 Task 7: Install Google Chrome (apt source & key)

Installed Google Chrome by manually adding its apt repository and GPG key.  
![Install Error](task7_install_chrome_error(1).png)  
![List /etc/apt](task7_ls_etc_apt(2).png)  
![List Sources.d](task7_ls_sources_list_d(4).png)  
![Ubuntu Sources](task7_cat_ubuntu_sources(5).png)  
![Add Key](task7_add_key(7).png)  
![Create Chrome List](task7_create_google_chrome_list(11).png)  
![Alternate Remove](task7_alternate_remove(10)_i.png)  
![Alternate Edit](task7_alternate_edit(10)_ii.png)  
![List Sources After Create](task7_list_sources_after_create(12).png)  
![Update alt](task7_apt_update_alt(14)_i.png)  
![Chrome Install](task7_install_chrome(8).png)  
![Chrome Alt Install](task7_install_chrome_alt(14)_ii.png)

---

## 🧩 Task 8: Install Applications via PPA (Audacity & OBS)

Added PPAs for Audacity and OBS Studio, installed, and verified them.  
![Add Audacity PPA](task8_add_ppa_audacity(1)_i.png)  
![Update Audacity](task8_apt_update_audacity(2)_ii.png)  
![Install Audacity](task8_install_audacity(1)_iii.png)  
![Audacity Version](task8_audacity_version(2)_ii.png)  
![Add OBS PPA](task8_add_ppa_obs(3)_i.png)  
![Update OBS](task8_apt_update_obs(3)_ii.png)  
![Install OBS](task8_install_obs(3)_iii.png)  
![OBS Launch GUI](task8_obs_launch(4)_i.png)  
![OBS Version](task8_obs_version(4)_ii.png)

---

## 🧩 Task 9: Create Kubernetes YAML using Vim

Created a sample Kubernetes YAML manifest using Vim.  
![Vim Check](task9_vim_check(1).png)  
![Make Directory](task9_mkdir_cd(2).png)  
![Vim Edit](task9_vim_edit(3).png)  
![File Saved](task9_k8s_saved(4).png)

---

## 🧩 Task 10: Edit Kubernetes YAML (Add Annotation, Verify, Discard)

Edited the YAML file to add annotations, verified correctness, and discarded temporary changes.  
![Verify Annotation](task10_verify_annotation(1).png)  
![Verify No Temp Data](task10_verify_no_temp_data(2).png)  
![Verify No Temp Comment](task10_verify_no_temp_comment(3).png)

---

## 🧩 Task 11: Vim Editing Practice

Practiced Vim delete, undo, and navigation commands.  
![Delete and Undo](task11_delete3_and_undo(2).png)  
![Line Delete](task11_line(3).png)  
![Navigation](task11_navigation(4).png)

---

## 🧩 Task 12: Vim Search, Substitute, Undo

Searched for text, performed substitution, and used undo operations in Vim.  
![Search nginx](task12_search_nginx(1).png)  
![Added Occurrences](task12_added_occurrences(3).png)  
![Cycle Matches i](task12_cycle_matches(4)_i.png)  
![Cycle Matches ii](task12_cycle_matches(4)_ii.png)  
![n and N Navigation](task12_n_and_N_navigation(2)_i.png)  
![n and N Navigation 2](task12_n_and_N_navigation(2)_ii.png)  
![Substitute Result](task12_substitute_result(6).png)  
![Undo and Quit](task12_undo_and_quit(6).png)

---

### ✅ **End of Lab 05**
