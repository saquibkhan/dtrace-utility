#!/usr/sbin/dtrace -qs

syscall::pollsys:entry
/execname == "node"/
{
        printf("\npolling %d file descriptors/sockets\n", arg1);
        self->pfds = (struct pollfd *) copyin(arg0, sizeof(struct pollfd)*arg1);
        self->savedpfds = (struct pollfd *)arg0;
    self->pfdcnt = arg1;

    print(self->pfds[0]);
    print(self->pfds[1]);
    print(self->pfds[2]);
    print(self->pfds[3]);
    print(self->pfds[4]);
}

syscall::pollsys:return
/self->savedpfds/
{
        printf("\npoll returning %d events\n", arg1);

        self->pfds = (struct pollfd *) copyin((uintptr_t)self->savedpfds, sizeof(struct     
pollfd)*self->pfdcnt);
    print(self->pfds[0]);
    print(self->pfds[1]);
    print(self->pfds[2]);
    print(self->pfds[3]);
    print(self->pfds[4]);
}
