@isTest
public with sharing class AnimalLocatorTest {
    @isTest
     static void testGetCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(1);
        String expectedResult = 'Chicken';
        System.assertEquals(result,expectedResult);
        result = AnimalLocator.getAnimalNameById(4);
        expectedResult = 'Could not find an Animal with a matching ID';
        System.assertEquals(result,expectedResult);
    }
}