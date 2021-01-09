import { by, element } from 'protractor';

export default {
  shipmentPickup: element(by.css('#pickupOptions')),
  shipmentPickupLabel: element(by.css('#pickupOptionsLabel')),
  schedulePickup: element(by.css('[for="pickupOptionCONTACT_FEDEX_TO_SCHEDULE"]')),
  alreadySchedulePickup: element(by.css('label[for="pickupOptionUSE_SCHEDULED_PICKUP"]'))
};
