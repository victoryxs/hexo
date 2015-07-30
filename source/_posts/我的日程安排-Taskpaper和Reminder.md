title: 我的日程安排-Taskpaper和Reminder
date: 2015-07-30 16:09:31
tags: [tools,Taskpaper]
categories: tools
description: 谈一谈我对GTD的理解，以及使用Taskpaper和Reminder实现MAC端和手机端任务的同步。
---

## GTD

>参考 

>[褪墨 时间管理](http://www.mifengtd.cn/)

>《尽管去做：无压工作的艺术》[美]戴维艾伦

首先谈一谈GTD。

GTD全称为Get Things Done，GTD的核心理念概括就是必须记录下来要做的事，然后整理安排并自己一一去执行。GTD的五个核心原则是：收集、整理、组织、回顾、执行。

![GTD工作流](http://images.mifengtd.cn/37/3726/2007/11/o_gtd.JPG)

GTD的具体做法可以分成收集、整理、组织、回顾与行动五个步骤。

收集：就是将你能够想到的所有的未尽事宜（未整理的念头）（GTD中称为stuff）
统统罗列出来，放入inbox中，这个inbox既可以是用来放置各种实物的实际的文件夹或者篮子，也需要有用来记录各种事项的纸张或PDA。收集的关键在于把一切赶出你的大脑，记录下所有的工作。

整理：将stuff放入inbox之后，就需要定期或不定期地进行整理，清空inbox。将这些stuff按是否可以付诸行动进行区分整理，对于不能付诸行动的内容，可以进一步分为参考资料、日后可能需要处理以及垃圾类，而对可行动的内容再考虑是否可在两分钟内完成，如果可以则立即行动完成它，如果不行对下一步行动进行组织。

组织：个人感觉组织是GTD中的最核心的步骤，组织主要分成对参考资料的组织与对下一步行动的组织。对参考资料的组织主要就是一个文档管理系统，而对下一步行动的组织则一般可分为：下一步行动清单，等待清单和未来/某天清单。

等待清单主要是记录那些委派他人去做的工作，未来/某天清单则是记录延迟处理且没有具体的完成日期的未来计划、电子等等。而下一步清单则是具体的下一步工作，而且如果一个项目涉及到多步骤的工作，那么需要将其细化成具体的工作。

GTD对下一步清单的处理与一般的to-do list最大的不同在于，它作了进一步的细化，比如按照地点(context)（电脑旁、办公室、电话旁、家里、超市）分别记录只有在这些地方才可以执行的行动，而当你到这些地点后也就能够一目了然地知道应该做那些工作。

回顾：回顾也是GTD中的一个重要步骤，一般需要每周进行回顾与检查，通过回顾及检查你的所有清单并进行更新，可以确保GTD系统的运作，而且在回顾的同时可能还需要进行未来一周的计划工作。

执行：你可以按照每份清单开始行动了，在具体行动中可能会需要根据所处的环境，时间的多少，精力情况以及重要性来选择清单以及清单上的事项来行动。

##Taskpaper


>参考

>[Taskpaper简介](http://www.waerfa.com/taskpaper)

>[Taskpaper官网](http://www.hogbaysoftware.com/)

不同平常的OmniFocus、Clear和Good Task工具，这是一个纯文本的GTD工具。给你无限的空间去组织你的任务。

![Taskpaper mainframe](http://pix.waerfa.com//2014/03/CfakepathTaskPaper2.png)

我的组织形式包括：`Inbox` `Project` `Someday/Maybe` `Waitting-For`

一般有任何需要完成的事情，我会首先将其放入`Inbox`中，然后对其进行分类，如果是参考资料，我会将其放入evernote中保管。如果是立刻可以完成的，我就立刻去做，然后打上`@done`的标签。如果是不能立刻完成的，我会对其进行分类，放入`Project`中的`Personal`列表或者`Work`列表中。如果是委托给他人完成的事情放入`Waitting-For`中，加上`@delegate`标签和委托人。如果是以后需要完成的事情，我会放入`Someday/Maybe`列表中，等待以后分配和完成。每一次通过从Project中选择事情完成，完成后打上`@done`的标签。每天晚上通过内置的archieve功能对所有完成的事情进行回收和总结。

##与Reminder同步，实现手机端提示

首先上代码

```
tell (current date) as «class isot» as string to set current_date to text 1 thru 10
to joinList(aList, delimiter)
	set retVal to ""
	set prevDelimiter to AppleScript's text item delimiters
	set AppleScript's text item delimiters to delimiter
	set retVal to aList as string
	set AppleScript's text item delimiters to prevDelimiter
	return retVal
end joinList
to splitString(aString, delimiter)
	set retVal to {}
	set prevDelimiter to AppleScript's text item delimiters
	log delimiter
	set AppleScript's text item delimiters to {delimiter}
	set retVal to every text item of aString
	set AppleScript's text item delimiters to prevDelimiter
	return retVal
end splitString


# See if any tasks in Reminders.app "Next-Actions" list are completed
# Mark those that are as @done in TaskPaper
# Delete tasks currently in Reminders.app "Now" list
tell application "TaskPaper" to run
tell application "Reminders"
	run
	tell account "iCloud"
		tell list "Next-Actions"
			set tasks to get reminders
			repeat with k from 1 to length of tasks
				set this_task to item k of tasks
				set is_completed to get completed of this_task
				if is_completed is true then
					set this_task_name_and_project to get name of this_task
					set tmp to my splitString(this_task_name_and_project as text, ": ")
					set this_task_name to item 2 of tmp
					tell application "TaskPaper"
						tell document "todo.taskpaper"
							repeat with each in search with query this_task_name
								tell each
									if entry type of each is not project type then
										make tag with properties {name:"done", value:current_date}
										exit repeat
									end if
								end tell
							end repeat
						end tell
					end tell
				end if
			end repeat
			delete reminders
		end tell
	end tell
end tell

# Move "Next-Actions" tasks from TaskPaper to Reminders.app
tell application "TaskPaper"
	run
	tell document "todo.taskpaper"
		set debug to ""
		repeat with each in search with query "((@today or @overdue or @due <= " & current_date & " ) and not @done)+d"
			if (containing project of each is not missing value) and (entry type of each is not project type) and (entry type of each is not note type) then
				set containing_project to name of containing project of each
				if containing project of (containing project of each) is not missing value then
					set containing_project to (name of containing project of containing project of each) & "/" & name of containing project of each
				end if
				set the_task to containing_project & ": " & name of each
				set the_priority to 0
				set the_note to ""
				if exists (tag named "priority" of each) then
					set the_priority to value of tag named "priority" of each
				end if
				if exists (note of each) then
					set the_note to name of note of each
				end if
				tell application "Reminders"
					run
					tell account "iCloud"
						tell list "Next-Actions"
							set newremin to make new reminder
							set name of newremin to the_task
							set priority of newremin to the_priority as number
							set body of newremin to the_note
							
						end tell
					end tell
				end tell
			end if
		end repeat
	end tell
end tell

# Move Reminders.app inbox to TaskPaper
# Include the due date, if there is one
tell application "Reminders"
	tell account "iCloud"
		tell list "Inbox"
			set inbox_contents to (get reminders)
			if length of inbox_contents is greater than 0 then
				repeat with k from 1 to length of inbox_contents
					set this_todo to item k of inbox_contents
					set inbox_item to "- " & (get name of this_todo)
					set due_date to (get due date of this_todo)
					set due_date_string to ""
					if due_date is not missing value then
						set y to text -4 thru -1 of ("0000" & (year of due_date))
						set m to text -2 thru -1 of ("00" & ((month of due_date) as integer))
						set d to text -2 thru -1 of ("00" & (day of due_date))
						set due_date_string to " @due(" & y & "-" & m & "-" & d & ")"
					end if
					set inbox_item to inbox_item & due_date_string
					tell application "TaskPaper"
						tell document "todo.taskpaper"
							tell project "Inbox"
								make new entry with properties {name:inbox_item}
							end tell
							save
						end tell
					end tell
					delete this_todo
				end repeat
			end if
		end tell
	end tell
end tell
tell application "Reminders" to quit
```

这段AppleScript代码实现从IOS端的Inbox中同步到Taskpaper文件中的Inbox，将标上`@today` `@overdue` `@due<current time` `not @done`的任务从Taskpaper同步到IOS端，并将IOS端完成的事情在Taskpaper上打上`@done`的标签。