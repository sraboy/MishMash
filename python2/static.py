import angr
import logging
import os         # to get the file name
import importlib  # use reflection to try to get relocation type's name
from operator import itemgetter # for Table.SortData

l = logging.getLogger('angr.static')
l.setLevel(logging.DEBUG)

DATA_TYPES = ['hex', 'int', 'text']
# TODO: addr type where Table auto-sets width to binary.arch.bits / 4
# TODO: make this a dict with key='type',val='fmtstring'
class Column:
    def __init__(self, name, dataorder, datatype, displayorder, width, pad, headertext, align, truncate):
        '''
        Makes a column with required formatting values. NOTE: Don't add default arguments here
        as this is not user-facing. Table sets default values as the UI component.
        '''
        self.Name               = name
        self.DataOrder          = dataorder
        self.DataType           = datatype
        self.DisplayOrder       = displayorder
        self.Width              = max(width, len(headertext)) + 2
        self.Pad                = pad
        self.HeaderText         = headertext
        self.Align              = align   
        self.TruncateStrings    = truncate

        if self.TruncateStrings == True:
            l.debug('Truncating strings to %d chars. Old header: %s. New Header: %s', self.Width, headertext, self.HeaderText[:self.Width])
            self.HeaderText = self.HeaderText[:width]
            self.Width = len(self.HeaderText)

    def SetWidth(self, value): # TODO: increase width up to max width: min(maxwidth, value)
        if not self.TruncateStrings:
            #l.debug('SetWidth() max(old: %d. new: %d)', self.Width, value)
            self.Width = max(self.Width, value)

    @property
    def DataFormatString(self):
        align = '<' # Default left

        if self.Align == 'center':
            align = '^'
        elif self.Align == 'right':
            align = '>'

        trunc = '.' + str(self.Width) if self.TruncateStrings else ''
        fmtstring = '{:' + align + str(self.Width) + trunc + '}'

        return fmtstring

    def FormatString(self, data):
        """Formats the data based on the specified type, mostly needed to print hex values with padding."""
        try:
            if self.DataType == 'text':
                return str(self.DataFormatString.format(str(data)))
            elif self.DataType == 'int':
                numfmt = ('{num:#0' + str(self.Pad) + 'd}').format(num=int(data))
                return str(self.DataFormatString.format(numfmt))
            elif self.DataType == 'float':
                numfmt = ('{num:#0' + str(self.Pad) + 'f}').format(num=int(data))
                return str(self.DataFormatString.format(numfmt))
            elif self.DataType == 'hex':
                numfmt = ('{num:#0' + str(self.Pad) + 'x}').format(num=int(data))
                return str(self.DataFormatString.format(numfmt))
        except ValueError:
            l.error('Failed to parse %s as %s with %s', str(data), self.DataType, self.DataFormatString)

class Table:
    def __init__(self, title, columndefs, rows, border=' | ', displayheader=True, sort=None):
        """
        Does things
        """
        self.Border = border
        self.Title          = title
        self.Data           = rows
        self.Columns        = self._build_columns(columndefs)
        self.SortedColumns  = self._sort_columns()
        self.DisplayHeader  = displayheader
        self.Sort           = sort
        self.SortedRows     = self.SortData(sort)
        
    def _sort_columns(self):
        """
        Sort columns by their specified DisplayOrder. This is a method rather
        than a property because it's used too often
        """
        linecol = {}
        for k,v in self.Columns.items():
            linecol[v.DisplayOrder] = v

        return linecol

    # TODO: Move all these defaults into Column
    def _build_columns(self, columndefs):
        columns = {}
        for idx, col in enumerate(columndefs):
            name            = col['name']         if 'name'         in col else 'Column' + str(idx)
            datatype        = col['datatype']     if 'datatype'     in col else 'text'
            dataorder       = col['dataorder']    if 'dataorder'    in col else idx
            displayorder    = col['displayorder'] if 'displayorder' in col else dataorder
            headertext      = col['headertext']   if 'headertext'   in col else name
            align           = col['align']        if 'align'        in col else 'left'
            width           = col['width']        if 'width'        in col else len(headertext)
            pad             = col['pad']          if 'pad'          in col else 0
            truncate        = col['truncate']     if 'truncate'     in col else False

            columns[name] = Column( name        = name,
                                    dataorder   = dataorder,
                                    datatype    = datatype,
                                    displayorder= displayorder,
                                    headertext  = headertext,
                                    align       = align,
                                    width       = width,
                                    pad         = pad,
                                    truncate    = truncate, )
        return columns

    def _build_column_headers(self):
        """
        Builds the column headers
        """
        line = self.Border
        for k,v in self.SortedColumns.items():
            line += ('{:^' + str(v.Width) + '}{}').format(v.HeaderText, self.Border)

        return line

    def _build_table_header(self, width):
        hdr = ('-' * width) + '\n'
        trunc = '.' + str(width - (len(self.Border) * 2))
        hdr += ('{}{:^' + str(width - (len(self.Border) * 2)) + trunc + '}{}\n').format(self.Border, self.Title, self.Border)
        hdr += ('-' * width)
        return hdr

    def _build_table_text(self):
        line = ''
        for row in self.SortedRows:
            line += self.Border

            # We print our rows by SortedColumns order but retrieve them by the DataOrder
            for k,v in self.SortedColumns.items():
                data = row[v.DataOrder]
                line += v.FormatString( data )
                line += self.Border

            line += '\n'
        return line[:-1] # dump the last newline

    def SortData(self, sortColumn):
        rows = []

        for r in self.Data:
            row = []
            for k,v in self.SortedColumns.items():
                data = r[v.DataOrder]
                fmt = v.FormatString(data)
                dlen = len(fmt)
                v.SetWidth(dlen)    # TODO: This seems dirty...
                row.append( data )

            rows.append(row)

        sortcol = self.Columns[sortColumn].DisplayOrder
        self.SortedRows = sorted(rows, key=itemgetter(sortcol))
        return self.SortedRows

    def PrintTable(self,):
        if self.DisplayHeader:
            colhdr = self._build_column_headers() # Have to build these first so we know if we have to truncate
            print self._build_table_header(width=len(colhdr))
            print colhdr
            print '-' * len(colhdr)
     
        print self._build_table_text()
        print '-' * len(colhdr)

