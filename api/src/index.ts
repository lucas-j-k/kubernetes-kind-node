/**
 * Express Server Entrypoint
 */

import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';

dotenv.config();

const app: Express = express();
const port = process.env.PORT;

app.get("/log", (req: Request, res: Response) => {
  const { data } = req.query;
  console.log(`Data received :: ${data} at ${new Date()}`);
  res.status(200).json({ data: 'success'});
});

app.get("/status", (req: Request, res: Response) => {
  res.status(200).json({ data: 'Server Healthcheck succeeded' });
});

app.listen(port, () => {
  console.log(`[server]: Express Server is running at http://localhost:${port}`);
});
