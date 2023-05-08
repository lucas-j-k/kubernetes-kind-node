/**
 * Sender
 * Simple function which calls the exposed api pod via http
 */

import axios from "axios";
import dotenv from "dotenv";

dotenv.config();

const CRON_SEND_LIMIT = parseInt(process.env.CRON_SEND_LIMIT || "1", 10);
const API_SERVICE = process.env.API_SERVICE;

console.log("Env vars: ", { CRON_SEND_LIMIT, API_SERVICE });

(async () => {
  console.log(`Job running ${new Date()}`);
  try {
    for (let i = 1; i <= CRON_SEND_LIMIT; i += 1) {
      const payload = `datapoint_${i}`;
      await axios.get(`http://${API_SERVICE}:80/log?data=${payload}`); // call port 80 since we exposed that port in the service. Although it forwards to port 3000 on the API pod/app where express is running
    }
  } catch (e) {
    console.log("Error :: ", e);
    process.exit(1);
  }
})();
