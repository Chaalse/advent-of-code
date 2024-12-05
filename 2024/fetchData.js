import dotenv from "dotenv";
import axios from "axios";
import fs from "fs";

dotenv.config()

const day = process.argv[2];

if (!day) {
    console.error('Please provide a "day" argument.');
    process.exit(1);
}

const url = `https://adventofcode.com/2024/day/${day}/input`;
const headers = {
    'Cookie': process.env.SESSION_COOKIE
};

async function fetchDataAndWriteToFile() {
    try {
        const response = await axios.get(url, { headers });
        const inputData = response.data;

        const filename = `input${day}.txt`;

        fs.writeFile(filename, JSON.stringify(inputData, null, 2), (err) => {
            if (err) {
                console.error('Error writing to file:', err);
            } else {
                console.log(`Data written to file: ${filename}`);
            }
        });
    } catch (error) {
        console.error('Error fetching data:', error);
    }
}

fetchDataAndWriteToFile();
