
package cn.itcast.common.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LIST {
/*public static void main(String[] args) {
	HashMap<String,Integer> map=new HashMap<>();
	//默认添加三对夫妻
	map.put("张爱岗", 35 );
	map.put("李诚实", 23);
	 
 System.out.println(map.toString()+map.get("张爱岗"));
		
 }*/
	
	
	
    public static void main(String[] args) {
        Map<String, Integer> map = new HashMap<String, Integer>(); 
        //抓取量存放 key：c_2018-09-27_18729  value：count
         map.put("c_2018-09-27_18729",10);
         map.put("c_2018-09-26_18729", 20);
         map.put("c_2018-09-27_18730", 11);
         map.put("c_2018-09-25_18730", 5);
         List<Integer> lists= getLikeByMap(map,"_18730");
       
      for(int i=0;i<lists.size();i++) {
    	  System.out.println(lists.toString()+"string");
      }
 
             //输入的      //显示的
      for (String key : map.keySet()) {
          System.out.println("key:" + key + ",value:" + map.get(key));
      }
      
      
      
      
      
         
      }
      /**
       * Map集合模糊匹配
       * @param map  map集合
       * @param keyLike  模糊key
       * @return
       */
      public static List<Integer> getLikeByMap(Map<String, Integer> map, String keyLike){
          List<Integer> list=new ArrayList<>();
          for (Map.Entry<String, Integer> entity : map.entrySet()) {
              if(entity.getKey().indexOf(keyLike)>-1){
                  list.add((Integer) entity.getValue());
              }

          }
       
          return list;
      }
   
	
	
	
	
	/*
      var name= $(this).val();
      var num=0;
       遍历用户 
      if(name!='' ){
          var html='';
          for (var i=0;i<users.length;i++){
              if(users[i].indexOf(name)>-1){
                  html += "<li>" +users[i]+"</li>";
                  num++;
              }
              if(num>9){
                  break;
              }
          }
	
	
	
	
	*/
	
	
}
