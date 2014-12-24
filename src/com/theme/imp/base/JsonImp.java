package com.theme.imp.base;

import java.util.List;
import java.util.Map;

@SuppressWarnings("hiding")
public interface JsonImp<Object> {
	public Object listToJSON(List<Object> list) ;
	public Object objectToJSON(Object t) ;
	public Object arrayToJSON(Object[] t ) ;
	public Map<String, Object> toMap();
}
