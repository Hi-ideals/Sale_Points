package com.hiideals



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured;

@Secured(["ROLE_ADMIN"])
@Transactional(readOnly = true)
class ProductsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def userService
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Products.findAllByAdminId(SecUser.findByUsername(userService.getUsername()).adminId), model:[productsInstanceCount: Products.count()]
    }

    def show(Products productsInstance) {
        respond productsInstance
    }

    def create() {
	
        respond new Products(params)
    }

    @Transactional
    def save(Products productsInstance) {
        if (productsInstance == null) {
            notFound()
            return
        }

        if (productsInstance.hasErrors()) {
            respond productsInstance.errors, view:'create'
            return
        }
		productsInstance.setAdminId(SecUser.findByUsername(userService.getUsername()).adminId)
        productsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                 flash.message = "Product Created Successfully"
                redirect productsInstance
            }
            '*' { respond productsInstance, [status: CREATED] }
        }
    }

    def edit(Products productsInstance) {
        respond productsInstance
    }

    @Transactional
    def update(Products productsInstance) {
        if (productsInstance == null) {
            notFound()
            return
        }

        if (productsInstance.hasErrors()) {
            respond productsInstance.errors, view:'edit'
            return
        }

        productsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                 flash.message = "Product Updated Successfully"
                redirect productsInstance
            }
            '*'{ respond productsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Products productsInstance) {

        if (productsInstance == null) {
            notFound()
            return
        }

        productsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Products.label', default: 'Products'), productsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'products.label', default: 'Products'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

