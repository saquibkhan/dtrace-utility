#!/usr/sbin/dtrace -qs

syscall::pollsys:entry
/arg0 && arg1/
{
    self->in_pollsys = 1;
        self->pfds_user = arg0;
        self->fds_cnt = (int)arg1;
        this->pfds= (struct pollfd*) copyin(self->pfds_user, sizeof(struct pollfd));

        printf("ENTRY pid: %d Pollsys thread = %d npfds = %d\n",
          pid, tid, arg1);

        printf("%s:%s fd = %d, events = %x, revents = %x\n",
          probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print = (int)arg1 - 1;
}

syscall::pollsys:entry
/self->fds_print/
{
        self->next = self->fds_cnt-self->fds_print;
    this->pfds= (struct pollfd*) copyin((uintptr_t)((char *)self->pfds_user + 
      self->next * sizeof(struct pollfd)),
      sizeof(struct pollfd));

    printf("%s:%s fd = %d, events = %x, revents = %x\n",
      probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print--;
}

syscall::pollsys:entry
/self->fds_print/
{
    self->next = self->fds_cnt-self->fds_print;
    this->pfds= (struct pollfd*) copyin((uintptr_t)((char *)self->pfds_user + 
      self->next * sizeof(struct pollfd)),
      sizeof(struct pollfd));

    printf("%s:%s fd = %d, events = %x, revents = %x\n",
      probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print--;
}

syscall::pollsys:entry
/self->fds_print/
{
    self->next = self->fds_cnt-self->fds_print;
    this->pfds= (struct pollfd*) copyin((uintptr_t)((char *)self->pfds_user + 
      self->next * sizeof(struct pollfd)),
      sizeof(struct pollfd));

    printf("%s:%s fd = %d, events = %x, revents = %x\n",
      probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print--;
}

syscall::pollsys:entry
/self->fds_print/
{
    self->next = self->fds_cnt-self->fds_print;
    this->pfds= (struct pollfd*) copyin((uintptr_t)((char *)self->pfds_user + 
      self->next * sizeof(struct pollfd)),
      sizeof(struct pollfd));

    printf("%s:%s fd = %d, events = %x, revents = %x\n",
      probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print--;
}
syscall::pollsys:entry
/self->fds_print/
{
    self->next = self->fds_cnt-self->fds_print;
    this->pfds= (struct pollfd*) copyin((uintptr_t)((char *)self->pfds_user + 
      self->next * sizeof(struct pollfd)),
      sizeof(struct pollfd));

    printf("%s:%s fd = %d, events = %x, revents = %x\n",
      probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print--;
}

syscall::pollsys:return
/self->in_pollsys/
{
        printf ("RETURN pid: %d Pollsys thread = %d returns %d:%d\n", pid, tid, arg0, arg1);
        this->pfds= (struct pollfd*) copyin(self->pfds_user, sizeof(struct pollfd));

    printf("%s:%s fd = %d, events = %x, revents = %x\n",
      probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print = (int)self->fds_cnt - 1;
        self->in_pollsys = 0;

}

syscall::pollsys:return
/self->fds_print/
{
    self->next = self->fds_cnt-self->fds_print;
    this->pfds= (struct pollfd*) copyin((uintptr_t)((char *)self->pfds_user + 
      self->next * sizeof(struct pollfd)),
      sizeof(struct pollfd));

    printf("%s:%s fd = %d, events = %x, revents = %x\n",
      probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print--;
}

syscall::pollsys:return
/self->fds_print/
{
    self->next = self->fds_cnt-self->fds_print;
    this->pfds= (struct pollfd*) copyin((uintptr_t)((char *)self->pfds_user + 
      self->next * sizeof(struct pollfd)),
      sizeof(struct pollfd));

    printf("%s:%s fd = %d, events = %x, revents = %x\n",
      probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print--;
}

syscall::pollsys:return
/self->fds_print/
{
    self->next = self->fds_cnt-self->fds_print;
    this->pfds= (struct pollfd*) copyin((uintptr_t)((char *)self->pfds_user + 
      self->next * sizeof(struct pollfd)),
      sizeof(struct pollfd));

    printf("%s:%s fd = %d, events = %x, revents = %x\n",
      probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print--;
}

syscall::pollsys:return
/self->fds_print/
{
    self->next = self->fds_cnt-self->fds_print;
    this->pfds= (struct pollfd*) copyin((uintptr_t)((char *)self->pfds_user + 
      self->next * sizeof(struct pollfd)),
      sizeof(struct pollfd));

    printf("%s:%s fd = %d, events = %x, revents = %x\n",
      probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print--;
}

syscall::pollsys:return
/self->fds_print/
{
    self->next = self->fds_cnt-self->fds_print;
    this->pfds= (struct pollfd*) copyin((uintptr_t)((char *)self->pfds_user + 
      self->next * sizeof(struct pollfd)),
      sizeof(struct pollfd));

    printf("%s:%s fd = %d, events = %x, revents = %x\n",
      probefunc, probename,
      this->pfds->fd, this->pfds->events, this->pfds->revents);

        self->fds_print--;
}
