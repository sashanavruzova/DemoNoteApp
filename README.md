# 📝 DemoNoteApp
## Demo project to demonstrate usage of technologies in iOS development. 
This is a test task to apply for a job. The description of the task is the following:
Develop a Note App which includes :
- Login / Register screen : If the user is unknown, he will have to register. If he is known he’ll just login, and if the login is cached he will be transferred to the next screen.
- Users Screen : On first launch only, pull the data from this api, find a way to save it :https://api.mockaroo.com/api/729a5c80?count=120&key=947b40d0
Display the obtained data in a UITableView / UICollectionView, up to you. Each cell must contain the “first_name”, “family_name” and the “avatar”. When a cell is clicked, the user will redirected to an Info Screen the rest of the data in according with the picked cell.
- Note Screen : The note screen gives the user options to create and remove notes. When tapping a note, its details have to be displayed in another screen. The saved note must be editable.
If no notes have been retrieved, create a UI element to warn the user.
- Map Screen : Saved notes are to be displayed in the map screen according to their saved location.
When displayed elements are tapped, it will be given to edit/remove the note.

Technologies used in this project:
 - Swift language
 - UIKit
 - CoreData
 - Firebase
 - Firestore
