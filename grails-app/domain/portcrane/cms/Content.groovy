package portcrane.cms

class Content implements Comparable{
    String title
    String body
    static belongsTo = [parent:Category]
    static constraints = {
        body(maxSize:100000)
    }

    @Override
    int compareTo(Object o) {
        return this.id.compareTo(((Content)o).id)
    }
}
