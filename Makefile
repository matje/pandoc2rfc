# Pandoc
XML=middle.xml back.xml
RFC=DISPLAY= xml2rfc template.xml

all:	draft.txt draft.html

%.xml:	%.mkd transform.xsl
	pandoc -t docbook -s $< | xsltproc transform.xsl - > $@

draft.txt:	$(XML) template.xml
	$(RFC) $@

draft.html: 	$(XML) template.xml
	$(RFC) $@

clean:
	rm -f $(XML)

realclean:	clean
	rm -f draft.txt draft.html
