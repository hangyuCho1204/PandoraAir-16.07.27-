package mypkg.controller;

public class SuperClass {

	public void GotoPage(String className, String where) {
		int lastDot = className.lastIndexOf(".") ; //������ dot�� ��ġ		
		//Ŭ���� �̸��� �ҹ��ڷ� ��ȯ
		String myClass = className.substring( lastDot + 1 ).toLowerCase() ; 
		
		if( myClass.startsWith("member")){			
		}else if( myClass.startsWith("board")){			
		}
	}
}