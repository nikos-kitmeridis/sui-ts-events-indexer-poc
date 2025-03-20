
import { SuiEvent } from '@mysten/sui/client';
import { prisma, Prisma } from '../db';

export const handleDummyEvents = async (events: SuiEvent[], type: string) => {
  const eventsByType = new Map<string, any[]>();
  
  for (const event of events) {
    if (!event.type.startsWith(type)) throw new Error('Invalid event module origin');
    const eventData = eventsByType.get(event.type) || [];
    eventData.push(event.parsedJson);
    eventsByType.set(event.type, eventData);
  }

  await Promise.all(
    Array.from(eventsByType.entries()).map(async ([eventType, events]) => {
      const eventName = eventType.split('::').pop() || eventType;
      switch (eventName) {
        case 'InitEvent':
          // TODO: handle InitEvent
          await prisma.initEvent.createMany({
            data: events as Prisma.InitEventCreateManyInput[],
          });
          console.log('Created InitEvent events');
          break;
        case 'TriggerEvent':
          // TODO: handle TriggerEvent
          await prisma.triggerEvent.createMany({
            data: events as Prisma.TriggerEventCreateManyInput[],
          });
          console.log('Created TriggerEvent events');
          break;
        default:
          console.log('Unknown event type:', eventName);
      }
    }),
  );
};
