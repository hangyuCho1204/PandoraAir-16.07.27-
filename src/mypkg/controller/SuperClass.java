package mypkg.controller;

public class SuperClass {

	public void GotoPage(String className, String where) {
		int lastDot = className.lastIndexOf(".") ; //마지막 dot의 위치		
		//클래스 이름을 소문자로 변환
		String myClass = className.substring( lastDot + 1 ).toLowerCase() ; 
		
		if( myClass.startsWith("member")){			
		}else if( myClass.startsWith("board")){			
		}
	}
}