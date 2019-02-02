#
# Public Domain
#

jmptable_addr = 0xa250
switch_info = idaapi.get_switch_info_ex(jmptable_addr)
element_num = switch_info.get_jtable_size()
element_size = switch_info.get_jtable_element_size()
jump_table = list()
for num in range(0, element_num):
	table_entry = switch_info.jumps + num * element_size
	addr = idc.GetManyBytes(table_entry, element_size)
	jump_table.append(hex(struct.unpack("<L", addr)[0]))
