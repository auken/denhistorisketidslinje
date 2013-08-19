package net.auken.dht

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.web.context.request.RequestContextHolder
import org.springframework.web.context.support.WebApplicationContextUtils
import org.xhtmlrenderer.pdf.ITextRenderer
import org.xhtmlrenderer.resource.XMLResource

class UtilController {

    def groovyPagesTemplateEngine
    def grailsApplication

    def testActionOne() {
        File file = new File('/home/intelligrape/Desktop/test/dht1.html')
        String htmlText = file.text
        htmlText = htmlText.replaceAll('/dht/images', 'images')
        htmlText = htmlText.replaceAll('/dht/css', 'css')
        htmlText = htmlText.replaceAll('/dht/js', 'js')
        byte[] pdfDocumentInBytes = renderPdf(htmlText)
        response.setContentLength(pdfDocumentInBytes.size())
        response.setHeader("Content-disposition", "attachment; filename=pdfDoc.pdf")
        response.setContentType('application/pdf')
        OutputStream out = response.getOutputStream()
        out.write(pdfDocumentInBytes)
        out.flush()
        out.close()
    }

    def testActionTwo() {
        String htmlText = params.htmlText
        htmlText = htmlText.replaceAll('/dht/images', 'images')
        htmlText = htmlText.replaceAll('/dht/css', 'css')
        htmlText = htmlText.replaceAll('/dht/js', 'js')
        htmlText = "<html>" + htmlText + "</html>"
        htmlText = fixTheHtmlText(htmlText)
        byte[] pdfDocumentInBytes = renderPdf(htmlText)
        response.setContentLength(pdfDocumentInBytes.size())
        response.setHeader("Content-disposition", "attachment; filename=pdfDoc")
        response.setContentType('application/pdf')
        OutputStream out = response.getOutputStream()
        out.write(pdfDocumentInBytes)
        out.flush()
        out.close()
    }

    String fixTheHtmlText(String htmlText) {
        String newHtmlText

        return newHtmlText
    }

    def renderPdf(String html) {
        ITextRenderer renderer = new ITextRenderer()
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()
        def doc = XMLResource.load(new ByteArrayInputStream(html.replaceAll('&', '&amp;').replaceAll('&amp;#', '&#').getBytes("UTF-8"))).getDocument()
        renderer.setDocument(doc, null)
        renderer.layout()
        renderer.createPDF(byteArrayOutputStream)
        return byteArrayOutputStream.toByteArray()
    }

    private def renderHtml(String view, Map model) {
        def webRequest = RequestContextHolder.getRequestAttributes()
        if (!webRequest) {
            def servletContext = ServletContextHolder.getServletContext()
            def applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext)
            webRequest = grails.util.GrailsWebUtil.bindMockWebRequest(applicationContext)
        }

        def originalOut = webRequest.out
        try {
            def sw = new StringWriter()
            def pw = new PrintWriter(sw)
            webRequest.out = pw
            groovyPagesTemplateEngine.createTemplate("${view}").make(model).writeTo(pw)
            return sw.toString()
        } finally {
            webRequest.out = originalOut
        }
    }

    public void downloadPdf(byte[] data, String fileName, String contentType) throws Exception {
        response.setHeader("Content-disposition", "attachment;filename=" + fileName)
        response.setContentType(contentType)
        OutputStream out = response.getOutputStream();
        out.write(data);
        out.flush();
        out.close()
    }

    def createPdf(Long id) {
        String bodyHtml = params.bodyHtml
        bodyHtml = bodyHtml.replaceAll('.png"', '.png"/')
        bodyHtml = bodyHtml.replaceAll('&nbsp;', '')
        String htmlText = renderHtml('/util/gameBoardPdf.gsp', [bodyHtml: bodyHtml])
        htmlText = htmlText.replaceAll('/dht', grailsApplication.config.grails.serverURL as String)
        htmlText = htmlText.replaceAll('&nbsp;', ' ')
        downloadPdf(renderPdf(htmlText), "gameBoard.pdf", "application/pdf")
    }
}