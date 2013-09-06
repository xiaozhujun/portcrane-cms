package portcrane.cms

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*

class CategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [categoryInstanceList: Category.list(params), categoryInstanceTotal: Category.count()]
    }

    def create() {
        [categoryInstance: new Category()]
    }

    def save() {
        def categoryInstance = new Category(params)
        if (!categoryInstance.save(flush: true)) {
//            render(view: "create", model: [categoryInstance: categoryInstance])
            redirect(url: "/")
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.name])
//        redirect(action: "show", id: categoryInstance.id)
        redirect(url: "/")
    }

    def show(Long id) {
        def categoryInstance = Category.get(id)
        if (!categoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.name])
//            redirect(action: "list")
            redirect(url: "/")
            return

        }

        [categoryInstance: categoryInstance]
    }

    def edit(Long id) {
        def categoryInstance = Category.get(id)
        if (!categoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.name])
//            redirect(action: "list")
            redirect(url: "/")
            return
        }

        [categoryInstance: categoryInstance]
    }

    def update(Long id, Long version) {
        def categoryInstance = Category.get(id)
        if (!categoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.name])
//            redirect(action: "list")
            redirect(url: "/")
            return
        }

        if (version != null) {
            if (categoryInstance.version > version) {
                categoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'category.label', default: 'Category')] as Object[],
                          "Another user has updated this Category while you were editing")
                redirect(url: "/")
//                render(view: "edit", model: [categoryInstance: categoryInstance])
                return
            }
        }

        categoryInstance.properties = params

        if (!categoryInstance.save(flush: true)) {
//            render(view: "edit", model: [categoryInstance: categoryInstance])
            redirect(url: "/")
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.name])
//        redirect(action: "show", id: categoryInstance.id)
        redirect(url: "/")
    }

    def delete(Long id) {
        def categoryInstance = Category.get(id)
        if (!categoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.name])
//            redirect(action: "list")
            redirect(url: "/")
            return
        }

        try {
            categoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.name])
//            redirect(action: "list")
            redirect(url: "/")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.name])
//            redirect(action: "show", id: id)
            redirect(url: "/")
        }
    }

    String result
    int leftPadding
    def get() {
        result = ""
        leftPadding = 0
        Category root = Category.get(0)
        getAll(root)
        render result as String
    }

    private void getAll(obj){
        if (obj instanceof Content) {
            result += '<div class="bullet" url="/portcrane-cms/content/show/'+ obj.id +'">'+ obj.title +'</div>'
        } else if (obj instanceof Category) {
            result +=
                '<div class="treeItem">' +
                    '<div class="itemTitle titleShow">' +
                        '<div class="bullet" url="/portcrane-cms/category/show/'+ obj.id +'">'+ obj.name +'</div>' +
                    '</div>' +
                    '<div class="itemContent contentShow">'
            if (obj.children) {
                for (Category child in obj.children) {
                    leftPadding++
                    getAll(child)
                    leftPadding--
                }
            }
            if (obj.contents) {
                for (Content content in obj.contents) {
                    leftPadding++
                    getAll(content)
                    leftPadding--
                }
            }
            result += '</div>' +
                    '</div>'
        }
    }
}
