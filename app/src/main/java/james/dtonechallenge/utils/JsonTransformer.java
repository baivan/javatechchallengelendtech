
package james.dtonechallenge.utils;

import com.google.gson.Gson;
import spark.ResponseTransformer;

/**
 *
 * @author james
 */

public class JsonTransformer implements ResponseTransformer {

    private final Gson gson = new Gson();

    @Override
    public String render(Object model) {
        return gson.toJson(model);
    }

}
