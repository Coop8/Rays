# Rays
Rays is a weather app built using Swift and SwiftUI. I used the api from openweathermap.org as it was free and easy to setup. The app follows the MVVM pattern. I did follow a [tutorial](https://youtu.be/KI6Yf7VMefc) for this app, however I made some changes along the way in terms of UI and features. 

Some things that I changed from the tutorial include:

 - The UI
	 - I added a separate view for the city view as well as a separate conditions view. I wanted to do this as I believed it to be more visually appealing. Also this isolates the current city, temperature, and date as this is the most important information for a weather app. I wanted that info to be easier to see with less cluster.
	 - I decided to not use Lottie files as I wanted a more minimalistic UI. Instead I opted to use Apple's SFSymbols.
	 - I redesigned the search bar to try and achieve the native Apple look, however this forced me to remove the location button. In it's place I added a magnifying glass icon to better symbolize that is is a search bar.
	 - I added a light and dark mode, pictured below. This was at first difficult to do as I was approaching it wrong, however a friend pointed me to some of his code which allowed me to add this feature better.
	 ![](https://github.com/Coop8/Rays/blob/main/rayspics/DarkvsLight.png)
	 - Small adjustments such as aligning the headers to left of the views instead of the center, combining all week days into one view, and adding shadows here and there.
 - The Code
	 - I had to update the API call code as it was outdated.
	 - I added the chance of precipitation as the tutorial was using dew_point instead.

Some things that I would like to add/change in the future include:

 - Use the newly introduced CoreWeather from Apple instead of openweathermap.org
 - Add the ability to store cities and come back to them as you like, like Apple's weather app
 - Add a widget using WidgetKit
 - Add user settings for preferences such as Metric/Imperial units and themes
 - Update the UI a bit more to make it more visually appealing
