# Avent of Code

Repository with AoC templates and solutions from 2024 and on.
There's a NodeJs script that fetches the input for each day and stores it in a ".txt" file

## Usage

To use the fetchData script you need Node version >= 16.13

To download project dependencies perform npm install within the 2024 folder.

The request must be authenticated with a session cookie, you can get that inspecting the
network tab of your browser where you access an input in the official site. Once you've got it
you must place it inside a ".env" file within the folder, or straight place it next to the
"Cookie" attribute if you don't plan to publish your code.

To fetch the input use node fetchData.js Day (i.e: node fetchData.js 1)

Your input will be downloaded and a CLI message will tell you so.

And that's all folks!

## License

[MIT](https://choosealicense.com/licenses/mit/)
