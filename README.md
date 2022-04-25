# SeatGeek Coding Challenge - SwiftUI

### Summary:
Your challenge is to write a small, focused native mobile app which provides a type-ahead
search using the public Seat Geek API.
The search should update a list of returned results in real-time as the user's search query
changes. Results should be able to be individually tapped by the user to navigate to a
corresponding details screen. On the details screen, the full event information can then be
viewed by the user.
The requirements for this exercise are presented in phases, mimicing an iterative delivery
process and allowing for flexible time spent by you to complete. Phase 1 can be considered the
'MVP' feature list for the app's launch. Subsequent phases consist of features which enhance
the user experience and completing these are optional but will be given more weight in the
review process.

## Requirements:

### Phase 1:

1. Write a type-ahead search client integration against the public Seat Geek API detailed
below
2. On launch of the app and home view, an unfiltered list of events should be displayed with
UX exactly matching the comp below (Search Results)
3. As a user types their search query, the result event list should update in real-time (aka
type-ahead search)
4. When an event in the result list is tapped, the app should navigate to the event details view
5. The event detail screen should present detailed event information to the user for the
selected Event with UX exactly matching the comp below (Event Details)
6. All code in this phase should be testable by peer reviewers

### Phase 2:

Feedback has shown that our users would like to save selected events as their 'favorites'.
1. On the Event Detail view, add a heart button which the user may tap to set or unset each
event as a favorite - this can be seen in the comp below (Event Details with Favorite)
2. The Search Results view should reflect the user's chosen favorited events as per the comp
below (Search Results with Favorites)
3. Favorited results should be saved between launches of the app (i.e. this data should be
persisted)

## Requirements Assumptions:

1.  **Heart button location**: Based on the provided comp, it is unclear whether the heart button
in the EventTileView should have its location tied to the tile or to the image. The difference
becomes apparent when an event has a long title, increasing the size of the EventTileView.
Currently the heart button is tied to the upper-left corner of the EventTileView.
3.  **Navigation bar animation**: The requirements do specify whether the navigation bar on the 
EventList should have a static appearance. When the search bar is focused, the app's appearance
matches the provided comp. When the search bar is not focused, the navigation bar has additional
appearance modifications and animations not specified in the requirements.

## Future Improvements:

1.  **Persisting favorite events**: Currently the app uses UserDefaults to persist favorite events and
does not scale well. A user who favorites hundreds or thousands of events will eventually run into 
issues with this implementation. Users are also unable to un-favorite events that do not appear in
their search results. Because of this, a users persisted favorited events can grow silently (e.g. events
that are in the past but that were not un-favorited will remain in the UserDefaults).
2.  **View reusability**: Some views should be refactored to be more reusable should the scope of the
project expand. For example, the struct ToggleFavoriteView could be more easily reused if its current
dependency on the EventsViewModel was removed. One way to remove this dependency would be to
initialize the ToggleFavoriteView with a new closure that would be called on the tap gesture.
3.  **Requesting events**: The app does not attempt to limit the number of network requests that are 
made in quick succession. Refactoring the app to use Combine's 'switchToLatest' operator would
help eliminate stale requests.
4.  **Query text**: The user text is currently unmodified before being used in the api call. This should 
be changed to improve search functionality for the user. For example, currently when a user types a 
query with a space, the api returns an empty result because spaces are not supported. The query should
be modified in the app to replace or remove spaces before being sent to the api.


## App Screenshots:
<img src="https://user-images.githubusercontent.com/60911262/165000007-79a0b917-c235-4acb-9fd1-43f19009dd2a.PNG" width="231" height="500"> <img src="https://user-images.githubusercontent.com/60911262/165000006-d6d49c3b-8819-4733-97e1-5d7b2aa540de.PNG" width="231" height="500"> <img src="https://user-images.githubusercontent.com/60911262/165000001-7b61cf55-aee3-4982-b2d1-b45cb28eaa54.PNG" width="231" height="500">
