package portcrane.cms

class Content {
    String title
    String body
    static belongsTo = [parent:Category]
    static constraints = {
    }
}
