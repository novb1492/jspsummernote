package enums;

public enum StringsEnums {
	start("start"),
	end("end"),
	flag("flag"),
	article("article"),
	coment("coment");

    private String messege;

    StringsEnums(String messege){
        this.messege=messege;
    
    }
    public String getString() {
        return messege;
    }
}
