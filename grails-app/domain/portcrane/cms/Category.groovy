package portcrane.cms

class Category implements Comparable {
    String name
    SortedSet children
    SortedSet contents
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
    @Override
    int compareTo(Object c) {
        return this.id.compareTo(((Category)c).id)
    }

}