def GetDefaultColumnDefs(addrpadbytes):
    return {
    'ImportColumnDefs': [
        {'name': 'Symbol Name',     'datatype': 'text', 'dataorder': 0, 'displayorder':0, 'align':'right',  },
        {'name': 'Dest Addr',       'datatype': 'hex',  'dataorder': 1, 'displayorder':1, 'align':'center', 'pad': addrpadbytes },
        {'name': 'Linked Addr',     'datatype': 'hex',  'dataorder': 2, 'displayorder':2, 'align':'center', 'pad': addrpadbytes },
        {'name': 'Rebased Addr',    'datatype': 'hex',  'dataorder': 3, 'displayorder':3, 'align':'center', 'pad': addrpadbytes },
        {'name': 'Relocation Type', 'datatype': 'text', 'dataorder': 4, 'displayorder':4, },
    ],
    'RelocColumnDefs': [
        {'name': 'Symbol Name',     'datatype': 'text', 'dataorder': 0, 'displayorder':0, 'align':'right',  },
        {'name': 'Dest Addr',       'datatype': 'hex',  'dataorder': 1, 'displayorder':1, 'align':'center', 'pad': addrpadbytes },
        {'name': 'Linked Addr',     'datatype': 'hex',  'dataorder': 2, 'displayorder':2, 'align':'center', 'pad': addrpadbytes },
        {'name': 'Rebased Addr',    'datatype': 'hex',  'dataorder': 3, 'displayorder':3, 'align':'center', 'pad': addrpadbytes },
        {'name': 'Relocation Type', 'datatype': 'text', 'dataorder': 4, 'displayorder':4, },
    ],
    'SectionsListColumnDefs': [
        {'name': 'Name',      'datatype': 'text', 'dataorder': 0, 'displayorder':0, 'align':'right',  },
        {'name': 'Offset',    'datatype': 'hex',  'dataorder': 1, 'displayorder':1, 'align':'center', 'pad': addrpadbytes },
        {'name': 'Virt Addr', 'datatype': 'hex',  'dataorder': 2, 'displayorder':2, 'align':'center', 'pad': addrpadbytes },
        {'name': 'Size',      'datatype': 'int',  'dataorder': 3, 'displayorder':3, 'align':'center' },
        {'name': 'Mem Size',  'datatype': 'int',  'dataorder': 4, 'displayorder':4, 'align':'center' },
        {'name': 'Align',     'datatype': 'int',  'dataorder': 5, 'displayorder':5, 'align':'center' },
        {'name': 'Entry Size','datatype': 'int',  'dataorder': 6, 'displayorder':6, 'align':'center' },
        {'name': 'Flags',     'datatype': 'hex',  'dataorder': 7, 'displayorder':7, 'align':'center', 'width': addrpadbytes },
        {'name': 'Type',      'datatype': 'text', 'dataorder': 8, 'displayorder':8, 'align':'left',  },
        # TODO: link, info, get flags text (has to be added to Backend)
    ],
    'BinaryPropertiesListColumnDefs': [
        {'name': 'Property', 'datatype': 'text', },
        {'name': 'Value',    'datatype': 'text', },
    ],}

