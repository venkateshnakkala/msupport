global class WarehouseSyncSchedule implements schedulable {
global void execute(SchedulableContext sc){
WarehouseCalloutService.runWarehouseEquipmentSync();
}
}