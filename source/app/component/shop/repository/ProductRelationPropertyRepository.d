module app.component.shop.repository.ProductRelationPropertyRepository;

import hunt.entity;
import std.json;
import hunt.util.serialize;
import hunt.logging;
public import app.component.shop.model.ProductRelationProperty;
public import app.component.shop.model.ShopPropertyOption;

class ProductRelationPropertyRepository:EntityRepository!(ProductRelationProperty ,int)
{
    ProductRelationProperty[] findAllByProdcutId(int productId)
    {
        return findAll(new Condition(" %s =  %s " , Field.product_id , productId));
    }

    bool removeAllByProductId(int productId)
    {
        auto res = findAll(new Condition(" %s =  %s " , Field.product_id , productId));
        this.removeAll(res);
        return true;
    }

    JSONValue[] findChecked(int productId, ShopPropertyOption[] propertyOptions)
    {
        JSONValue[] returnData;
        auto relations = findAll(new Condition(" %s =  %s " , Field.product_id , productId));
        foreach(propertyOption; propertyOptions)
        {
            JSONValue tmp;
            tmp = toJson(propertyOption);
            tmp["is_checked"] = 0;
            tmp["input"] = "";
            foreach(relation; relations)
            {
                if(relation.property_option_id == propertyOption.id){
                    tmp["is_checked"] = 1;
                    tmp["input"] = relation.property_input;
                    break;
                }
            }
            returnData ~= tmp;
        }

        logInfo(returnData);
        return returnData;
    }
    ProductRelationProperty[] findInputsByProductId(int productId)
    {
        return findAll(new Condition(" %s =  %s and property_option_id = 0 " , Field.product_id , productId));
    }
}