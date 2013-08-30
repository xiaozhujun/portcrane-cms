package portcrane.cms

class Category {
    String name
    static belongsTo = [parent:Category]
    static hasMany = [children:Category,contents:Content]
    static constraints = {
        name(unique: true)
        parent(blank: true)
        children(blank:true)
        contents(blank:true)
    }
    String toString(){
        return this.name
    }
}
