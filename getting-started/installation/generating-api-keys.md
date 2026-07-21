---
title: Generating API Keys
page_title: Generating API Keys
description: Learn how to use API Keys to authenticate with the Telerik NuGet server and restore Telerik Document Processing packages in your CI or desktop environment.
slug: generating-api-keys
tags: api, key, nuget, authentication, ci, telerik, security, packages
published: True
position: 9
---
 
# Generating API Keys

Using API Keys provides a secure way to authenticate. This method does not require you to provide your Telerik credentials anywhere. Unlike your Telerik credentials, an API key has a **limited scope** and can be used only with the Telerik NuGet server. If any of your API Keys is compromised, you can quickly delete it and create a new one.

1. Go to the [Telerik account API key management page](https://www.telerik.com/account/downloads/api-keys).

1. Click **Generate New Key +**.

    **Telerik account API Keys page with the Generate New Key action**

    ![Telerik account API Keys page with the Generate New Key action](images/generate-api-key.png) 

1. In the **Key Note** field, add a note that describes the API key.

1. Click **Generate Key**.

    **Telerik account dialog for generating a new API key**

    ![Telerik account dialog for generating a new API key](images/generate-key-button.png) 

1. Select **Copy and Close**. Once you close the window, you can no longer copy the generated key. For security reasons, the API Keys page displays only a portion of the key.

    **Telerik account dialog showing the Copy and Close action for a generated API key**

    ![Telerik account dialog showing the Copy and Close action for a generated API key](images/generated-api-key-copy-close.png)   

    >note The illustrated API key is used for demonstration purposes only and is not valid.

    **Telerik account API Keys page showing a newly generated NuGet API key entry**

    ![Telerik account API Keys page showing a newly generated NuGet API key entry](images/generatee-api-key.png)  

    >important The validity of the API key is 2 years.

1. Store the generated NuGet API key as you will need it in the next steps. Whenever you need to authenticate your system with the Telerik NuGet server, use api-key as the username and your generated API key as the password.
 
## See Also

* [Restore NuGet packages in a CI workflow]({%slug using-nuget-keys%})
* [Configure NuGet package installation]({%slug installation-nuget-packages%})