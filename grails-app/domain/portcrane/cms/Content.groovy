package portcrane.cms

class Content implements Comparable{
    String title
    String body
    static belongsTo = [parent:Category]
    static constraints = {
        body(maxSize:100000)
        body(blank:true)
        title(blank: false)
        parent(blank:false)
    }

    @Override
    int compareTo(Object o) {
        return this.id.compareTo(((Content)o).id)
    }
}
