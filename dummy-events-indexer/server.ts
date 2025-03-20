
import express from 'express';
import cors from 'cors';
import { prisma } from './db';

const app = express();
app.use(cors());
app.use(express.json());

// Event query endpoints
app.get('/events/dummy/init-event', async (req, res) => {
      try {
        const events = await prisma.initEvent.findMany();
        res.json(events);
      } catch (error) {
        console.error('Failed to fetch dummy-InitEvent:', error);
        res.status(500).json({ error: 'Failed to fetch events' });
      }
    });

app.get('/events/dummy/trigger-event', async (req, res) => {
      try {
        const events = await prisma.triggerEvent.findMany();
        res.json(events);
      } catch (error) {
        console.error('Failed to fetch dummy-TriggerEvent:', error);
        res.status(500).json({ error: 'Failed to fetch events' });
      }
    });

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
