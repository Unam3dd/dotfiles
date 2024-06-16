import gdb

class findAddress(gdb.Command):

    def __init__(self):
        super(findAddress, self).__init__("fa", gdb.COMMAND_USER)

    def invoke(self, args, fromtty):
        argv = gdb.string_to_argv(args)
        
        if len(argv) != 1:
            print('[-] fa <target>')
            return

        progspace = gdb.current_progspace()
        target = int(argv[0], 16)
        
        if progspace.is_valid() == False:
            print('[-] Progspace is not valid')
            return

        print('[\033[34m+\033[00m] Current progspace \033[34m{}\033[00m'.format(gdb.current_progspace().filename))

        name_space = progspace.solib_name(target)

        if name_space:
            print('[\033[34m+\033[00m] \033[34m{}\033[00m Found \033[00m at \033[34m{}\033[00m'.format(hex(target), name_space))
        else:
            print('[\033[31m-\033[00m] \033[34m{}\033[00m Not Found \033[00m'.format(hex(target)))


if __name__ == "__main__":
    findAddress()
