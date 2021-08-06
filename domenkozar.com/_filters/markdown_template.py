import markdown
import logging

config = {
    'name': "Markdown",
    'description': "Renders markdown formatted text to HTML",
    'aliases': ['markdown']
    }


#Markdown logging is noisy, pot it down:
logging.getLogger("MARKDOWN").setLevel(logging.ERROR)


def run(content):
    return markdown.markdown(content,
                             ['headerid(level=3)', 'codehilite(noclasses=True,pygments_style=pastie,guess_lang=False)'],
                             output_format="html5")
