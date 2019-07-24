public class Map1 {
 public map<string,string> ravi {set;get;}
 public map<string,string> ravi1 {set;get;}
 public string name {set;get;}
 public string city {set;get;}
 public string find {set;get;}
 public string result {set;get;}
 public Map1(){
 ravi=new map<string,string>();
 ravi1=new map<string,string>();
 ravi.put('ravi','hyd');
 ravi.put('kot','ban');
 ravi.put('kotesh','sec');
 ravi.put('Gangu','pak');
 }
 public void create(){
 ravi.put(name,city);
 }
 public void search(){
 result=ravi.get(find);
}
 public void modify(){
 result=ravi.get(find);
 name=find;
 city=result;
 }
 public void save(){
 ravi.put(name,city);
 }
 public void savenew(){
 ravi.put(name,city);
 name=null;
 city=null;
 }
 public void del(){
 result=ravi.get(find);
 ravi1.put(find,result);
 ravi.remove(find);
 }
 public void undel(){
 result=ravi1.get(find);
 ravi.put(find,result);
 ravi1.remove(find);
 }
}