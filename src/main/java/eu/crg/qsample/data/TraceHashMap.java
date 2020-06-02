package eu.crg.qsample.data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class TraceHashMap<K, V> extends HashMap<K, V> {

	public List<V> toList() {
		List<V> list = new ArrayList<>();
		Iterator<?> it = this.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<K, V> pair = (Map.Entry) it.next();
			list.add((V) pair.getValue());
		}
		return list;
	}
}
