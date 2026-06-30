---
title: PermissionRange
description: Learn how to use PermissionRange elements in RadWordsProcessing to define protected regions in flow documents.
page_title: PermissionRange
slug: radwordsprocessing-model-permissionrange
tags: permission, range, word, docx, document, flow, model, protection, restricted, access
published: True
position: 15
---

# PermissionRange

A `PermissionRange` object holds annotation markers that specify the range of document elements it refers to. Every permission has a corresponding `PermissionRangeStart` and `PermissionRangeEnd`, which are inline elements. These two elements specify the range's location as follows:


* `PermissionRangeStart`: Specifies the start of a permission annotation.
* `PermissionRangeEnd`: Specifies the end of a permission annotation.


## Inserting a PermissionRange

Creating a `PermissionRange` requires passing an instance of the `PermissionRangeCredentials` class to the constructor. You can create credentials in either one of the following ways:

* `PermissionRangeCredentials(EditingGroup editingGroup)`: Initializes credentials with a type of user group. The enumeration exposes the following members:
	* `None`: Specifies that none of the users that open the document are allowed to edit range permissions using this editing group when document protection is enforced.
	* `Everyone`: Specifies that all users that open the document are allowed to edit range permissions using this editing group when document protection is enforced.
	* `Administrators`: Specifies that only users who the viewing application associates with the Administrators group are allowed to edit the contents between the start and end permission ranges when document protection is enforced.
	* `Contributors`: Specifies that only users who the viewing application associates with the Contributors group are allowed to edit the contents between the start and end permission ranges when document protection is enforced.
	* `Editors`: Specifies that only users who the viewing application associates with the Editors group are allowed to edit the contents between the start and end permission ranges when document protection is enforced.
	* `Owners`: Specifies that only users who the viewing application associates with the Owners group are allowed to edit the contents between the start and end permission ranges when document protection is enforced.
	* `Current`: Specifies that only users who the viewing application associates with the Current group are allowed to edit the contents between the start and end permission ranges when document protection is enforced.
* `PermissionRangeCredentials(string editor)`: Initializes credentials by passing the single user's name, email, or domain credentials.


>important The credentials you specify to a permission range are used by the consumer of the generated document and it is responsible for enforcing them when the document is protected. A protected document can still be edited with the API of `RadWordsProcessing`.

**Example 1** demonstrates how to create permission credentials for a single user specified by email and a permission range in a [Paragraph]({%slug radwordsprocessing-model-paragraph%}).


**Example 1: Add PermissionRange to paragraph**

<snippet id='libraries-flow-model-permissionrange-1'/>

The paragraph must belong to the same document that is passed to the constructor of the `PermissionRange` object. Otherwise, an exception is thrown.


You can also insert a `PermissionRange` in the document through [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). Since a permission range refers to a specific document element or a range of elements, there are several overloads for the `InsertPermissionRange()` method—accepting a `TableCell`, `TableRow`, or two inline elements representing the start and end of the range.

**Example 2** demonstrates how to specify that a `TableCell` can be edited by everyone when protection is enforced.

**Example 2: Insert PermissionRange for TableCell**

<snippet id='libraries-flow-model-permissionrange-2'/>


## Operating with Permission Ranges

### Enforcing Protection

Including permission ranges in a document is not enough to protect them from editing. You also need to enforce the protection. Protect and unprotect a document with the `Protect()` and `Unprotect()` methods of `RadFlowDocumentEditor` respectively. When enforcing and stopping the protection, you have the option to pass a string password to the methods and specify the type of editing restrictions using the `ProtectionMode` enumeration.

`ProtectionMode` exposes the following members:

* `NoProtection`: Specifies that no editing restrictions are applied.
* `AllowComments`: Specifies that working with comments is allowed in addition to editing in permission ranges.
* `ReadOnly`: Specifies that editing is allowed only in permission regions by the users or groups that have permissions for edition. This mode is applied when the `ProtectionMode` parameter is not passed to the `Protect()` method.

>note In MS Word, [passwords are case-sensitive and can be a maximum of 15 characters long](https://support.microsoft.com/en-us/office/protect-a-document-with-a-password-05084cc3-300d-4c1a-8416-38d3e37d6826).

**Example 3** shows how to protect and unprotect a document using the various overloads of the methods.

**Example 3: Protect and unprotect document through RadFlowDocumentEditor**

<snippet id='libraries-flow-model-permissionrange-3'/>


>The last call to the `Unprotect()` method in **Example 3** enforces protection of type `NoProtection` to the document. Protecting a document notifies the user that changes are not recommended, but stopping the protection is still possible. The `Unprotect(string password)` overload is provided for your convenience and returns a *Boolean* result of the action.

### Modifying Document Protection Settings

`RadFlowDocument` exposes a property of type `ProtectionSettings`—`ProtectionSettings`. You can enforce protection directly through the document by setting the `Enforced` property as demonstrated in **Example 4**.

**Example 4: Enforce protection through RadFlowDocument**

<snippet id='libraries-flow-model-permissionrange-4'/>

The settings provide several other modification options, including changing the algorithm used to protect the document with one of the predefined values in the `ProtectionAlgorithmNames` enumeration.


## See Also

* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
