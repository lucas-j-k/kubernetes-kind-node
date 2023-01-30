/**
 * Express Server Entrypoint
 */

import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';

dotenv.config();

const app: Express = express();
const port = process.env.PORT;

app.get("/", (req: Request, res: Response) => {
  res.status(200).json({ data: 'This is a response from the node api endpoint at root /'});
});

app.get("/status", (req: Request, res: Response) => {
  console.log('Status endpoint hit');
  res.status(200).json({ data: 'Server Healthcheck succeeded' });
});

app.listen(port, () => {
  console.log(`[server]: Express Server is running at http://localhost:${port}`);
});
