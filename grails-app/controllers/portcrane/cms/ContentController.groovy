package portcrane.cms

import org.codehaus.groovy.grails.test.io.SystemOutAndErrSwapper
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.MultipartFile
import grails.converters.*

import java.text.SimpleDateFormat

class ContentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contentInstanceList: Content.list(params), contentInstanceTotal: Content.count()]
    }

    def create() {
        [contentInstance: new Content(params)]
    }

    def save() {
        def contentInstance = new Content(params)
        if (!contentInstance.save(flush: true)) {
//            render(view: "create", model: [contentInstance: contentInstance])
            redirect(url: "/")
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'content.label', default: 'Content'), contentInstance.title])
//        redirect(action: "show", id: contentInstance.id)
       redirect(url: "/")
    }

    def show(Long id) {
        def contentInstance = Content.get(id)
        if (!contentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), contentInstance.title])
//            redirect(action: "list")
            redirect(url: "/")
            return
        }

        [contentInstance: contentInstance]
    }

    def edit(Long id) {
        def contentInstance = Content.get(id)
        if (!contentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), contentInstance.title])
//            redirect(action: "list")
            redirect(url: "/")
            return
        }

        [contentInstance: contentInstance]
    }

    def update(Long id, Long version) {
        def contentInstance = Content.get(id)
        if (!contentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), contentInstance.title])
//            redirect(action: "list")
            redirect(url: "/")
            return
        }

        if (version != null) {
            if (contentInstance.version > version) {
                contentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'content.label', default: 'Content')] as Object[],
                        "Another user has updated this Content while you were editing")
//                render(view: "edit", model: [contentInstance: contentInstance])
                redirect(url: "/")
                return
            }
        }

        contentInstance.properties = params

        if (!contentInstance.save(flush: true)) {
//            render(view: "edit", model: [contentInstance: contentInstance])
            redirect(url: "/")
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'content.label', default: 'Content'), contentInstance.title])
//        redirect(action: "show", id: contentInstance.id)
        redirect(url: "/")
    }

    def delete(Long id) {
        def contentInstance = Content.get(id)
        if (!contentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), contentInstance.title])
//            redirect(action: "list")
            redirect(url: "/")
            return
        }

        try {
            contentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'content.label', default: 'Content'), contentInstance.title])
//            redirect(action: "list")
            redirect(url: "/")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'content.label', default: 'Content'), contentInstance.title])
//            redirect(action: "show", id: id)
            redirect(url: "/")
        }
    }
    def upload() {
        def file = request.getFile("upfile");
        def savePath = this.getFolder("upload")
        String fileName = file.getOriginalFilename();
        file.transferTo(new File(this.getPhysicalPath(savePath), fileName));
        def url = savePath + "/" + fileName;
        String result = "{'original':'"+fileName+"'" +
                ",'url':'"+url+"'" +
                ",'title':'"+request.getParameter("pictitle")+"'" +
                ",'state':'"+"SUCCESS"+"'}";
        render result as String
    }
    private String getPhysicalPath(String path) {
        String servletPath = this.request.getServletPath();
        String realPath = this.request.getSession().getServletContext()
                .getRealPath(servletPath);
        return new File(realPath).getParent() +"/" +path;
    }
    private String getFolder(String path) {
        SimpleDateFormat formater = new SimpleDateFormat("yyyyMMdd");
        path += "/" + formater.format(new Date());
        File dir = new File(this.getPhysicalPath(path));
        if (!dir.exists()) {
            dir.mkdirs();
        }
        return path;
    }
}