class StaticAnalysis:
    """
    Generates pretty-printable ASCII tables to ease the static analysis of the binary.
    """
    def __init__(self, binary, columndefs=None):
        """
        :param cle.backends.Backend binary:  The |cle backend| object to analyze
        """
        self.main_object = binary
        self._addrBits = binary.arch.bits / 4
        self.ColumnDefs = columndefs if columndefs is not None else GetDefaultColumnDefs(self._addrBits)
        self.Tables = self.BuildTables()

    def BuildTables(self):
        tables = {}
        tables['relocs']   = Table('Relocations',       self.ColumnDefs['RelocColumnDefs'], rows=self.RelocsList,  sort='Symbol Name')
        tables['imports']  = Table('Imports',           self.ColumnDefs['ImportColumnDefs'], rows=self.ImportsList, sort='Rebased Addr')
        tables['sections'] = Table('Sections',          self.ColumnDefs['SectionsListColumnDefs'], rows=self.SectionsList, sort='Name')
        tables['binprops'] = Table('Binary Properties', self.ColumnDefs['BinaryPropertiesListColumnDefs'], rows=self.BinaryPropertiesList, sort='Property')
        return tables

    @property
    def RelocsList(self):
        relocs = []

        mod = importlib.import_module('.%s' % self.main_object.relocs[0].arch.name.lower(), 'cle.backends.relocations')
        l.debug('Loaded module: %s', mod.__name__)

        #def GetRelocTypeName(r):    # HACK: So ugly... we should save the relocation type's name in Relocation
        #    types = ''
        #    for name,obj in vars(mod).items():
        #        if type(r) == getattr(mod, name):
        #            #l.debug('%s is %s', str(name), str(obj))
        #            types += name + ' or '
        #    return types[:-4]
        for r in self.main_object.relocs:
            s = r.symbol
            #relocs.append( [s.name, r.dest_addr, s.linked_addr, s.rebased_addr, GetRelocTypeName(r)] )
            relocs.append( [s.name, r.dest_addr, s.linked_addr, s.rebased_addr, type(r).__name__] )
        return relocs

    @property
    def ImportsList(self):
        imports = []

        for k,v in self.main_object.imports.items():
            r = v
            s = r.symbol
            imports.append( [s.name, r.dest_addr, s.linked_addr, s.rebased_addr, type(r).__name__] )

        return imports

    @property
    def SectionsList(self):
        sections = []
        for s in self.main_object.sections:
           sections.append( [s.name, s.offset, s.vaddr, s.filesize, s.memsize, s.align, s.entsize, s.flags, s.type] )
        return sections

    @property
    def BinaryPropertiesList(self):
        props = []
        b = self.main_object
        bits = b.arch.bits
        addrfmt = ('{num:#0' + str(self._addrBits) + 'x}')
        name = os.path.split(b.binary)[1]   # HACK(ish): This works on Windows and *nix but breaks on paths ending in '/'. Do we care?
        props.append( [ 'Filename',     str(name) ] )
        props.append( [ 'Arch',         str(b.arch)[6:-1] ] ) # Dumps the < and > and strips "Arch" from the beginning
        props.append( [ 'Bitness',      str(bits) ] )
        props.append( [ 'OS',           str(b.os) ] )
        props.append( [ 'PIC/PIE',      str(b.pic) ] )
        props.append( [ 'Linked Base',  addrfmt.format(num=int(b.linked_base)) ] )
        props.append( [ 'Mapped Base',  addrfmt.format(num=int(b.mapped_base)) ] )
        props.append( [ 'Linking',      str(b.linking) ] )
        l.debug('Got props %s', str(props))
        return props

    def ShowTable(self, tablename):
        self.Tables[tablename.lower()].PrintTable()

def test():
    pd = angr.Project('./led-kmod.ko')
    ps = angr.Project('./somelib.o')
    pl = angr.Project('./ls.coreutils')

    sd = StaticAnalysis(pd.loader.main_object)
    ss = StaticAnalysis(ps.loader.main_object)
    sl = StaticAnalysis(pl.loader.main_object)

    sd.ShowTable('binprops')
    sd.ShowTable('sections')
    sd.ShowTable('imports')
    sd.ShowTable('relocs')

    sl.ShowTable('binprops')
    sl.ShowTable('sections')
    sl.ShowTable('imports')
    sl.ShowTable('relocs')

    ss.ShowTable('binprops')
    ss.ShowTable('sections')
    ss.ShowTable('imports')
    ss.ShowTable('relocs')


ps = angr.Project('/bin/ls')
ss = StaticAnalysis(ps.loader.main_object)
ss.ShowTable('binprops')
ss.ShowTable('sections')
ss.ShowTable('imports')
ss.ShowTable('relocs')





'''
TODO
    filter (data or display?)
 from main_obj:
    segments
    sections_map
    resolved_imports (probably just filter on imports)
    irelatives
    jmprel
    deps
    execstack
    provides

 extra:
    strings
    symbols

PART DONE:
    imports     - tag resolved
    sections    - parse flags based on bin type


DONE:
    os
    linking
    linked_base
    pic
    arch
    mapped_base
    relocs
'''

def print_resolved_imports(project, skipEmptyName=False, sort=None):
    rimps = project.loader.main_object.resolved_imports:

    if sort = 'name':
        rimps = sorted(rimps.items(), key=operator.itemgetter(1)
    for s in project.loader.main_object.resolved_imports:
        fmtdict

    header = '{:^32}  |  {:^16}  |  '.format("Symbol Name", "Symbol Address")
    print header
    print '-'*len(header)

    for s in project.loader.main_object.resolved_imports:
        if skipEmptyName and s.name == '':
            continue
        print "%-32s at 0x%08x" % (s.name, s.addr)
