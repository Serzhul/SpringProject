package model;

public class User 
{
    private String id;
    
    private String name;
    
    private String admin;
    
    public User(String id, String name)
    {
        this.id = id;
        this.name = name;
    }
    
    public User(String id, String name, String admin)
    {
        this.id = id;
        this.name = name;
        this.admin = admin;
    }

    public String getAdmin()
    {
        return admin;
    }
    
    public String getId()
    {
        return id;
    }
    
    public String getName()
    {
        return name;
    }
    
}
