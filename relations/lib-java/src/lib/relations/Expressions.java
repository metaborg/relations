package lib.relations;

import java.util.Collection;
import java.util.HashSet;

public class Expressions {
	  public static <E> Collection<E> toCollection(E e)
	  { 
	    Collection<E> collection = new HashSet<E>();
	    collection.add(e);
	    return collection;
	  }
	  
	  public static <E> E choice(E e1, E e2){
		  return e1!=null?e1:e2;
	  }
	  
	  public static <E> Collection<E> choice(Collection<E> e1, E e2){
		  return e1!=null&&e1.size()>0?e1:toCollection(e2);
	  }
	  
	  public static <E> Collection<E> choice(E e1, Collection<E> e2){
		  return e1!=null?toCollection(e1):e2;
	  }
	  
	  public static <E> Collection<E> choice(Collection<E> e1, Collection<E> e2){
		  return e1!=null&&e1.size()>0?e1:e2;
	  }
}