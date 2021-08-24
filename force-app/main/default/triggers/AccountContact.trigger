trigger AccountContact on Account (after insert, after update) {
if(!System.isFuture() && !System.isBatch())
AccountProcessor.countContacts(trigger.newmap.keyset());
}