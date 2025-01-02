# Real-time Multi-user Chat Room

This was a for fun 4 hour evening project to see how much elixir and phoenix I could learn to try get a basic multiuser chat-room set up.

This might evolve further if I decided to make a basic react frontend to help the visuals, or if I handle user authentication.

Heres a poorly visualised demonstration through images
![image](https://github.com/user-attachments/assets/d5b9331d-1ba8-47bc-bd7f-a3178125fe98)
![image](https://github.com/user-attachments/assets/6da5e0eb-1c5f-4079-9dd9-45d9e8a33854)


This has been containerised such that it can be ran with a simple:

```bash
docker-compose up
```

command.

Once this runs, in your browser visit:
```
localhost:4000/test.html
```
in multiple tabs or instances, and you should see the realtime application functioning, hopefully.

There is a basic test-suite set up to be run with:
```bash
mix test
```
