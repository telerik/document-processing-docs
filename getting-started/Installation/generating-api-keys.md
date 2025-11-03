---
title: Generating API Keys
page_title: Generating API Keys
description: Learn how to use API Keys to authenticate with the Telerik NuGet server and restore Telerik Document Processing packages in your CI or desktop environment.
slug: generating-api-keys
tags: telerik, document, processing, restore, nuget, packages, ci, continuous, integration, installation, api, key
published: True
position: 9
---
 
# Generating API Keys

Using API Keys provides a secure way to authenticate. This method does not require you to provide your Telerik credentials anywhere. Unlike your Telerik credentials, an API key has a **limited scope** and can be used only with the Telerik NuGet server. If any of your API Keys is compromised, you can quickly delete it and create a new one.

1. Go to the [API Keys](https://www.telerik.com/account/downloads/api-keys) page in your Telerik account.

1. Click **Generate New Key +**.

    ![Generate API key](images/generate-api-key.png) 

1. In the **Key Note** field, add a note that describes the API key.

1. Click `Generate Key`.

    ![Generate API key](images/generate-key-button.png) 

1. Select `Copy and Close`. Once you close the window, you can no longer copy the generated key. For security reasons, the API Keys page displays only a portion of the key.

    ![Copy and Close API key](images/generated-api-key-copy-close.png)   

    >note The illustrated API key above is used just for demonstration purposes and it is not valid!

    ![Generated API key](images/generatee-api-key.png)  

    >important The validity of the API key is 2 years.

1. Store the generated NuGet API key as you will need it in the next steps. Whenever you need to authenticate your system with the Telerik NuGet server, use api-key as the username and your generated API key as the password.
 
## See Also

* [Restoring NuGet Packages in Your CI Workflow]({%slug using-nuget-keys%})
* [Install using NuGet Packages]({%slug installation-nuget-packages%})