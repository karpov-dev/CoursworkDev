public without sharing class ProductManager {

    public static List<Product2> getProductsByRequestString(String requestString) {
        if (String.isBlank(requestString)) return new List<Product2>();
        try{
            return Database.query(requestString);
        } catch (Exception e){
            return new List<Product2>();
        }

    }

    public static Integer getMaxFieldInternalValue(String fieldName) {
        if (String.isBlank(fieldName)) return -1;

        String request = 'SELECT ' + fieldName + ' FROM Product2 ORDER BY ' + fieldName + ' DESC LIMIT 1';
        List<Product2> products = ProductManager.getProductsByRequestString(request);
        if (products.isEmpty()) return -1;
        Object obj = products[0].get(fieldName);
        return Integer.valueOf(obj);
    }

    public static Decimal getMaxUnitPrice() {
        List<PricebookEntry> prices = [SELECT UnitPrice FROM PricebookEntry ORDER BY UnitPrice DESC LIMIT 1];
        if (prices.size() > 0) return prices[0].UnitPrice; else return -1;
    }
}