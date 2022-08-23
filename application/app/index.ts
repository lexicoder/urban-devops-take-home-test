import * as express from 'express';
import 'express-async-errors';
import * as prom from 'prom-client'

const app = express();

const collectDefaultMetrics = prom.collectDefaultMetrics;
const Registry = prom.Registry;
const register = new Registry();
collectDefaultMetrics({ register });

app.get('/', (req: express.Request, res: express.Response) => {
  const response = {
    hostname: req.hostname,
    uptime: process.uptime(),
    podname: process.env.HOSTNAME,
  };

  res.status(200).send(response);
});

app.get('/metrics', async (req: express.Request, res: express.Response) => {
  res.setHeader('Content-Type', register.contentType);
  res.send(await register.metrics());
});

app.listen(3000, () => {
  console.log('listening on 3000');
});
