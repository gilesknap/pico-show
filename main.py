import select
import sys

import PicoOled13

# Set up the poll object
poll_obj = select.poll()
poll_obj.register(sys.stdin, select.POLLIN)


def main():
    # Initialize the display
    display = PicoOled13.get()
    display.clear()
    display.text("Listening ...", 0, 0, 0xFFFF)
    display.show()

    sys.stdout.write("awaiting data ...\r")

    line = 0

    while True:
        # Wait for input on stdin, waiting for 1000 ms
        poll_results = poll_obj.poll(1000)
        if poll_results:
            # Read the data from stdin (read data coming from PC)
            data = sys.stdin.readline().strip()
            sys.stdout.write("received data: " + data + "\r")

            # Write the data to the display
            if len(data) > 0:
                if line == 0:
                    display.clear()
                display.text(data, 0, line * 10, 0xFFFF)
                line = (line + 1) % 7  # wrap around after 7 lines
                display.show()


main()
