package Model;

public class PatentDTO {
    
	private String num;
    private String ipc;
    private String title;
    private String abs;
    private float sim;
    
    public PatentDTO() {}
    
    public PatentDTO(String num, String ipc, String title, String abs, float sim) {
        super();
        this.num = num;
        this.ipc = ipc;
        this.title = title;
        this.abs = abs;
        this.sim = sim;
    }
    
    public String getNum() {
        return num;
    }
    public void setNum(String num) {
        this.num = num;
    }
    public String getIpc() {
        return ipc;
    }
    public void setIpc(String ipc) {
        this.ipc = ipc;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getAbs() {
        return abs;
    }
    public void setAbs(String abs) {
        this.abs = abs;
    }
    public float getSim() {
        return sim;
    }
    public void setSim(float sim) {
        this.sim = sim;
    }
    
    
}