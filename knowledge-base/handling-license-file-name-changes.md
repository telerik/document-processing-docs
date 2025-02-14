---
title: Handling License Key File Name and Environment Variable Name Changes in the 2025 Q1 Release
description: Learn how to handle license key file and environment variable name changes introduced with the 2025 Q1 release. 
type: troubleshooting
page_title: Handling License Key File Name and Environment Variable Name Changes in the 2025 Q1 Release
slug: handling-license-file-name-changes
tags: license,key,file,name,2025,change
res_type: kb 
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| Q1 2025| Telerik Document Processing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

After downloading the License Key file by using the VS2022 extensions menu, when I build a simple console app with the DPLs, I get the following error:
 

## Solution

It may be caused by an old KENDO_UI_LICENSE environment variable. So, delete it and invoke `refreshenv` command. If the rebuild has the same error again:
1. Go to telerik.com and generate a new license file. 
2. Compare the license key with the one downloaded from the extensions. If it indeed looks different than the one VS2022 got, replace the original telerik-license.txt file with the newly downloaded one.
3.Next, I restart VS2022 (to ensure it has a fresh copy env vars) and compile the project. It is expected to work:

