---
title: Comments
page_title: Comments 
slug: radspreadprocessing-features-comments
tags: comments, xlsx
published: True
position: 23
platforms: mvc, ajax, blazor, wpf, winforms, xamarin, winui, core
---


# Comments

Since R2 2022 the SpreadProcessing library supports working with comments. Comments are used for marking information about a cell's data and can have one or multiple [Replies] (#replies). All comments can be found in the __Comments__ property of the worksheet, which is of the type __CommentCollection__. This collection holds __SpreadsheetComment__ objects, which represent the comments. Each comment has the following members:

***Properties***:

* __CellIndex:__  Gets or sets the cell index the comment is assigned to. 
* __Text:__ Gets or sets the text of the comment. 
* __CreationDate:__ Gets or sets the date when the comment is created. Nullable.
* __Author:__ Gets or sets the author assigned to the comment.
* __Replies:__ Gets the comment replies. The list is sorted by CreationDate.
* __IsResolved:__ Gets or sets a value indicating whether the comment is resolved.

 >note All of the above properties will push a change to the undo stack when modified. 
 
***Methods***:

* __AddReply:__ Adds a SpreadsheetCommentReply to the ReplySortedCollection. The collection will be re-sorted by SpreadsheetReply`s CreationDate in ascending order after adding an object.
* __RemoveReply:__ Removes the specified reply from the collection.

## Working with CommentCollection

### Adding comments

To add a comment you need to specify the cell index to which the comment will be related, the author, the text content, and the creation date. Specifying the creation date is optional and by default, its value is the current date and time.

#### __[C#] Example 1: Add comment__

{{region cs-radspreadprocessing-features-comments_0}}
	
    CellIndex relatedCellIndex = new CellIndex(1, 1);
    string author = "John Doe";
    string text = "Comment Content";
	DateTime creationDate = DateTime.Now;

	worksheet.Comments.Add(relatedCellIndex, author, text, creationDate);

{{endregion}}

The above snippet will add a comment in cell B2.


### Removing Comments

To remove a comment, you should specify the comment instance. This instance can be obtained from the __CommentCollection__.

#### __[C#] Example 2: Remove comment__

{{region cs-radspreadprocessing-features-comments_1}}
	
    SpreadsheetComment comment = worksheet.Comments[0];
	worksheet.Comments.Remove(comment);

{{endregion}}


## Replies

Each comment can be replied to, forming a thread of information. All replies can be found in the __Replies__ property of the comment, which is of the type __ReplySortedCollection__. This collection holds __SpreadsheetCommentReply__ objects which represent the replies. The __ReplySortedCollection__ has the following members:

***Properties***:

* __Count:__ Gets the number of elements contained in the ReplySortedCollection.

***Methods***:

* __Add:__ Adds a __SpreadsheetCommentReply__ to the __ReplySortedCollection__. The collection will be re-sorted by __SpreadsheetReply`s__ CreationDate in ascending order after adding an object. Requires an object of type __SpreadsheetCommentReply__ and can be used for adding existing replies. For adding a new reply, it is best to use the __SpreadsheetComment.AddReply()__ method.
* __Remove:__ Removes the specified __SpreadsheetCommentReply__ object from the ReplySortedCollection.
* __RemoveAt:__ Removes the element at the specified index of the __ReplySortedCollection__.
* __Clear:__ Removes all elements from the __ReplySortedCollection__.
* __Contains:__ Determines whether an element is in the __ReplySortedCollection__.
* __CopyTo:__ Copies the entire __ReplySortedCollection__ to a compatible one-dimensional array, starting at the specified index of the target array.


#### __[C#] Example 3: Working with Replies

{{region cs-radspreadprocessing-features-comments_2}}

	void MyProgram()
        {
            Workbook workbook = new Workbook();
            Worksheet worksheet = workbook.Worksheets.Add();

            string text = "First Comment";
            CellIndex relatedCellIndex = new CellIndex(0, 0); // Cell A1
            AddCommentWithRepliesToWorksheet(worksheet, relatedCellIndex, text, 2); // First comment will have 2 replies


            relatedCellIndex = new CellIndex(1, 1); // Cell B2
            text = "Second Comment";
            AddCommentWithRepliesToWorksheet(worksheet, relatedCellIndex, text, 0); // Second comment will have 0 replies


            // Add existing reply using the Add() method of __SpreadsheetCommentReply__

            var firstComment = worksheet.Comments[0];
            var secondComment = worksheet.Comments[1];

            SpreadsheetCommentReply reply = firstComment.Replies[0];
            secondComment.Replies.Add(reply); // Copies reply #1 from firstComment to secondComment

            //Remove
            firstComment.Replies.Remove(reply);

            //Clear
            firstComment.Replies.Clear();

            //Contains
            firstComment.Replies.Contains(reply); // Returns false

            //CopyTo
            SpreadsheetCommentReply[] replyArray = new SpreadsheetCommentReply[1];
            secondComment.Replies.CopyTo(replyArray, 0);
        }

        void AddCommentWithRepliesToWorksheet(Worksheet worksheet, CellIndex relatedCellIndex, string commentText, int repliesCount)
        {
            string authorName = "Jane Doe";
            DateTime creationDate = DateTime.Now;
            SpreadsheetComment comment = worksheet.Comments.Add(relatedCellIndex, authorName, commentText, creationDate);

            for (int i = 0; i < repliesCount; i++)
            {
                string replyText = "Reply #" + (i + 1);
                comment.AddReply(authorName, replyText, creationDate); // Add new reply using the SpreadsheetComment.AddReply() method 

            }

        }

{{endregion}}


### Events

Both __CommentCollection__ and __ReplySortedCollection__ expose the following events, which work identically for both types:
* __Changing:__ Occurs prior to changing the collection.
* __Changed:__ Occurs after the collection has changed.

The two events for both collections use similar enumeration types for event arguments, with two possible values:
 
* __Add:__ Used when Adding a Comment or Reply
* __Remove:__ Used when Removing a Comment or Reply

#### __[C#] Example 4: Changing the author of a comment upon adding it to the CommentCollection using the Changing event__

{{region cs-radspreadprocessing-features-comments_3}}

    void Comments_Changing(object sender, ShapeCollectionChangingEventArgs<SpreadsheetComment> e)
	{
		SpreadsheetComment comment = e.Shape;
		if (e.ChangeType == ShapeCollectionChangeType.Add)
		{
			comment.Author = "Comment Author";
		}
	}

{{endregion}}

#### __[C#] Example 5: Changing the author of a reply upon adding it to the ReplySortedCollection using the Changing event__

{{region cs-radspreadprocessing-features-comments_4}}

	void Replies_Changing(object sender, ReplySortedCollectionChangingEventArgs e)
	{
		if (e.ChangeType == ReplySortedCollectionChangeType.Add)
		{
			e.Reply.Author = "Reply Author";
		}
	}

{{endregion}}



## See Also

 * [Working with Notes]({%slug radspreadprocessing-features-notes%})
 * [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
